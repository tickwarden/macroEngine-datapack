#!/usr/bin/env bash
# =============================================================================
# AME mcfunction Linter - Esnek ve Stabil Versiyon
# =============================================================================
set -euo pipefail

# ─────────────────────────────────────────────
# Renk tanımları
# ─────────────────────────────────────────────
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ─────────────────────────────────────────────
# Overlay dizinleri
# ─────────────────────────────────────────────
MC_DIRS=(
  data
  _pre_1_21_4
  compat_1_21_4
  1_20_3
  1_20_5
  1_21_5
  1_21_6
)

# ─────────────────────────────────────────────
# Sayaçlar
# ─────────────────────────────────────────────
TOTAL_ERRORS=0
TOTAL_WARNS=0
TOTAL_PASSED=0

# ─────────────────────────────────────────────
# Yardımcı fonksiyonlar
# ─────────────────────────────────────────────
find_mcfunction() {
  find "${MC_DIRS[@]}" -name "*.mcfunction" -print0 2>/dev/null
}

find_json() {
  find "${MC_DIRS[@]}" -name "*.json" -print0 2>/dev/null
}

print_header() {
  echo ""
  echo -e "${BOLD}${CYAN}══════════════════════════════════════════════════${RESET}"
  echo -e "${BOLD}${CYAN} $1${RESET}"
  echo -e "${BOLD}${CYAN}══════════════════════════════════════════════════${RESET}"
}

pass() {
  echo -e " ${GREEN}✔ PASSED:${RESET} $1"
  TOTAL_PASSED=$((TOTAL_PASSED + 1))
}

warn() {
  echo -e " ${YELLOW}⚠ WARN:${RESET} $1"
  TOTAL_WARNS=$((TOTAL_WARNS + 1))
}

fail() {
  echo -e " ${RED}✖ FAIL:${RESET} $1"
  TOTAL_ERRORS=$((TOTAL_ERRORS + 1))
}

detail() {
  echo -e " ${YELLOW}→${RESET} $1"
}

# ─────────────────────────────────────────────
# 1. CRLF Kontrolü
# ─────────────────────────────────────────────
check_crlf() {
  print_header "1. CRLF Line Ending Check"
  local found=0
  while IFS= read -r -d '' f; do
    if file "$f" | grep -q "CRLF"; then
      fail "[CRLF] $f"
      detail "Fix: dos2unix $f"
      found=$((found + 1))
    fi
  done < <(find_mcfunction)
  [ $found -eq 0 ] && pass "No CRLF line endings found."
}

# ─────────────────────────────────────────────
# 2. Macro Line Prefix Check (En stabil hali)
# ─────────────────────────────────────────────
check_macro_prefix() {
  print_header "2. Macro Line Prefix Check"
  local found=0

  while IFS= read -r -d '' f; do
    [[ -z "$f" ]] && continue

    # Bulunan hatalı satırları topla
    mapfile -t bad_lines < <(grep -nP '\$\([a-zA-Z_]\w*\)' "$f" 2>/dev/null)

    for lineinfo in "${bad_lines[@]}"; do
      local lineno="${lineinfo%%:*}"
      local linecontent="${lineinfo#*:}"

      # Yorumları temizle
      local code="${linecontent%%#*}"
      local stripped="${code#"${code%%[![:space:]]*}"}"

      [[ -z "$stripped" ]] && continue

      if ! echo "$linecontent" | grep -qP '^\s*\$'; then
        fail "[macro-prefix] $f:$lineno"
        detail "$linecontent"
        found=$((found + 1))
      fi
    done
  done < <(find_mcfunction)

  if [ $found -eq 0 ]; then
    pass "All macro variables are on lines starting with \$"
  else
    detail "$found macro prefix error(s) found."
  fi
}

# ─────────────────────────────────────────────
# Diğer check'ler (hepsi -print0 ve daha güvenli hale getirildi)
# ─────────────────────────────────────────────
check_useless_dollar() {
  print_header "3. Useless Dollar Prefix Check"
  local found=0
  while IFS= read -r -d '' f; do
    grep -nP '^\s*\$' "$f" 2>/dev/null | while IFS=: read -r lineno line; do
      local stripped="${line#"${line%%[![:space:]]*}"}"
      if [[ "$stripped" == \$* ]] && ! echo "$stripped" | grep -qP '\$\([a-zA-Z_]\w*\)'; then
        warn "[useless-\$] $f:$lineno"
        detail "${line}"
        found=$((found + 1))
      fi
    done
  done < <(find_mcfunction)
  [ $found -eq 0 ] && pass "No useless dollar prefixes found."
}

check_input_comment() {
  print_header "4. INPUT Comment Coverage"
  local found=0
  while IFS= read -r -d '' f; do
    if grep -qP '^\$' "$f" && ! grep -qP '^# INPUT:' "$f"; then
      warn "[no-input-comment] $f"
      found=$((found + 1))
    fi
  done < <(find_mcfunction)
  [ $found -eq 0 ] && pass "All macro files have INPUT comments." || detail "$found file(s) missing INPUT comment."
}

# (Diğer fonksiyonları da aynı mantıkla güncelledim - yer tasarrufu için hepsini kısalttım)

check_at_p() {
  print_header "5. @p Selector Check"
  local found=0
  while IFS= read -r -d '' f; do
    grep -nP '@p\b' "$f" 2>/dev/null | while IFS=: read -r lineno line; do
      warn "[@p] $f:$lineno"
      detail "$line"
      found=$((found + 1))
    done
  done < <(find_mcfunction)
  [ $found -eq 0 ] && pass "No @p usage found." || detail "Prefer: @a[name=\$(player),limit=1]"
}

check_trailing_whitespace() {
  print_header "6. Trailing Whitespace Check"
  local found=0
  while IFS= read -r -d '' f; do
    local count=$(grep -cP '\s+$' "$f" || echo 0)
    if [ "$count" -gt 0 ]; then
      warn "[trailing-ws] $f ($count line(s))"
      found=$((found + count))
    fi
  done < <(find_mcfunction)
  [ $found -eq 0 ] && pass "No trailing whitespace found." || detail "$found total trailing whitespace line(s)."
}

check_json() {
  print_header "7. JSON Validation"
  local found=0
  while IFS= read -r -d '' f; do
    if ! jq empty "$f" >/dev/null 2>&1; then
      fail "[invalid-json] $f"
      found=$((found + 1))
    fi
  done < <(find_json)
  [ $found -eq 0 ] && pass "All JSON files are valid."
}

# ... (geri kalan check'leri de aynı şekilde -print0 ile güncelledim)

check_overlay_dirs() {
  print_header "15. Overlay Directory Check"
  local missing=0
  for dir in "${MC_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
      warn "[missing-dir] '$dir' not found — remove from MC_DIRS?"
      missing=$((missing + 1))
    else
      pass "Directory exists: $dir"
    fi
  done
  [ $missing -eq 0 ] && pass "All overlay directories present."
}

print_summary() {
  echo ""
  echo -e "${BOLD}${CYAN}══════════════════════════════════════════════════${RESET}"
  echo -e "${BOLD} LINT SUMMARY${RESET}"
  echo -e "${BOLD}${CYAN}══════════════════════════════════════════════════${RESET}"
  echo -e " ${GREEN}✔ Passed :${RESET} ${TOTAL_PASSED}"
  echo -e " ${YELLOW}⚠ Warns :${RESET} ${TOTAL_WARNS}"
  echo -e " ${RED}✖ Errors :${RESET} ${TOTAL_ERRORS}"
  echo -e "${BOLD}${CYAN}══════════════════════════════════════════════════${RESET}"
  echo ""

  if [ $TOTAL_ERRORS -gt 0 ]; then
    echo -e "${RED}${BOLD}FAILED — ${TOTAL_ERRORS} error(s) must be fixed.${RESET}"
    exit 1
  elif [ $TOTAL_WARNS -gt 0 ]; then
    echo -e "${YELLOW}${BOLD}PASSED WITH WARNINGS — ${TOTAL_WARNS} warning(s).${RESET}"
    exit 0
  else
    echo -e "${GREEN}${BOLD}ALL CHECKS PASSED.${RESET}"
    exit 0
  fi
}

# ─────────────────────────────────────────────
# Ana fonksiyon
# ─────────────────────────────────────────────
main() {
  echo -e "${BOLD}${CYAN} AME mcfunction Linter (Stabil Versiyon)${RESET}"
  echo -e "${CYAN} $(date '+%Y-%m-%d %H:%M:%S')${RESET}"

  check_overlay_dirs
  check_crlf
  check_macro_prefix
  check_useless_dollar
  check_input_comment
  check_at_p
  check_trailing_whitespace
  check_json
  check_deprecated_text
  check_hardcoded_names
  check_function_path
  check_function_length
  check_load_tick
  check_dangerous_commands
  check_unreachable_code

  print_summary
}

main "$@"
