# Advanced Macro Engine — Changelog

---

## v3.0.2 — 2026-04-10

### ✨ Yeni

#### `queue/` — Multi-Cmd Kuyruk Yönetimi

| Fonksiyon | Açıklama |
|---|---|
| `queue/clear` | Tüm kuyruğu temizler |
| `queue/flush` | Kuyruktaki tüm komutları hemen çalıştırır |
| `queue/internal/exec_next` | Sıradaki komutu işler |
| `queue/internal/exec_as` | `execute as` context'iyle komut çalıştırır |
| `queue/internal/exec_fn` | Fonksiyon olarak kaydedilmiş komutu çalıştırır |

#### Trigger Yeniden Yazımı (Fix [#8])

`trigger/bind`, `trigger/bind_cmd`, `trigger/disable`, `trigger/enable`, `trigger/list`, `trigger/unbind`, `trigger/unbind_all` alt dosyaları kaldırıldı. Yerini unified `trigger.mcfunction` (dispatch hub) ve yeni `trigger/execute.mcfunction` + `trigger/internal/dispatch.mcfunction` aldı.

#### `multi_cmd_adv.mcfunction`

Base ve `1_20_3` overlay'ine `cmd/other/multi_cmd_adv` eklendi.

#### `1_20_3` Hook Advancement'ları (Fix [#6])

`break_block`, `dimension_change`, `entity_kill`, `hero_of_the_village`, `item_use`, `killed_by_arrow`, `placed_block`, `trade` + `hidden/root` + `template/task|goal|challenge`

#### `1_20_3` Hook Olayları (Fix [#7])

`eat_food`, `fish_caught`, `interact_anvil`, `interact_shulker_box`, `player_death` advancement'ları + internal handler'lar: `on_eat`, `on_eat_fire`, `on_fish_caught`, `on_fish_fire`, `tick_scan` güncellemesi

#### `1_20_5` Hook Advancement'ları ve Olayları (Fix [#5])

Tüm hook advancement'ları + `player_death`. `on_open_chest`, `tick_scan`, `on_interact_anvil`, `on_interact_shulker_box`, `raycast/loop`, `raycast/start`, `bind_exec`, `unbind_exec`, `on_advancement_fire`, `on_eat`, `on_fish_caught`, `on_fish_fire` düzeltmeleri.

#### `spyglass.json`

Statik analiz yapılandırma dosyası eklendi.

### 🐛 Düzeltilen Hatalar

| Dosya | Düzeltme |
|---|---|
| `string/score_display` (base) | Yanlış çıktı düzeltildi |
| `tools/utils/input_check` (base, `1_20_3`) | Doğrulama mantığı düzeltildi |

### ⚙️ Değişiklikler

- `pack.mcmeta`: `1_20_3` overlay girişi eklendi; `supported_formats` aralığı güncellendi
- Tüm overlay'lerde versiyon stringleri `v3.0.2` olarak güncellendi

---

## v3.0.1 — 2026-04-09

### ✨ Yeni Fonksiyonlar

| Fonksiyon | Açıklama |
|---|---|
| `time/get_time` | Mevcut dünya zamanını (`daytime`, `total`, `day`) `macro:output`'a yazar |
| `time/time_phase` | Gün fazını döndürür (`day` / `night` / `sunrise` / `sunset`) |
| `hook/reset_all` | Tüm kayıtlı hook bind'larını temizler |

### 🐛 Düzeltilen Hatalar

| Hata | Düzeltme |
|---|---|
| Fix [#4]: `validate.mcfunction` ve `version_warn.mcfunction` load sırasında yanlış versiyon string'i gösteriyordu | Tüm overlay'lerde (`1_20_3`, `1_21_5`, `1_21_6`, `compat_1_21_4`, base) düzeltildi |
| Fix [#3]: `version.mcfunction` overlay'lerde versiyon uyuşmazlığı | Tüm overlay'lerde düzeltildi |
| Fix [#2]: `.gitignore` yanlış dosyayı track ediyordu | Düzeltildi |
| Fix [#1]: `.gitignore` dosyası sorunu | Düzeltildi |
| `docs/lib-player-cmd-string.md`: Yanlış parametre anahtarı belgelenmiş | Düzeltildi |

### ⚙️ Değişiklikler

- `cursor_item.mcfunction` → `cursor_item_exec.mcfunction`'dan yeniden adlandırıldı; mantık sadeleştirildi
- `inv/selected_item`, `inv/offhand_item`, `inv/chest_minecart_if_item`, `inv/chest_minecart_unless_item` — macro parametre işleme güncellendi
- Tüm overlay'lerde versiyon stringleri `v3.0.1` olarak güncellendi

---

## v3.0.0 — 2026-04-04

### 💥 Breaking Changes

- `rate_limit` modülü tamamen yeniden yazıldı. Eski alt fonksiyon tabanlı yapı kaldırıldı; artık saf scoreboard implementasyonu kullanılıyor (`check` / `tick` / `config` API). `1_20_3`, `1_21_5`, `1_21_6` overlay'lerinden `rate_limit` kaldırıldı — yalnızca base overlay üzerinden çalışıyor.

### ✨ Yeni

- `rate_limit` modülü: `check`, `tick`, `config` — sıfır alt fonksiyon, pure scoreboard
- `admin_systems.mcfunction` güncellendi

### ⚙️ Değişiklikler

- Load sistemi tüm overlay'lerde yeniden yapılandırıldı
- Versiyon stringleri `v3.0.0` olarak güncellendi

---

## v2.2.9 — 2026-04-04

### ✨ New Features

| Module | Functions | Description |
|---|---|---|
| `cooldown/` | `pause`, `resume` | Freezes an active cooldown and restores it later with the original remaining duration |
| `player/` | `is_flying` | Checks if a named player is currently flying (`abilities:{flying:1b}`) |
| `string/` | `repeat` + `internal/repeat_1..16` | Repeats a single character N times (1–16) into `macro:output result` |

---

## v2.2.8 — 2026-04-03

### ✨ Yeni Fonksiyonlar

#### `entity/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `entity/for_each_in_radius` | `{player, type, radius, func}` | — | Belirtilen `type` entity'lerini `player` etrafındaki `radius` blok içinde iterate eder ve her biri için `func`'ı çalıştırır. `entity/for_each`'in radius filtreli versiyonu. |

#### `player/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `player/is_on_ground` | `{player}` | `result` (1b/0b), `found` | `macro:is_on_ground` predicate ile oyuncunun yerde olup olmadığını kontrol eder. |
| `player/is_burning` | `{player}` | `result` (1b/0b), `found` | `macro:is_burning` predicate ile oyuncunun ateşte olup olmadığını kontrol eder. |

#### `inv/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `inv/offhand_item` | `{item, customData, invoke}` | — | Offhand slotunda belirtilen item + custom_data eşleşen tüm oyuncular için `invoke`'u çalıştırır. `inv/selected_item` (mainhand) ile aynı pattern. |

#### `world/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `world/get_time` | — | `daytime` (0–23999), `total`, `day` | Mevcut oyun saatini `macro:output`'a yazar. `daytime`: günün kaçıncı tick'i, `total`: toplam dünya yaşı, `day`: gün sayısı. |

---

## v2.2.7 — 2026-04-02

### ✨ Yeni Fonksiyonlar

#### `math/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `math/round` | `{value, step}` | `macro:output result` | `value`'yu en yakın `step` katına yuvarlar. Negatif değerler için sıfırdan uzağa yuvarlar. `step ≤ 0` ise `return fail`. |
| `math/sign_nonzero` | `{value}` | `macro:output result` | Negatifler için `-1`, sıfır ve pozitifler için `1` döndürür. Yön çarpanı gereken durumlarda `math/sign`'ın sıfır üretmediği alternatifi. |

#### `string/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `string/truncate` | `{player, text, suffix, truncated}` | `macro:output text` | Oyuncunun actionbar'ına text yazar; `truncated:1b` ise suffix ekler. mcfunction runtime'da string uzunluğu ölçemediğinden truncation kararı çağıran tarafından verilir. |
| `string/pluralize` | `{count, singular, plural}` | `macro:output result`, `macro:output count` | `count == 1` ise singular, aksi hâlde plural döndürür. |

#### `player/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `player/get_armor` | `{player}` | `result` (int), `toughness` (int ×1000), `found` | `minecraft:armor` ve `minecraft:armor_toughness` attribute base değerlerini döndürür. |
| `player/is_sneaking` | `{player}` | `result` (1b/0b), `found` | `macro:is_sneaking` predicate ile çömelme durumunu kontrol eder. |
| `player/is_sprinting` | `{player}` | `result` (1b/0b), `found` | `macro:is_sprinting` predicate ile sprint durumunu kontrol eder. |

#### `entity/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `entity/clear_effects` | `{type, tag}` | — | `type` + `tag` filtresiyle eşleşen tüm entity'lerden aktif efektleri temizler. |
| `entity/set_health` | `{type, tag, amount}` | — | Önce `instant_damage 255` ile HP'yi sıfırlar, ardından `instant_health` amplifier'ı `amount` olarak uygular. 1.20.5+ entity NBT direct write kaldırıldığından effect tabanlı yaklaşım kullanılır. |
| `entity/nearest` | `{player, type, radius, func}` | — | Oyuncuya en yakın `type` entity'yi bulur ve `func`'ı o entity olarak çalıştırır. |

#### `nbt/`

| Fonksiyon | Girdi | Açıklama |
|---|---|---|
| `nbt/merge` | `{src_storage, src_path, dst_storage, dst_path}` | `src_path` compound'ını `dst_path`'e merge eder; mevcut key'ler üzerine yazılır, eksik key'ler eklenir. |
| `nbt/first` | `{src_storage, src_path, dst_storage, dst_path}` | `src_path` listesinin `[0]` elemanını `dst_path`'e kopyalar. Liste boşsa sessizce başarısız olur. |

#### `flag/`

| Fonksiyon | Girdi | Çıkış | Açıklama |
|---|---|---|---|
| `flag/set_if` | `{key, score_holder, objective, matches}` | `macro:output result` | Scoreboard koşulu sağlanırsa flag'i set eder. `matches` MC range syntax'ını destekler (`1..`, `..0`, `2..5`). |
| `flag/any` | `{key_a, key_b}` | `result`, `result_a`, `result_b` | İki flag'den herhangi biri set edilmişse `result:1b` döndürür. Sonuç flag'leri doğrudan `macro:engine flags.*` üzerinden okunur (0b path bulunsa bile false negatif vermez). |

### 🐛 Düzeltilen Hatalar (yeni dosyalarda)

| Dosya | Hata | Düzeltme |
|---|---|---|
| `string/truncate` | `data get storage <string>` → her zaman 1 döner, uzunluk ölçmez | String length hesabı kaldırıldı; `truncated` parametresi çağıran tarafından belirlenir |
| `string/pluralize` | Storage key `_plr_p macro.tmp` → nokta path olarak parse edilir (`_plr_p.macro` compound, `tmp` inner key) | Key adları `_plr_singular` / `_plr_plural` olarak düzeltildi |
| `entity/set_health` | `data modify entity @s Health set value $(amount)f` → entity NBT direct write 1.20.5+ kaldırıldı | `instant_damage 255` + `instant_health $(amount)` effect zinciriyle değiştirildi |
| `flag/any` | `execute if data storage macro:output result_a` → path `0b` ile set edilmiş olsa bile varlık kontrolü `true` döner | `flags.$(key)` doğrudan scoreboard üzerinden kontrol edilecek şekilde yeniden yazıldı |

---

## v2.2.6 — 2026-03-30

### ♻️ 1.20.x Overlay (1_20_3) Eklendi
| Özellik | Açıklama |
|-----|----------|
| Overlay sistemi | `1_20_3` eklendi |
| Component → NBT | 1.21+ item components kaldırıldı |
| Legacy uyum | Tüm item işlemleri NBT tabanına geri alındı |
| İzolasyon | Overlay artık root pack’ten bağımsız |

### 🧩 Compatibility Fixes
| Sorun | Düzeltme |
|-----|----------|
| Predicates "Not a json array" hatası | Array formatına çevrildi |
| Loot table parse hataları | 1.20.3 formatına uyarlandı |
| Advancement display hataları | `icon` → `item` düzeltildi |
| Version mismatch | v2.2.4 kalıntıları temizlendi |

### 📦 Data Pack Structure
| Sorun | Düzeltme |
|-----|----------|
| Yanlış klasör isimleri | 1.20.x çoğul yapı düzeltildi (`functions`, `loot_tables`, vb.) |
| Modern klasör kalıntıları | Overlay içinden kaldırıldı |
| pack.mcmeta uyumsuzluğu | 1.20.3 formatına uyarlandı |

### 🐛 Bug Fixes
| Bug | Düzeltme |
|-----|----------|
| `minecraft:test_block` hatası | Kaldırıldı |
| Bozuk JSON dosyaları | Düzeltildi |
| Predicate/loot parse crash'leri | Fixlendi |

### ⚙️ Internal
| Değişiklik | Açıklama |
|-----|----------|
| Version sistemi | `v2.2.6` olarak güncellendi |
| Debug kalıntıları | Temizlendi |
| Overlay yükleme | Stabil hale getirildi |

---
## v2.2.2
### ✨ Yeni `cmd/` komutları
 Komut | Parametreler |
|-----|----------|
| `cmd/swing` | {player,hand} |
| `cmd/time_of` | {clock,action,value} |
| `cmd/set_clock_rate` | {rate} |

### 🐛 Bug Fixes
 Bug | Düzeltme |
|-----|----------|
| `is_daytime.json` 26.1'da hata veriyordu | Düzeltildi |

---
## v2.2.1 — 2026-03-23
### 🐛 Bug Fixes
 Bug | Düzeltme |
|-----|----------|
| Gereksiz 'Bilinmeyen fonksiyon' hataları | Düzeltildi |
| Gereksiz `wand/register` hataları | Tüm satırlar yeniden yazıldı |
| Dialog yoksa sessiz fail hataları | Düzeltildi |

---

## v2.2.0-en — 2026-03-22
### Changes
- Translated all Turkish comments, docstrings, and in-game strings to English.

## v2.2.0-en — 2026-03-22

#### ✨ Yeni Modüller

| Modül | Açıklama |
|-------|----------|
| `lib/fiber/` | Kooperatif eş zamanlılık — `spawn`, `yield`, `resume`, `kill`, `is_alive` |
| `math/vec/` | 3B vektör aritmetiği — `add`, `sub`, `dot`, `cross`, `normalize`, `angle_between` |
| `geo/region_watch/` | Kalıcı bölge tetikleyicileri — `register`, `unregister`, `list`, `on_enter`, `on_leave` |
| `lib/batch/` | Tick'e yayılmış toplu işlem — `begin`, `add`, `flush`, `cancel` |

### ✨ `hook/` Genişletme

Yeni olay desteği: `dimension_change`, `trade`, `advancement:<id>` (özel advancement'lar için `on_advancement_fire` API'si).

### 🐛 Bug Fixes

| Bug | Düzeltme |
|-----|----------|
| `advancement/hook/trade.json` — `traded_with_villager` 1.21.x'te kaldırılmış | `villager_trade` yapıldı |
| `math/vec/internal/arccos_lookup` — trailing space after `..` | Tüm satırlar yeniden yazıldı |
| `math/vec/internal/angle_exec` — trailing space after `1001..` | Kaldırıldı |
| `geo/region_watch/internal/check_region` — space-separated NBT subpath | Dot notation (`_rw_cur.on_enter`) yapıldı |
| `lib/batch/internal/flush_loop` — space-separated NBT subpath | Dot notation yapıldı |
| `lib/batch/internal/add_exec` — space-separated NBT subpath | Dot notation yapıldı |

---

## v2.1.2 — 2026-03-19

### ✨ Yeni Modül: `wand/`

`carrot_on_a_stick` tabanlı sağ-tık wand sistemi. `minecraft:custom_data` ile tag'lenen item'lara fonksiyon veya komut bind edilebilir; birden fazla bind aynı tag'e eklenebilir.

#### Public Fonksiyonlar

| Fonksiyon | Girdi | Açıklama |
|---|---|---|
| `wand/register` | `{tag, func}` | Tag'e fonksiyon bind eder |
| `wand/register_cmd` | `{tag, cmd}` | Tag'e komut bind eder |
| `wand/unregister` | `macro:input {tag}` | Tag'e ait tüm bind'ları kaldırır |
| `wand/unregister_all` | — | Tüm wand bind'larını temizler |
| `wand/give` | `{player, tag, name}` | Oyuncunun mainhand'ine wand verir |
| `wand/give_custom` | `{player, item, tag, name, count}` | Özel item türüyle wand verir |
| `wand/give_lore` | `macro:input {player, tag, name, lore, color}` | Lore ile birlikte mainhand'e wand yazar (`item replace`) |
| `wand/has` | `{player, tag}` | Oyuncunun mainhand'inde belirli wand var mı → `macro:output result` |
| `wand/list` | — | Kayıtlı bind'ları `macro.debug` oyuncularına gösterir |
| `wand/cooldown_set` | `{player, tag, duration}` | Wand'a cooldown uygular |
| `wand/cooldown_check` | `{player, tag}` | Cooldown aktif mi → `macro:output result` |

#### İç Fonksiyonlar

| Fonksiyon | Açıklama |
|---|---|
| `wand/internal/tick_scan` | Her tick mainhand item'ı tarar, sağ-tık tespitinde dispatch çalıştırır |
| `wand/internal/dispatch` | Bind listesini iterate eder |
| `wand/internal/check_next` | Tek bind kaydını kontrol edip çalıştırır |
| `wand/internal/fire` | Bind func/cmd'yi çalıştırır |
| `wand/internal/check_item` | Mainhand'deki item'ın wand tag'ini doğrular |
| `wand/internal/unbind_check` | Unregister işlemi için eşleşen kaydı bulur |
| `wand/internal/unbind_filter` | Eşleşmeyen bind'ları yeni listeye kopyalar |
| `wand/internal/call_func` | Bind fonksiyonunu çalıştırır |
| `wand/internal/call_cmd` | Bind komutunu çalıştırır |
| `wand/internal/unregister_exec` | `wand/unregister` macro impl (`$(tag)`) |
| `wand/internal/give_lore_exec` | `wand/give_lore` macro impl |

Storage: `macro:engine wand_binds [{tag:"...", func/cmd:"..."}]`  
Tick: `macro:tick/player_systems` → `wand/internal/tick_scan`  
Scoreboard: `macro.rightClick` (`minecraft.used:minecraft.carrot_on_a_stick`)

#### ⚠️ `wand/unregister` — Tab-Complete Notu

`unregister` macro variable içerdiğinden Minecraft'ın `/function` tab-complete'i bu fonksiyonu gizliyordu. Macro impl `internal/unregister_exec`'e taşındı; public wrapper `$(` içermiyor — listede görünür.

#### `give` / `give_custom` — Overlay Temizliği

1.21.5+ artık `item_name` için JSON object formatı kullandığından `1_21_5` ve `1_21_6` overlay'lerindeki `give`/`give_custom` dosyaları kaldırıldı. Base fonksiyonlar doğrudan 1.21.5+ formatına yükseltildi. `compat_1_21_4` overlay'ine eski `'` string syntax ile `give`/`give_custom` eklendi.

---

### 🐛 Bug Fixes

#### `ame_load:load/internal/validate` — storage'daki eski versiyon mismatch
İlk satır `{version:"v2.1.2-pre1"}` yazıyordu. Önceki dünyadan kalan storage değeri silinmediği için her `/reload`'da mismatch tetiklenip yükleme iptal ediliyordu. İki ayrı düzeltme yapıldı:
- İlk satır: `v2.1.2-pre1` → `v2.1.2` düzeltildi
- `data modify storage macro:engine global.version set value "v2.2.0-en"` satırı eklendi — storage zaten varsa bile her load'da version üzerine yazılır

#### `cmd/save-all`, `cmd/save-off`, `cmd/save-on`, `cmd/stop` — tek oyunculu mod parse hatası
Bu komutlar tek oyunculu modda Minecraft'ın command dispatcher'ı tarafından tanınmıyor; load sırasında `Bilinmeyen veya eksik komut` hatası üretiyordu. `cmd/other/run_self` macro wrapper'ı üzerinden çalıştırılacak şekilde yeniden yazıldı — macro fonksiyonlar load sırasında parse edilmediği için hata kalktı.

#### `wand/internal/unregister_exec` — `$` prefix `$(var)` içermeyen satırda
Satır 11'de `$data modify storage macro:engine _wand_unbinds set from storage macro:engine wand_binds` yazıyordu. `$(var)` olmayan satırda `$` prefix Minecraft'ın `No variables in macro` hatasına yol açıyordu. `$` kaldırıldı.

---

### 🗑️ Kaldırılan

- `wand/lore_add`, `wand/lore_remove` ve tüm ilgili internal dosyalar (`lore_add_exec`, `lore_remove_exec`, `lore_rebuild_step`, `lore_rebuild_apply`) — `set_lore` item function'ının NBT source desteği olmadığı için çalışmıyordu. Yerini `wand/give_lore` aldı.
- `item_modifier/wand_lore_append.json`, `item_modifier/wand_lore_clear.json`
- `1_21_5/data/macro/function/wand/give.mcfunction`, `give_custom.mcfunction`
- `1_21_6/data/macro/function/wand/give.mcfunction`, `give_custom.mcfunction`

---



### 🐛 Bug Fixes

#### `ame_load:load/internal/version_set` — çift boşluk parse hatası
`scoreboard players set #ame.pre  ame.pre_version` satırındaki çift boşluk Minecraft komut ayrıştırıcısında `Tam sayı bekleniyor` hatasına yol açıyordu. Tek boşluğa indirildi.

#### `cmd/data_remove_block`, `cmd/data_remove_entity`, `cmd/data_remove_storage` — geçersiz macro satırı
Son `$tellraw` satırlarında `$(...)` değişkeni bulunmuyordu; Minecraft `$` ile başlayan her satırın en az bir `$(var)` içermesini zorunlu kılıyor, `No variables in macro` hatası üretiyordu. `$` kaldırıldı ve debug çıktısı ilgili argümanları (`$(x) $(y) $(z) → $(path)` vb.) gösterecek şekilde iyileştirildi.

---

### ✨ Yeni: `engine/call/execute_validated`

`macro:tools/utils/input_check` güvenlik doğrulamasından başarıyla geçen fonksiyonu yürüten iki dosyalı modül.

| Dosya | Görev |
|---|---|
| `engine/call/execute_validated.mcfunction` | `macro:output.inputs` storage'ından macro sub-function'ı çağırır |
| `engine/call/execute_validated/run.mcfunction` | `$function $(func) with storage macro:input {}` — macro wrapper |

`input_check.mcfunction` satır 140'daki yorum (`#function macro:engine/call/execute_validated`) kaldırılarak çağrı aktif edildi. Bu düzeltme GitHub CI'da raporlanan `FAILED: One or more function references point to non-existent files` hatasını çözer.

---

### ✨ Yeni: Zamanlayıcı Sistemi `cmd` Desteği

`lib/schedule`, `lib/queue_add` ve ilgili tüm iç fonksiyonlar daha önce yalnızca `func` (fonksiyon adı) kabul ediyordu. Bu güncelleyle aynı API üzerinden ham Minecraft komutu (`cmd`) da zamanlayıcıya verilebiliyor.

#### Yeni Public Fonksiyonlar

| Fonksiyon | Girdi | Açıklama |
|---|---|---|
| `lib/schedule_cmd` | `{key, cmd, interval}` | Tekrarlayan komut zamanlayıcısı — `lib/schedule` ile aynı semantik |
| `lib/queue_add_cmd` | `{cmd, delay}` | Kuyruğa tek seferlik gecikmeli komut ekler |
| `lib/wait_cmd` | `{cmd, delay}` | `queue_add_cmd` alias'ı |
| `lib/once_cmd` | `{key, cmd}` | `key` başına yalnızca bir kez komut çalıştırır |
| `lib/debounce_cmd` | `{key, cmd, interval}` | Aktif zamanlayıcı varken yeni zamanlayıcı başlatmaz |
| `lib/schedule_if_cmd` | `{cmd, delay}` | `queue_add_cmd` alias'ı |

#### Değiştirilen İç Fonksiyonlar

| Dosya | Değişiklik |
|---|---|
| `lib/internal/queue_fire` | `func` ve `cmd` dispatch desteği — her ikisi de aynı kuyruktan çalışır |
| `lib/internal/queue_run_cmd` | YENİ — `$$(cmd)` ham komut çalıştırıcı |
| `lib/internal/schedule_requeue_cmd` | YENİ — `cmd`'li entry'yi yeniden kuyruğa koyar |
| `lib/internal/schedule_reset_do_cmd` | YENİ — `cmd`'li zamanlayıcıyı sıfırlar ve yeniden kuyruğa koyar |
| `lib/schedule_renew` | `func` veya `cmd` içeren schedule'ı doğru `requeue` fonksiyonuna yönlendirir |
| `lib/schedule_reset` | `func` veya `cmd` içeren schedule'ı doğru `reset_do` fonksiyonuna yönlendirir |

**Kullanım örnekleri:**

```mcfunction
# Tek seferlik gecikmeli komut (100t sonra)
/function macro:lib/wait_cmd {cmd:"say Merhaba!", delay:100}

# 20t'de bir tekrar eden komut zamanlayıcısı
/function macro:lib/schedule_cmd {key:"my_timer", cmd:"effect give @a minecraft:speed 2 1", interval:20}

# Aynı key tekrar çağrılırsa zamanlayıcı sıfırlanır
/function macro:lib/schedule_cmd {key:"my_timer", cmd:"effect give @a minecraft:speed 2 1", interval:40}
```

---

### 🗑️ Kaldırılan

- `1_21_5/data/macro/function/dialog/` — önceki sürümde hatalı oluşturulmuştu. Dialog sistemi yalnızca `1_21_6` overlay'ine özeldir (pack_format ≥ 80, Minecraft 1.21.6+).

---

## v2.2.0-en — 2026-03-18

### 🐛 Bug Fixes

#### `tools/utils/input_check` — versiyon kontrolü hiçbir zaman geçmiyordu
`V2.0.3` (büyük V) karşılaştırması yapılıyordu; engine `v2.0.3` (küçük v) saklıyor. Sonuç: kontrol daima başarısız, tüm injection koruması bypass ediliyordu. `v2.2.0-en` olarak düzeltildi.

#### `tools/utils/input_check` — `execute_validated` çağrısı eksikti
Doğrulama bloğu geçtikten sonra `function macro:engine/call/execute_validated` hiç çağrılmıyordu; komut asla yürütülmüyordu. Çağrı eklendi. Cleanup satırları (`data remove storage macro:output`) bu çağrıdan sonraya alındı — sıra da düzeltildi.

---

### ✨ Yeni: `tools/utils/check_all`

Tüm guard kontrollerini tek satırla zincirleme çalıştıran birleşik guard:

```mcfunction
execute unless function macro:tools/utils/check_all run return 0
```

Dahili akış: `load_check` → `perm_check` → `timer_check`. Herhangi biri başarısız olursa `return 0` ile durur.

---

### ✨ Yeni: `tools/admin/list`

`macro.admin` tag'ine sahip tüm çevrimiçi oyuncuları `@s`'e listeler. `check_all` guard'ı ile korunur.

```mcfunction
/function macro:tools/admin/list
```

---

### 🔒 Güvenlik: Tehlikeli Komutlara Ek Guard

`op`, `ban`, `ban_ip`, `kick`, `deop`, `pardon`, `pardon_ip`, `stop`, `whitelist`, `data_remove_block`, `data_remove_entity`, `data_remove_storage`, `save-all`, `save-off`, `save-on` fonksiyonlarına üç zorunlu koşul eklendi:

| Guard | Koşul |
|---|---|
| `@s[type=minecraft:player]` | Çalıştıran entity bir player olmalı |
| `dimension minecraft:overworld` | Yalnızca Overworld'de çalışır |
| `@s[gamemode=creative]` | Çalıştıran creative modda olmalı |

Üçünden herhangi biri sağlanmazsa `return 0` ile iptal edilir.

---

## v2.0.3 — 2026-03-14

### ✨ Yeni: `macro:version`

`/function macro:version` komutuyla çağıran oyuncuya AME sürüm bilgisini gösteren yeni fonksiyon.

- Tüm sürüm sayıları `ame.pre_version` scoreboard'undan dinamik okunur — hardcode yok
- `-preN` suffix'i `#ame.pre >= 1` ise gösterilir, `0` ise gizlenir (release build'ler için)
- Author / Source satırları `click_event` ile tıklanabilir link içerir (1.21.5+ overlay'lerinde)
- `#ame.ver_set` skoru kontrol edilerek yüklenme durumu (`● loaded` / `✖ not initialized`) gösterilir

Dosyalar:
| Katman | Dosya | click formatı |
|---|---|---|
| Base | `data/macro/function/version.mcfunction` | — (link yok) |
| `compat_1_21_4` | `compat_1_21_4/data/macro/function/version.mcfunction` | — (link yok) |
| `1_21_5` | `1_21_5/data/macro/function/version.mcfunction` | `click_event` + `url` |
| `1_21_6` | `1_21_6/data/macro/function/version.mcfunction` | `click_event` + `url` |

---

### 🐛 Bug Fixes

#### `all.mcfunction`, `finalize.mcfunction` — hardcode versiyon string
`"[Macro Engine v2.0.3]"` / `"v2.0.3"` hardcode tellraw metinleri `#ame.major/minor/patch` score-based yapıya dönüştürüldü. `#ame.pre >= 1` ise `-preN` suffix ekleniyor.

#### `version_warn.mcfunction` (base) — yanlış `pre` numarası
Debug tellraw `(expected: 2 0 3 pre=3)` yazıyordu. `pre=4` olarak düzeltildi.

#### `validate.mcfunction` — `#ame.pre matches 0` mismatch
`#ame.pre` kontrol satırı `matches 0` yazıyordu; pre-release build'lerde her `/reload`'da version mismatch tetiklenip yükleme iptal ediliyordu. `matches 4` olarak düzeltildi.

#### `compat_1_21_4/version.mcfunction` — `click_event` 1.21.4'te desteklenmiyor
Author / Source satırlarına yanlışlıkla `click_event` yazılmıştı (`click_event` 1.21.5+ only). Link kaldırıldı, düz text olarak bırakıldı.

---


### ✨ Yeni Modül: `uuid/`

Entity UUID'lerini `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` formatında hex string'e çeviren tam UUID altyapısı. Java'nın negatif integer bölme hatası (`truncate` yerine `floor`) el ile düzeltilmiştir — diğer implementasyonlardaki yüksek byte hesaplama hatası bu modülde yoktur.

#### Public Fonksiyonlar

| Fonksiyon | Giriş | Çıkış | Açıklama |
|---|---|---|---|
| `uuid/from_entity` | — (as `<entity>`) | `macro:input value` | `@s` entity'sinin UUID'sini hex string'e çevirir |
| `uuid/from_array` | `{arr:[I;…]}` | `macro:input value` | int[4] UUID array'ini hex string'e çevirir |
| `uuid/store` | `{key, value}` | — | UUID string'ini cache'e kaydeder |
| `uuid/recall` | `{key}` | `macro:input value` | Cache'ten UUID string'ini okur |
| `uuid/recall_array` | `{key}` | `macro:input arr` | Cache'ten UUID'yi int[4] olarak okur |
| `uuid/match` | `{value, func}` | — | `@s` UUID'sini `value` ile karşılaştırır; eşleşirse `func` çalıştırır |
| `uuid/has` | `{key}` | `macro:output result` | Cache'te key var mı kontrol eder (`1b`/`0b`) |
| `uuid/forget` | `{key}` | — | Tek kaydı cache'ten siler |
| `uuid/cache_clear` | — | — | Tüm UUID cache'ini temizler |

Storage: `macro:engine uuid_cache {key: "uuid-string"}` · `macro:uuid hex_chars [...]` (256 girişli lookup tablosu)

---

### ✨ Yeni Fonksiyonlar

#### `math/lerp_clamped`
`t` değeri `[0, 100]` aralığına kısıtlanmış lerp. `lerp`'ten farkı: `t < 0` → `0`, `t > 100` → `100` olarak clamp edilir, aralık dışı çıktı üretmez.

| Giriş | Çıkış |
|---|---|
| `{a, b, t}` | `macro:output result` |

#### `cooldown/extend`
Aktif bir cooldown'ın bitiş süresini `amount` tick kadar uzatır. Cooldown aktif değilse `amount` tick'lik yeni bir cooldown başlatır.

| Giriş | Açıklama |
|---|---|
| `{player, key, amount}` | Mevcut expiry + `amount` → yeni expiry |

#### `state/toggle`
`player` key'ini `on` ve `off` değerleri arasında toggle eder. Mevcut değer `on` ise `off`, değilse `on` yazar.

| Giriş | Çıkış |
|---|---|
| `{player, on, off}` | `macro:output result` (yeni değer) |

#### `event/fire_as`
`event` olayını `event_context.player` alanı `player` olarak ayarlandıktan sonra tetikler. `event/fire` ile farkı: context el ile ayarlamadan kısayol.

| Giriş |
|---|
| `{event, player}` |

#### `string/format_ticks`
Tick sayısını dakika + saniyeye dönüştürür (`ticks_to_time`'ın saat içermeyen sade versiyonu).

| Giriş | Çıkış |
|---|---|
| `{ticks}` | `macro:output {total_seconds, minutes, seconds}` |

#### `player/get_dimension`
Oyuncunun bulunduğu dimension'ı (`minecraft:overworld`, `minecraft:the_nether`, `minecraft:the_end`) döndürür.

| Giriş | Çıkış |
|---|---|
| `{player}` | `macro:output result` |

---

### ✨ Yeni Varlıklar

| Tür | Dosya |
|---|---|
| Advancement şablonları | `advancement/template/task.json`, `goal.json`, `challenge.json` |
| Item modifier | `item_modifier/set_custom_model_data.json`, `strip_enchants.json` |
| Loot table | `loot_table/template/tiered_drop.json` |
| Predicate | `predicate/is_holding_shield.json` |

---

### 🧹 Değişiklikler

- **Yorum temizliği:** Tüm `.mcfunction` dosyalarındaki Türkçe yorum bloklarının büyük çoğunluğu kaldırıldı — dosya boyutları ve okunabilirlik optimize edildi.
- **Overlay yeniden adlandırma:** `-1_21_4` → `compat_1_21_4` olarak yeniden adlandırıldı; tüm workflow referansları ve `pack.mcmeta` güncellendi.
- **`1_21_6/dialog/internal/load_exec`** kaldırıldı; içeriği `dialog/load.mcfunction` içine inline edildi.
- **`pack.mcmeta`:** `supported_formats` array formatından `min_format`/`max_format` object formatına geçildi.
- **README:** Modül listesi ve kurulum bölümü güncellendi.

### 🐛 Bug Fixes

#### `version_warn.mcfunction` — yanlış pre numarası
`compat_1_21_4` ve `1_21_6` overlay'lerindeki debug tellraw `(expected: 2 0 3 pre=2)` yazıyordu. `pre=4` olarak düzeltildi.

---

## v2.0.3-pre3 — 2026-03-14

### ✨ New Module: `interaction/`

`minecraft:interaction` entity'leri üzerinde sol-tık (attack) ve sağ-tık (use) olaylarını dinleyen yeni modül. Birden fazla bind aynı tag'e eklenebilir; hepsi sırayla çalışır.

#### Public Functions

| Function | Input | Description |
|---|---|---|
| `interaction/spawn` | `{tag, width, height, response}` | Belirtilen tag, boyut ve ses ayarıyla interaction entity oluşturur |
| `interaction/bind_attack` | `{tag, func}` | Tag'e sahip entity'ye saldırı olayı bağlar — saldıran oyuncu olarak çalışır |
| `interaction/bind_use` | `{tag, func}` | Tag'e sahip entity'ye kullanım olayı bağlar — kullanan oyuncu olarak çalışır |
| `interaction/unbind_attack` | `{tag, func}` | Belirtilen saldırı bind'ını kaldırır |
| `interaction/unbind_use` | `{tag, func}` | Belirtilen kullanım bind'ını kaldırır |
| `interaction/list` | `{tag}` | Tag'e kayıtlı tüm bind'ları `macro.debug` oyuncularına gösterir |
| `interaction/remove` | `{tag}` | Tag'e ait tüm bind'ları ve entity'leri kaldırır |

#### Internal Functions

| Function | Description |
|---|---|
| `interaction/internal/tick_scan` | Her tick'te tüm interaction entity'lerini tarar; attack/use olaylarını tespit eder |
| `interaction/internal/on_attack` | Saldırı olayını işler ve ilgili bind'ları çalıştırır |
| `interaction/internal/on_use` | Kullanım olayını işler ve ilgili bind'ları çalıştırır |
| `interaction/internal/dispatch` | Bind listesini iterate ederek eşleşen fonksiyonları sırayla çalıştırır |
| `interaction/internal/check_bind` | Tek bir bind kaydını kontrol edip çalıştırır |
| `interaction/internal/unbind_check` | Unbind işlemi için eşleşen kaydı tespit eder |
| `interaction/internal/unbind_filter` | Eşleşmeyen bind'ları yeni listeye kopyalar (unbind filtresi) |

Storage: `macro:engine interaction_binds [{tag:"...", type:"attack"|"use", func:"..."}]`

#### ⚙️ Entegrasyon

- `tick/player_systems.mcfunction`: `interaction/internal/tick_scan` dispatch satırı eklendi (tüm overlay'lerde)
- `load/storages.mcfunction`: `interaction_binds` storage init eklendi
- `load/internal/cleanup.mcfunction`: `interaction_binds` + ilgili geçici storage alanları temizleme eklendi

---

## v2.0.3-pre2 — 2026-03-13

### 🐛 Bug Fixes

#### `lib/schedule` — Timer auto-reset behavior

**Previous behavior (v3.1):** Re-calling `schedule` with the same key would only update the `func` and `interval` fields without resetting the timer. To reset the timer, you had to call `schedule_cancel` first.

**New behavior (v3.2):** Re-calling `schedule` with the same key now automatically cancels the old schedule and starts a new one with the full interval. The timer is automatically reset. Manual `cancel` is no longer needed when re-scheduling.

```mcfunction
# Schedule a task
/function macro:lib/schedule {key:"test",func:"macro:menu",interval:3}

# Re-schedule with same key (timer auto-resets!)
/function macro:lib/schedule {key:"test",func:"macro:menu",interval:5}
```

#### Translation cleanup — All comments translated to English

All Turkish comments, documentation strings, and error messages in `.mcfunction` files have been translated to English for better accessibility and maintainability.

**Files affected:** 150+ `.mcfunction` files across all namespaces.

**Examples:**
- Permission error messages: `"permissionne sahip notsiniz"` → `"you don't have this permission"`
- Function headers: `"Oyuncunun tam konumunda entity doğurur"` → `"Spawns an entity at the exact location of the specified player"`
- Code comments: `"Tick-safe guard: entity basina son islenen epoch valueini tutar"` → `"Tick-safe guard: stores the last processed epoch value per entity"`

#### Namespace correction — `mopenro` → `macro`

Fixed incorrect namespace references introduced during translation. All `mopenro.*` tags, scoreboards, and storage paths have been corrected to `macro.*`.

**Affected components:**
- `macro.admin` tag (was incorrectly translated to `mopenro.admin`)
- `macro.pid` scoreboard
- `macro.tmp` scoreboard  
- `macro:engine` storage
- `macro.debug` tag

**Total corrections:** 401 lines across 68 files.

---

---

## v2.0.3-pre1 — 2026-03-11

### ✨ New Functions

| Function | Input | Output | Description |
|---|---|---|---|
| `cooldown/detail` | `{player, key}` | `{active:1b/0b, remaining:<int>, expires:<int>}` | `cooldown/check` + `cooldown/remaining` + expiry tick'ini returns in a single call |
| `lib/ticks_to_time` | `{ticks:<int>}` | `{hours, minutes, seconds, ticks}` | Splits tick count into hour/minute/second/tick components; negative inputs processed as zero |
| `math/divmod` | `{value, divisor}` | `{quotient, remainder}` | Returns division and remainder in one pass; remainder always in `[0, divisor)` range (safe mod — `math/mod` consistent with); `divisor <= 0` if both fields 0 |
| `math/minmax` | `{a, b}` | `{min, max}` | Returns minimum and maximum of two values in a single scoreboard pass |
| `player/get_pos` | `{player}` | `{x, y, z, found:1b/0b}` | Returns player's block coordinates; if player offline `found:0b` |

### 🐛 Bug Fixes

#### Pid-based targeting — stale value fix
v2.0.2'pid resolve blocks where `$execute store result` failure (when path doesn't exist) `macro.tmp` would leave score at its previous value issue fixed. To every pid resolve block `scoreboard players set $*_pid macro.tmp 0` line added.

#### `debug.mcfunction` — missing storage fields
`macro:debug` output `engine.flags`, `engine.config`, `input`, `output` storage fields added.

#### `lib/throttle` — partial update
Fixed inconsistency in throttle logic.

#### `cmd/other/multi_cmd/run` ve `run_func` — correction
Fixed error during multi-command execution.

#### `flag/list`, `flag/list_systems`, `event/list`, `perm/list`, `state/list`, `trigger/list`, `log/show` — display updates
Updated output format for all list and log display functions.

---

## v2.0.2 — 2026-03-11

### ✨ New: Player PID System

Duplicate-name safe unique integer ID infrastructure. For offline-mode servers where multiple players can have the same name `@a[name=$(player),limit=1]` selector instead of `macro.pid` scoreboard-based targeting.

| Component | Description |
|---|---|
| `player/internal/assign_pid` | For each player on first `player/init` call runs once; `player_pids.<name>` to storage and `macro.pid` score writes unique integer |
| `macro:engine player_pids` | `{name: pid}` map storage — persists across reload |
| `macro:engine _pid_seq` | Monotonically increasing sequence counter — persists across reload |
| `macro.pid` (scoreboard) | Pid score on entity for runtime targeting |

### 🐛 Bug Fixes

#### `math/random` — distribution bias fixed
Previous code had `abs()` step that mapped both `x` ve `-x` values to the same residue class, 0near values by approximately %50 under-representing. `abs()` step removed; signed-modulo fix (`(rnd % range + range) % range`) applied — distribution now `[min, max]` unbiased across range.

`perm/check`, `perm/has`, `perm/grant`, `perm/revoke`, `perm/run`, `perm/exec`, `perm/trigger/enable` functions all `@a[name=$(player),limit=1]` selectors replaced with pid-based targeting. `disable/cleanup`'a `macro.pid` objective removal and `player_pids` / `_pid_seq` storage cleanup added.

---

## v2.0.1 — 2026-03-11

### 🐛 Bug Fixes

#### `1_21_6/tick/player_systems` — `perm/trigger` dispatch missing
`perm/trigger/internal/tick_start` call base `tick/player_systems`was added but not to `1_21_6` override fwith in overlay not added. 1.21.6+ since overlay completely shadows base fwith in versions `perm/trigger` system was never triggered on those versions. Line `1_21_6/tick/player_systems.mcfunction`added to.

#### `perm/trigger/internal/tick_dispatch` — first-time players not getting trigger enabled
`$execute as @a[scores={$(name)=1..}]` line only runs on players whose score is already `1` or above; players with no score set `scoreboard players enable` couldn't get. `$execute as @a run scoreboard players enable @s $(name)` line added — all players get enabled every tick.

#### Version references updated
`load/all`, `finalize`, `validate`, `version_set`, `version_warn` fwiths all `v2.0.0` / `V2.0.0` references `v2.0.1` updated to; `#ame.patch` scoreboard value `0` → `1` corrected to.

## v2.0.0 — 2026-03-10

### ✨ New: `perm/` Modülü — Permission System

Complete permission layer for mmainging player permissions. Works in two-tier architecture: **storage** (persistent, including offline) + **entity tag** (runtime fast access). `macro.admin` tag bypasses all permissions.

#### Core Functions

| Function | Input | Description |
|---|---|---|
| `perm/grant` | `{player, perm}` | Grant permission — storage + tag |
| `perm/revoke` | `{player, perm}` | Revoke permission — clear storage + tag |
| `perm/clear` | `{player}` | Clear all permissions |
| `perm/has` | `{player, perm}` | Permission check → `macro:output {result:1b/0b}` |
| `perm/check` | `{player, perm}` | Guard — if no permission `return 0` |
| `perm/run` | `{player, perm, cmd}` | Run permitted command (entity tag based, online) |
| `perm/exec` | `{player, perm, cmd}` | Run permitted command (storage based, including offline) |
| `perm/list` | `{player}` | `macro.debug` Display permission list to players with tag |

> `grant`, `revoke`, `clear` can only be called by `macro.admin` players with tag.

> `perm/run` with `perm/exec` Difference between: `run` checks entity tag (fast), `exec` checks storage (reliable/offline).

---

### ✨ New: `perm/trigger/` Alt Sistemi — Permission-Protected Named Triggers

Allows players to `/trigger <name> set <value>` write; performs permission check in background before running bound function or command. `macro_action` Permission-layered extension of system.

| Function | Input | Description |
|---|---|---|
| `perm/trigger/bind` | `{name, value, func, perm}` | Trigger değerini fonksiyona bağla |
| `perm/trigger/bind_cmd` | `{name, value, cmd, perm}` | Trigger değerini komuta bağla |
| `perm/trigger/enable` | `{player, name, perm}` | Trigger'ı oyuncu için aktif et (izin kontrolü with) |
| `perm/trigger/unbind` | `{name, value}` | Belirli value'nun tüm bind'larını kaldır |
| `perm/trigger/clear` | `{name}` | Trigger'ın tüm bind'larını temizle |

Storage: `macro:engine perm_triggers.<name> [{value:N, func/cmd:"...", perm:"..."}]`  
Trigger isimleri: `macro:engine perm_trigger_names [{name:"..."}]`

**Tick dispatch:** `tick/player_systems` → `perm/trigger/internal/tick_start` → `tick_step_loop` → `tick_dispatch` → `player_dispatch` → `check_bind` → `run_if_perm` → `exec`

**İzin akışı:** Player `/trigger <name> set N` yazar → `player_dispatch` skoru sıfırlar ve yeniden enable eder → `run_if_perm` `macro.admin` veya `perm.<perm>` tag kontrolü yapar → izin varsa bind çalışır, yoksa oyuncuya hata mesajı gönderilir.

---

### 🐛 Bug Fixes

#### `perm/list` — satır 16 gereksiz `$` prefix
Son `tellraw` satırında `$(...)` değişkeni olmaksızın `$` prefix yazılmıştı; Minecraft "No variables in macro" hatası üretiyordu. `$` kaldırıldı.

#### `perm/trigger/internal/run_if_perm` — satır 14 gereksiz `$` prefix
`execute if entity @s[tag=macro.admin]` satırında `$(...)` değişkeni yokken `$` prefix bulunuyordu; "No variables in macro" hatası üretiyordu. `$` kaldırıldı.

#### `perm/trigger/internal/tick_step_loop` — `with storage ... {}` geçersiz syntax
`function macro:perm/trigger/internal/tick_dispatch with storage macro:engine _pt_tick_ctx {}` satırındaki sondaki `{}` geçersizdi; parse hatası üretiyordu. `{}` kaldırıldı.

---

### ⚙️ Değişiklikler

- `tick/player_systems.mcfunction`: `perm/trigger/internal/tick_start` dispatch line added
- `load.mcfunction`: `perm_triggers`, `perm_trigger_names`, `permissions` storage init eklendi (yeni objective yok — scoreboard'lar `perm/trigger/bind` tarafından lazy oluşturuluyor)
- `disable/main.mcfunction`: `perm_triggers`, `perm_trigger_names`, `permissions` storage temizleme eklendi

---

## v1.0.6-pre4-fix3
- Hata correctionleri ve iywithştirmeler

## v1.0.6-pre4 — 2026-03-06
# Multi-command sistemi ve `/function macro:flag/open_toggle_system_menu` komutu

## v1.0.6-pre3 — 2026-03-06

### 🐛 Bug Fixes

#### `-1_21_4` / `1_21_6` overlay `tick.mcfunction` — flag sistemi devre dışı
Her iki overlay'deki `tick.mcfunction` eski monolitik versiyonu içeriyordu; base `data/`'daki flag-kontrollü `tick.mcfunction`'ı tamamen override ediyordu. 1.21.1 kullanıcısı (pack_format 48, `-1_21_4` aktif) için `macro.Flags` hiç okunmuyordu — toggle çalışıyor görünse de sistemler etkwithnmiyordu. Her iki overlay `tick.mcfunction` flag-kontrollü yapıya güncellendi. `1_21_6` overlay'ine özgü `dialog_load` mantığı `1_21_6/tick/player_systems` override'ına taşındı.

#### `flag/toggle_system` — `$ftgl_sys` macro değişkeni çakışması
`$ftgl_sys` fake player adı `$` ön ekiyle başladığından macro satırı içinde `$(ftgl_sys)` değişkeni olarak ayrıştırılmaya çalışılıyordu; `scoreboard players operation` her seferinde 0 yazıyor, toggle her zaman 1 set ediyordu. `#ftgl_sys` corrected to.

#### `flag/toggle_system` — `tellraw` set'ten önce çalışıyordu
`tellraw` iki `set` satırının arasına sıkışmıştı; 0→1 geçişinde ilk `tellraw` henüz set edilmemiş (0) değeri okuyordu, ikinci `tellraw` ise 1 okuyordu — ekranda iki mesaj çıkıyordu. `tellraw` her iki `set` satırından sonraya taşındı.

#### `flag/toggle_system` — çift execute race condition
İki `execute if score` satırı sırayla çalıştığından 1→0 set edildikten hemen sonra `matches 0` koşulu da tetiklenip değeri tekrar 1 yapıyordu. Mevcut skor önce `#ftgl_sys macro.tmp`'ye kopyalmainrak sabitlendi; can only be called by tek dal çalışıyor.

---

### ✨ New: Flag-Kontrollü Tick Sistemi

`macro:tick` beş bağımsız subsisteme bölündü; her subsistem `macro.Flags` scoreboard'undaki bir flag with açılıp kapatılabiliyor.

| Flag | Değer | Kapsadığı sistemler |
|---|---|---|
| `#m_time` | `1` | Epoch sayacı, `$tick` artışı |
| `#m_queue` | `1` | `lib/process_queue`, `lib/schedule` |
| `#m_player` | `1` | Player menü, run, action tetikleyicwithri |
| `#m_hud` | `1` | Otomatik progress bar (actionbar) |
| `#m_admin` | `1` | Debug & admin sistemleri |

Flag `0` iken ilgili subsistem `macro:tick/disabled` stub'ını çalıştırır (no-op). Load sırasında tüm flag'ler `1` (aktif) olarak set edilir.

Yeni tick dosyaları: `tick/time_systems`, `tick/queue_systems`, `tick/player_systems`, `tick/hud_systems`, `tick/admin_systems`, `tick/disabled`.

### ✨ New: Flag Sistem Functionları

| Function | Input | Description |
|---|---|---|
| `flag/toggle_system` | `{system:"<isim>"}` | `#m_<isim> macro.Flags` değerini toggle eder ve yeni durumu `@s`'e bildirir |
| `flag/list_systems` | — | Tüm beş sistem flag'inin mevcut skorunu `@s`'e gösterir |

**Kullanım örnekleri:**
```
/function macro:flag/toggle_system {system:"queue"}
/function macro:flag/list_systems
/scoreboard players set #m_hud macro.Flags 0
```

---

## v1.0.6-pre2 — 2026-03-05

### 🐛 Bug Fixes

#### `$v_pre` / `$v_*` — 1.21.1 macro parser çakışması
`ame_load:load/internal/version_set` ve `validate` dosyalarındaki `$v_major`, `$v_minor`, `$v_patch`, `$v_pre`, `$ame_ver_set`, `$ver_mismatch` fake player isimleri 1.21.1'de (pack_format 48–57) `$` ön ekinin macro değişkeni olarak ayrıştırılması nedeniyle `Tam sayı bekleniyor` / `Command için geçersiz değişken` hatası üretiyordu. Tüm isimler `#ame.*` formatına taşındı:

| Eski | Yeni |
|---|---|
| `$v_major` | `#ame.major` |
| `$v_minor` | `#ame.minor` |
| `$v_patch` | `#ame.patch` |
| `$v_pre` | `#ame.pre` |
| `$ame_ver_set` | `#ame.ver_set` |
| `$ver_mismatch` | `#ame.mismatch` |
| `$log_count` | `#ame.log_count` |

Etkwithnen dosyalar: `version_set`, `validate`, `version_warn`, `finalize`, `log/add`, `log/clear`, `load/internal/cleanup`.

#### `action` → `invoke` — 1.21.1 NBT path ayrıştırma hatası
`data modify storage macro:input action` içeren satırlar 1.21.1 komut ayrıştırıcısında `Command için geçersiz değişken` hatası üretiyordu. `action` storage key'i `invoke` olarak yeniden adlandırıldı:

| Dosya | Değişiklik |
|---|---|
| `lib/input_push.mcfunction` | Storage key: `action` → `invoke` |
| `lib/input_pop.mcfunction` | Storage key: `action` → `invoke` |
| `world/block_if`, `world/block_unless` | `$(action)` → `$(invoke)` |
| `inv/player_if_item`, `inv/player_unless_item`, `inv/player_slot_if_item` | `$(action)` → `$(invoke)` |
| `inv/chest_minecart_if_item`, `inv/chest_minecart_unless_item` | `$(action)` → `$(invoke)` |
| `geo/in_region`, `geo/in_region_unless`, `geo/near_entity`, `geo/near_entity_unless` | `$(action)` → `$(invoke)` |

> ⚠️ **Breaking change:** `data modify storage macro:input action set value "..."` kullmainn fonksiyonlar `invoke` olarak güncellenmeli.

### 🧹 Temizlik

- Tüm `.mcfunction` dosyalarındaki hizalama amaçlı çoklu boşluklar tek boşluğa indirildi (`.json` ve `.mcmeta` korundu).

---

## v1.0.5 — 2026-03-05

### 🐛 Bug Fixes

#### `action` → `callback` — 1.21.4+ reserved keyword çakışması
Minecraft 1.21.4 with `action` kelimesi komut parser'ında rezerve keyword haline geldi. `data modify storage macro:input action` içeren tüm satırlar parse hatası üretiyordu (`Command için geçersiz değişken`). Etkwithnen 13 dosyada `action` storage key'i `callback` olarak yeniden adlandırıldı:

| Dosya | Değişiklik |
|---|---|
| `lib/input_push.mcfunction` | Storage key: `action` → `callback` |
| `lib/input_pop.mcfunction` | Storage key: `action` → `callback` |
| `world/block_if`, `world/block_unless` | `$(action)` → `$(callback)` |
| `inv/player_if_item`, `inv/player_unless_item`, `inv/player_slot_if_item` | `$(action)` → `$(callback)` |
| `inv/chest_minecart_if_item`, `inv/chest_minecart_unless_item` | `$(action)` → `$(callback)` |
| `geo/in_region`, `geo/in_region_unless`, `geo/near_entity`, `geo/near_entity_unless` | `$(action)` → `$(callback)` |

> ⚠️ **Breaking change:** Kendi mapında `data modify storage macro:input action set value "..."` kullmainn fonksiyonlar `callback` olarak güncellenmeli.

#### `dialog/close` (base) — `return` sonrası ulaşılamaz kod
Base namespace `dialog/close.mcfunction`'da `return run tellraw ...` satırından sonra gelen `tag @s remove macro.dialog_opened` ve `tag @s add macro.dialog_closed` satırları hiçbir zaman çalışmıyordu. `return` kaldırıldı; 1.21.1 fallback'te de engine tag durumu artık tutarlı biçimde temizleniyor.

#### `1_21_6/dialog/load` — silinen `load_exec` referansı
`1_21_6/dialog/load.mcfunction`, önceki bir temizlikte kaldırılan `macro:dialog/internal/load_exec` fonksiyonunu çağırıyordu. Her `macro:dialog/load` call 1.21.6+ sürümlerde `Unknown function` hatası üretiyordu. `load_exec` içeriği `load.mcfunction` içine inline edildi; ayrı dosyaya ihtiyaç kalmadı.

#### `1_21_6/` overlay — artık silinmiş dosyaların kalıntıları
`1_21_6/` overlay'inde main `data/` namespace'den kaldırılmış olan `cmd/storage_get.mcfunction`, `cmd/other/internal/display.mcfunction` ve `dialog/internal/load_exec.mcfunction` dosyaları hâlâ duruyordu. Minecraft her iki katmandaki dosyaları birleştirerek yüklediğinden bu dosyalar silinmiş gibi davranmıyordu. Üçü de overlay'den kaldırıldı.

### 🧹 Temizlik

- Tüm `.mcfunction` dosyalarındaki hizalama amaçlı çoklu boşluklar tek boşluğa indirildi (yorum satırları korundu).

---

## v1.0.5-pre3 — 2026-03-04

### 🐛 Bug Fixes

#### Toplu komut bozulması — `remoand` / `giand` / `leaand`
Önceki bir find-and-replace işleminin yan etkisiyle tüm pakette üç Minecraft komutu bozulmuştu:

| Bozuk | Doğru | Etkwithnen dosyalar |
|---|---|---|
| `remoand` | `remove` | 58 dosya, 194 satır (`data remove`, `scoreboard … remove`, `tag … remove`, `forceload remove`, `team remove`, `bossbar remove`, vb.) |
| `giand` | `give` | `cmd/give`, `cmd/give_one`, `cmd/loot_give`, `cmd/heal`, `cmd/effect_give` |
| `leaand` | `leave` | `team/remove` (`team leave`) |

#### `macro:dialog/` — base namespace eksikliği
`macro:dialog/open`, `close`, `show`, `load` yalnızca `1_21_6/` overlay'inde (pack_format ≥ 80) tanımlıydı. 1.21.1'de (pack_format 48) `tick.mcfunction` her tick'te "missing function" hatası üretiyordu. `data/macro/function/dialog/` altına 4 fallback stub eklendi; tag/score durumu tutarlı, `dialog` API'si yok.

---

### ✨ New: Version Scoreboard — `ame.pre_version`

Load sistemine entegre edilmiş versiyon izleme:

| Score | Değer | Description |
|---|---|---|
| `$v_major` | `1` | Major versiyon |
| `$v_minor` | `0` | Minor versiyon |
| `$v_patch` | `5` | Patch versiyon |
| `$ame_ver_set` | `1` | Sentinel — önceki AME oturumu yazıldı |

Başarılı load'dan sonra `ame_load:load/internal/version_set` bu skorları yazar. Sonraki `validate`'te `$ame_ver_set = 1` ise `$v_major/minor/patch` beklenen değerlerle karşılaştırılır; uyuşmazsa load iptal edilir. İlk on load (`$ame_ver_set` yok) check atlanır — false positive olmaz. `ame.pre_version` objective `ame_load:load/internal/cleanup`'ta da temizlenir.

### ✨ New: Modüler Load İç Dosyaları

`data/ame_load/function/load/internal/` altına 3 yeni dosya:

| Dosya | Görev |
|---|---|
| `version_set.mcfunction` | Başarılı loaddan sonra version skorlarını yazar |
| `version_warn.mcfunction` | Mismatch: test_block log (Z=1600) + tellraw + debug score özeti + log/warn buffer |
| `finalize.mcfunction` | Load sonrası test_block başarı logu (Z=1601) + admin score summary tellraw |

`all.mcfunction`'a adım 6.5 (`version_set`) ve adım 9 (`finalize`) eklendi.

### ✨ New: `clickEvent` / `click_event` Overlay Ayrımı

Minecraft 1.21.5 with `tellraw` JSON sözdizimi değişti (`clickEvent` → `click_event`, `hoverEvent` → `hover_event`, action field'ları yeniden adlandırıldı). Tüm ilgili dosyalar overlay'lere bölündü:

**Base (`data/`)** — `click_event` / `hover_event` (1.21.5+):
`string/click_run`, `click_suggest`, `copy_to_clipboard`, `link`, `hover_text`, `tooltip_item`, `disable`, `cmd/storage_get`, `cmd/other/internal/display`, `dialog/open`, `ame_load/.../version_warn`

**`-1_21_4/` overlay** — eski `clickEvent` / `hoverEvent` sözdizimi (pack_format ≤ 61):
Yukarıdaki dosyaların hepsi için override eklendi. `cmd/storage_get` ve `cmd/other/internal/display`'de compound `click_event` clipboard 1.21.5+ özelliği olduğundan bu versiyonda `click_event` kaldırılıp can only be called by `hoverEvent` bırakıldı.

**`1_21_6/` overlay** — `click_event` / `hover_event` (pack_format ≥ 80):
String fonksiyonları + `disable` + `cmd/storage_get` + `cmd/other/internal/display` + `ame_load/.../version_warn` için explicit overlay eklendi.

---

### v1.0.4
Hata correctionleri ve iywithştirmeler.

### v1.0.3
Rate-limit ve ek özellikler
| Function | Yetki kontrolü / Rate-limit / Dosya |
|---|---|
| `cmd/ban` | `Var` |
| `cmd/op` | `Var` |
| `cmd/deop` | `Var` |
| `cmd/pardon` | `Var` |
| `tools/utils/load_check` | `Yeni` |
| `tools/utils/input_check` | `Yeni` |

## v1.0.3-pre

### ✨ New: Log Sistemi — `macro:log/*`

Dialog tabanlı log sistemi. Chat'e hiç yazmaz; 1.21.6+ sürümlerde `/dialog show @s` with inline JSON panel açar, eski sürümlerde `tellraw @s` with güvenli fallback yapar.

| Function | Input | Description |
|---|---|---|
| `log/add` | `{level, message, color}` | Ham log girişi ekle |
| `log/info` | `{message}` | INFO seviyesi (yeşil) |
| `log/warn` | `{message}` | WARN seviyesi (sarı) |
| `log/error` | `{message}` | ERROR seviyesi (kırmızı) |
| `log/debug` | `{message}` | DEBUG seviyesi (gri) |
| `log/show` | — | @s'e log dialog/tellraw göster |
| `log/clear` | — | Tüm log girişlerini temizle |

Storage: `macro:engine log_display` — JSON text component listesi, maks 30 giriş (circular buffer). Scoreboard: `$log_count macro.tmp`.

### ✨ New: Tick-safe Guard — `macro:lib/tick_guard`

Entity başına tick-unique çalışma denetimi. Aynı entity'nin aynı tick içinde iki kez tetiklenmesini önler.

| Function | Description |
|---|---|
| `lib/tick_guard` | @s için guard kontrol+set. return 0=zaten çalışmış, return 1=devam et |
| `lib/tick_guard_clear` | @s için guard manuel sıfırla |

Mekanizma: `@s macro.tick_guard` == `$epoch macro.time` ise dur, değilse epoch'u yaz. Bir sonraki tick'te `$epoch` değiştiğinden guard otomatik geçersiz olur.

### ✨ New: Gelişmiş Trigger Sistemi — `macro:trigger/*`

`macro_action` adlı yeni trigger objective + value→function bind sistemi. Player `/trigger macro_action set <N>` yazdığında N'e bağlı fonksiyon otomatik çalışır. Tick dispatch `macro:input`'e kesinlikle dokunmaz.

| Function | Input | Description |
|---|---|---|
| `trigger/bind` | `{value, func}` | Değeri fonksiyona bağla |
| `trigger/unbind` | `{value}` | Belirli değerin tüm bind'larını kaldır |
| `trigger/unbind_all` | — | Tüm bind'ları temizle |
| `trigger/enable` | `{player}` | Playerya macro_action trigger'ını aç |
| `trigger/disable` | `{player}` | Playernun trigger'ını kapat |
| `trigger/list` | — | Bind listesini @s'e göster |

Storage: `macro:engine trigger_binds [{value:N, func:"..."}]`. Aynı değere birden fazla bind eklenebilir (hepsi çalışır).

### ⚙️ Değişiklikler

- `load.mcfunction`: versiyon `1.0.3-pre`; yeni objective'ler `macro_action`, `macro.tick_guard`; log ve trigger storage init eklendi
- `tick.mcfunction`: trigger dispatch line added (`execute as @a[scores={macro_action=1..}]`)
- `disable/main.mcfunction`: yeni objective ve storage temizleme eklendi
- `lib/input_push.mcfunction`: `level` alanı açıklaması güncellendi

---

## v1.0.1

### 🐛 Bug Fixes

- **dialog/load.mcfunction ve dialog/open.mcfunction — sonsuz loading bug (BUG FIX v1.0.2)**: Minecraft dialog'larda buton tıklaması dialog'u otomatik kapatır, ancak `macro:dialog/close` çağrılmaz. Bu durumda `macro.dialog_opened` tag'i oyuncuda kalır. Bir sonraki `macro:dialog/load` callnda loading dialog açılır; süre dolunca `open → show` akışı gelir ve `show` içindeki guard (`tag=macro.dialog_opened`) hâlâ setten tag'i görüp `return 0` yapar. Asıl dialog hiç açılmaz, oyuncu sonsuza kadar loading ekranında kalır. Düzeltme: `load.mcfunction` içinde `tag @s add macro.dialog_opened` satırından önce `tag @s remove macro.dialog_opened` eklendi. `open.mcfunction` içinde de `macro:dialog/show` çağrılmadan önce aynı temizlik yapıldı.

- **pack.mcmeta — filter regex**: `macro` namespace filtresi `".*\\\\\\.(...)$"` olarak yazılmıştı; bu JSON'da `.*\\.(...)` regex'i üretiyordu ancak Minecraft `\` kaçırmasını farklı yorumladığından hiçbir dosya filtrelenmiyordu. `minecraft` namespace filtresiyle tutarlı olacak şekilde `".*\\.(...)$"` corrected to.
- **pack.mcmeta — versiyon**: Description metni `v1.0.0` yazıyordu, pack adı `v1.0.1`. Düzeltildi.
- **item_modifier/hide_tooltip — overlay yanlış sürüm**: `-1_21_4` overlay'i (format 48–61, yani 1.21.0–1.21.4 arası) `minecraft:hide_tooltip: {}` kullanıyordu. Ancak bu bwithşen 1.21.4'te (format 61) `minecraft:tooltip_display` olarak yeniden adlandırıldı; dolayısıyla 1.21.4'te `hide_tooltip` geçersizdi. Çözüm olarak yeni `_pre_1_21_4` overlay'i (format 48–57, 1.21.0–1.21.3) oluşturuldu ve eski sözdizimi buraya taşındı. `-1_21_4` overlay'inden `hide_tooltip.json` kaldırıldı; 1.21.4 main pack'teki `tooltip_display` formatını kullanıyor.
- **tick.mcfunction — `macro:dialog/open` can only be called by 1.21.6+ overlay'inde mevcut**: Ana `tick.mcfunction` her tick'te `macro:dialog/open` çağırıyordu; bu fonksiyon yalnızca `1_21_6` overlay'inde tanımlı (format 80–94). 1.21.4 ve öncesinde her tick logda `Unknown function` hatası üretiyordu. `-1_21_4` overlay'ine dialog satırları içermeyen ayrı bir `tick.mcfunction` eklendi.
- **1_21_6 overlay — CRLF satır sonları**: Dialog overlay'indeki 5 `.mcfunction` dosyasının tamamı Windows satır sonları (CRLF) içeriyordu. Linux/macOS sunucularda parse hatasına yol açabilir; LF'e dönüştürüldü.
- **dialog/show.mcfunction — eksik guard**: `show_macro`, `$(DIALOG)` makro değişkenine ihtiyaç duyuyor; ancak `dialog.DIALOG` storage mainhtarı ayarlanmamışsa makro hatası fırlatıyordu. `execute unless data storage macro:engine dialog.DIALOG run return 0` guard'ı eklendi.
- **1_21_6/dialog/loading.json — metin bwithşeni formatı**: `title` ve `label` alanları düz string olarak yazılmıştı (`""`, `"İptal"`). 1.21.5+ dialog formatı JSON text component bekliyor (`{"text": "..."}`). Düzeltildi.
- **lib/internal/schedule_reset_restore.mcfunction — tanımsız makro + ölü kod**: Function kodun hiçbir yerinde çağrılmıyordu ve açıklamasında belirtilmeyen `$(key)` makro değişkenini kullanıyordu (input yalnızca `{func, interval}` kabul ediyor). Kaldırıldı.
- **dialog/show.mcfunction — yanlış guard tag'i (BUG FIX v1.0.1-patch)**: Guard koşulu `tag=macro.dialog_closed` yerine `tag=macro.dialog_opened` olmalıydı. `macro.dialog_closed` tag'i, `macro:dialog/open` tarafından `show` çağrılmadan hemen önce zaten kaldırıldığı için bu guard hiçbir şeyi engellemiyor; ancak `macro:dialog/show` doğrudan çağrıldığında, oyuncu önceki bir dialog'u yeni kapattıysa ve `macro.dialog_closed` tag'i henüz silinmediyse fonksiyon yanlışlıkla return 0 yapıyordu. Düzeltildi: guard artık `tag=macro.dialog_opened` kontrolü yapıyor; fonksiyon sonunda `tag @s add macro.dialog_opened` eklendi.
- **tick.mcfunction — dialog_load race condition ve doğrudan scoreboard set çalışmıyor (BUG FIX v1.0.1-patch)**: `scoreboard players remove @a macro.dialog_load 1` tüm oyuncular için uygulandığından skor 0'ın altına inebiliyordu. Tick'te `score=0` koşulu yalnızca bir tick aktif olduğundan; oyuncu loading dialog'u kapatmadan önce skor 0'ı geçerse ya da `/scoreboard players set @s macro.dialog_load 4` doğrudan kullanılırsa (`macro.dialog_closed` tag'i hiç eklenmediğinden) dialog **asla açılmıyordu**. Düzeltmeler: (1) can only be called by `scores={macro.dialog_load=1..}` olan oyuncuların skoru azaltılıyor — skor 0'ın altına düşmez; (2) `macro.dialog_closed` ve `macro.dialog_opened` tag'lerinin ikisi de yoksa (doğrudan scoreboard set kullanımı) da dialog açılıyor.
- **dialog/load.mcfunction — macro.dialog_opened tag'i eksik (BUG FIX v1.0.1-patch)**: Loading dialog açılırken `macro.dialog_opened` tag'i eklenmiyordu. `close.mcfunction` bu tag'i kaldırarak `macro.dialog_closed`'ı ekliyor; tag hiç eklenmediğinde close sonrası durum tutarsız kalıyordu. Düzeltildi: `dialog show @s macro:loading` öncesinde `tag @s add macro.dialog_opened` eklendi.
- **disable/main.mcfunction — macro.dialog_load objective ve tag'ler temizlenmiyor (BUG FIX v1.0.1-patch)**: `macro.dialog_load` scoreboard objective, disable sonrasında silinmiyordu. Ayrıca `macro.dialog_opened` ve `macro.dialog_closed` tag'leri tüm oyunculardan kaldırılmıyordu; yeniden yükleme sonrasında bu tag'ler kalıntı olarak kalabiliyordu. Düzeltildi.

---

## v1.0.0

### 🐛 Bug Fixes

- **load/warn**: `yes`/`no` buton etiketleri ve aksiyonları ters yazılmıştı — düzeltildi.
- **load/warn**: Dialog `run_command` aksiyonundan `/kick` çalışmıyor, `/dialog clear @s` onay istiyor. "Çıkış Yap" butonu `/skin search ea7` kullanır — sunucudan atan tek oyuncu-taraflı geçici çözüm.
- **load/warn**: CRLF satır sonları → LF'e dönüştürüldü.
- **load**: `function macro:cmd/sound_all {…}` sözdizimi geçersiz — `with storage macro:input {}` corrected to. `pitch:0` (duyulamaz) → `pitch:1` corrected to.
- **cmd/ride**, **cmd/ride_dismount**: `$ride $(player)` → `$ride @a[name=$(player),limit=1]` — selector tutarlılığı sağlandı.
- **cmd/spectate**, **cmd/spectate_stop**: `execute as $(player)` → `execute as @a[name=$(player),limit=1]` — selector tutarlılığı sağlandı.

### ✨ New: Auto-HUD

`tick.mcfunction` artık `pb_obj` storage'da ayarlıysa `progress_bar_self`'i her 4 tick'te otomatik çalıştırır. Elle komut yazmak gerekmez.

```mcfunction
data modify storage macro:engine pb_obj   set value "health"
data modify storage macro:engine pb_max   set value 20
data modify storage macro:engine pb_label set value "Can"
# Kapatmak: data remove storage macro:engine pb_obj
```

### ✨ New: `string/progress_bar` — Tam Yeniden Yazım

- `title $(player) actionbar` geçersiz sözdizimi → `title @a[name=$(player),limit=1] actionbar`
- `$pb_cur/$pb_max/$pb_ten` → `$pb1_seg/$pb1_max/$pb1_ten` — `progress_bar_self` with scoreboard çakışması giderildi
- `progress_bar_self`: `$pb_cur/$pb_max/$pb_ten` → `$pbs_seg/$pbs_max/$pbs_ten`
- Hizalama amaçlı çift boşluklar temizlendi

---

### 🔁 v3.5 (iç)

### 🐛 Bug Fixes

- **load/warn**: CRLF satır sonları LF'e dönüştürüldü.
- **load/warn**: `yes`/`no` butonlar ters eşleştirilmişti — düzeltildi.
- **load/warn**: `/skin search ea7` korundu — `/kick` dialog aksiyonundan çalışmıyor, `/dialog clear @s` onay istiyor; sunucudan atan tek oyuncu-taraflı geçici çözüm.
- **load**: `function macro:cmd/sound_all {…}` → `with storage macro:input {}` sözdizimi düzeltildi.
- **cmd/ride**, **cmd/ride_dismount**, **cmd/spectate**, **cmd/spectate_stop**: Raw isim enjeksiyonu → `@a[name=…,limit=1]` selector with değiştirildi.

---

### v3.4

### 🐛 Bug Fixes

- **load/warn**: Player yoksa `macro:load` direkt çalışır (`return run` guard).
- **load/warn**: `@p` → `@a` — tüm çevrimiçi oyunculara uyarı gösterilir.

### ✨ Yeni

- `load/warn.mcfunction`: Sunucu yüklenirken deneysel özellikler hakkında onay dialogu.
- `event/unregister_one`, `event/has`, `event/count`, `event/clear_context`, `event/fire_queued`
- `lib/queue_clear`, `lib/schedule_list`, `lib/schedule_reset`
- `math/map`, `math/wrap`, `math/log2`, `math/mod`
- `flag/set`, `flag/unset`, `flag/get`, `flag/toggle`, `flag/list`
- `state/set`, `state/get`, `state/is`, `state/clear`, `state/clear_all`, `state/list`
- `cmd/msg`, `cmd/msg_raw`, `cmd/clone`, `cmd/clone_masked`
- `cmd/ride`, `cmd/ride_dismount`, `cmd/forceload_add`, `cmd/forceload_remove`
- `cmd/trigger_set`, `cmd/spectate`, `cmd/spectate_stop`
- `cmd/place_feature`, `cmd/place_structure`
- Versiyon tutarlılığı: `load.mcfunction`, `pack.mcmeta`, storage versiyonları `v3.4` with eşleştirildi.

---

### v3.3

### ✨ New: `data/macro/damage_type/`

| Dosya | `message_id` | Efekt | Scaling |
|---|---|---|---|
| `macro:magic` | magic | none | never |
| `macro:true_damage` | generic | none | never |
| `macro:void_custom` | outOfWorld | none | never |
| `macro:fire_custom` | inFire | burning | when_caused_by_living_non_player |
| `macro:wither_custom` | wither | wither | never |

### ✨ New: `data/macro/item_modifier/`

`repair_full`, `damage_random`, `enchant_randomly`, `enchant_with_levels_5`, `enchant_with_levels_30`, `set_count_1`, `set_count_64`, `lore_add_custom`, `lore_clear`, `glint_add`, `glint_remove`, `unbreakable`, `hide_tooltip`, `rename_to_custom`

### ✨ New: `data/macro/loot_table/`

`util/empty`, `util/xp_only`, `template/single_item`, `template/weighted_pool`, `template/conditional_drop`, `template/bonus_per_looting`

### ✨ New: `data/macro/advancement/`

`hidden/root`, `template/task`, `template/goal`, `template/challenge`

### ✨ New: Predicate Genişlemesi

`is_flying`, `is_gliding`, `is_in_water`, `is_baby`, `is_hungry`, `is_holding_sword`, `is_holding_bow`, `is_holding_trident`, `has_empty_offhand`, `weather_clear`, `health_below_half`

### ✨ New: `cmd/` Functionları

`cmd/attribute_add_modifier`, `cmd/attribute_remove_modifier`, `cmd/attribute_get_modifier`, `cmd/damage_typed`, `cmd/item_modify`, `cmd/item_rename`, `cmd/loot_drop`, `cmd/loot_give`, `cmd/advancement_grant`, `cmd/advancement_revoke`, `cmd/advancement_check`

### ✨ New: `string/` Functionları

`string/hover_text`, `string/click_run`, `string/click_suggest`, `string/link`, `string/copy_to_clipboard`, `string/announce_prefix`, `string/tooltip_item`

---

### v3.2

### 🐛 Bug Fixes

- **math/random**: `$epoch=0` durumunda LCG tohumunun zayıf kalması giderildi — 57005 (0xDEAD) sabit ofseti eklendi. `tick*31` entropi eklendi.
- **math/log2**: `log2(2)=0` dönüyordu (doğrusu 1) — döngü sırası düzeltildi.

### ✨ Yeni

- `event/fire_queued`: Gecikmeli event tetikleme — `_fdeferred` race condition giderildi, event adı doğrudan queue item'a gömülür.
- `lib/queue_clear`, `lib/schedule_list`, `lib/schedule_reset`
- `math/map`, `math/wrap`, `math/log2`, `math/mod`
- `flag/`, `state/` modülleri (ilk sürüm)
- `cmd/msg`, `cmd/msg_raw`, `cmd/clone`, `cmd/clone_masked`, `cmd/ride`, `cmd/ride_dismount`, `cmd/forceload_add`, `cmd/forceload_remove`, `cmd/trigger_set`, `cmd/spectate`, `cmd/spectate_stop`, `cmd/place_feature`, `cmd/place_structure`

---

### v3.1

### 🐛 Bug Fixes

- **lib/schedule**: Aynı key with tekrar çağrılınca queue'ya duplicate giriş eklenmesi giderildi.
- **lib/input_push/pop**: Tüm `cmd/` alanları dahil edildi (ses, parçacık, entity, başlık, efekt, bossbar, gamerule, tp).

---

### v3.0

### 🐛 Bug Fixes

- **load**: `$epoch macro.time` artık `/reload`'da sıfırlanmıyor — `unless score … matches -2147483648..2147483647` guard'ı with yalnızca ilk on load sıfırlanır.
- **lib/process_queue**: `$pq_depth` with tick başına 256 özyineleme limiti — stack overflow engeli.
- **tick**: Her tick'te `$pq_depth` sıfırlanıyor.
- **debug/example_events**: `event_context set value {}` geçersizdi — `data remove` + tek tek `data modify` with düzeltildi. `event_context$(player)` → `event_context.player` nokta düzeltildi.
- **version**: Tüm referanslar v3.0 olarak eşleştirildi.

### ✨ Yeni Modüller

| Modül | Functionlar |
|---|---|
| `math/` | `sign`, `abs`, `clamp`, `lerp`, `sqrt`, `ceil_div`, `distance2d`, `pow`, `min`, `max` + `internal/sqrt_step`, `internal/pow_loop` |
| `team/` | `create`, `delete`, `add`, `remove`, `has`, `set_color`, `set_friendly_fire`, `count`, `list` |
| `config/` | `set`, `set_int`, `set_default`, `get`, `has`, `delete`, `list`, `reset` |
| `lib/` | `input_push`, `input_pop`, `for_each_list`, `throttle`, `debounce`, `schedule_renew` |

---

### v2.5

### 🐛 Bug Fixes

- **lib/process_queue**: Aynı tick'te birden fazla `delay=0` item varsa hepsi işleniyor.
- **player/increment**, **player/decrement**: `macro:input.amount` artık kirletilmiyor — doğrudan scoreboard with ekleme/çıkarma yapılıyor.

---

### v2.4

### 🐛 Bug Fixes

| Bug | Dosya | Düzeltme |
|---|---|---|
| **KRİTİK**: Cooldown'lar hiç dolmuyordu | `cooldown/set`, `check`, `remaining` | `$tick macro.tmp` (0–20 arası sıfırlmainn) → `$epoch macro.time` (mutlak, sıfırlanmaz) |
| `macro.time` objective missing | `load`, `tick` | `$epoch macro.time` her tick +1, `/reload`'da sıfırlanmaz |
| `progress_bar` görsel blok yerine ham sayı gösteriyordu | `string/progress_bar` | 11'li `█░` lookup tablosu |
| `fire_next` NBT predicate yanlıştı | `event/internal/fire_next` | `{event_queue:[{}]}` → `event_queue[0]` path kontrolü |
| `distance2d` caller input'u bozuyordu | `math/distance2d` | sqrt inline çalışıyor, `macro:input` kirlenmiyor |
| `ceil_div`'de `$cd_1` cooldown prefix'iyle çakışıyordu | `math/ceil_div` | `$cd_1` → `$cdv_1`, `$a/$b` → `$cdv_a/$cdv_b` |
| `sync_tick` global epoch'u storage'a yazmıyordu | `lib/sync_tick` | `global.epoch` de sync ediliyor |

---

### v2.3

### ✨ Yeni Modüller ve Functionlar

| Modül | Eklenenler |
|---|---|
| `cooldown/` | `set`, `check`, `remaining`, `clear`, `clear_all` |
| `event/` | `register`, `fire`, `unregister`, `list` + `internal/fire_next` |
| `lib/` | `for_each_player`, `for_each_player_at`, `repeat`, `wait` |
| `math/` | `sign`, `lerp`, `sqrt`, `ceil_div`, `distance2d` |
| `cmd/` | `kill`, `damage`, `heal`, `particle`, `clear`, `clear_item`, `tag_add`, `tag_remove`, `scoreboard_set`, `scoreboard_get`, `scoreboard_add`, `title_times`, `title_reset`, `title_clear` |
| `string/` | `progress_bar`, `announce`, `announce_prefix` |
| `player/` | `reset`, `list_vars`, `add_default`, `increment`, `decrement` |

---

### v2.2

### 🐛 Bug Fixes

| Bug | Düzeltme |
|---|---|
| `load`: `data remove storage macro:input {}` geçersiz | `data modify … set value {}` |
| `cmd/title_sub`: subtitle rengi hardcoded `"gray"` | `"color":"$(color)"` with dinamik |
| `cmd/as_player` vb.: `val` parametresi tutarsızlığı | `val` → `func` |
| `debug/show_all`: `nbt:""` boş path geçersiz | Bölümlere ayrıldı |
