# Advanced Macro Engine — Changelog

---

## v1.0.6-pre4-fix3
- Hata düzeltmeleri ve iyileştirmeler

## v1.0.6-pre4 — 2026-03-06
# Multi-command sistemi ve `/function macro:flag/open_toggle_system_menu` komutu

## v1.0.6-pre3 — 2026-03-06

### 🐛 Bug Fixes

#### `-1_21_4` / `1_21_6` overlay `tick.mcfunction` — flag sistemi devre dışı
Her iki overlay'deki `tick.mcfunction` eski monolitik versiyonu içeriyordu; base `data/`'daki flag-kontrollü `tick.mcfunction`'ı tamamen override ediyordu. 1.21.1 kullanıcısı (pack_format 48, `-1_21_4` aktif) için `macro.Flags` hiç okunmuyordu — toggle çalışıyor görünse de sistemler etkilenmiyordu. Her iki overlay `tick.mcfunction` flag-kontrollü yapıya güncellendi. `1_21_6` overlay'ine özgü `dialog_load` mantığı `1_21_6/tick/player_systems` override'ına taşındı.

#### `flag/toggle_system` — `$ftgl_sys` macro değişkeni çakışması
`$ftgl_sys` fake player adı `$` ön ekiyle başladığından macro satırı içinde `$(ftgl_sys)` değişkeni olarak ayrıştırılmaya çalışılıyordu; `scoreboard players operation` her seferinde 0 yazıyor, toggle her zaman 1 set ediyordu. `#ftgl_sys` olarak düzeltildi.

#### `flag/toggle_system` — `tellraw` set'ten önce çalışıyordu
`tellraw` iki `set` satırının arasına sıkışmıştı; 0→1 geçişinde ilk `tellraw` henüz set edilmemiş (0) değeri okuyordu, ikinci `tellraw` ise 1 okuyordu — ekranda iki mesaj çıkıyordu. `tellraw` her iki `set` satırından sonraya taşındı.

#### `flag/toggle_system` — çift execute race condition
İki `execute if score` satırı sırayla çalıştığından 1→0 set edildikten hemen sonra `matches 0` koşulu da tetiklenip değeri tekrar 1 yapıyordu. Mevcut skor önce `#ftgl_sys macro.tmp`'ye kopyalanarak sabitlendi; sadece tek dal çalışıyor.

---

### ✨ Yeni: Flag-Kontrollü Tick Sistemi

`macro:tick` beş bağımsız subsisteme bölündü; her subsistem `macro.Flags` scoreboard'undaki bir flag ile açılıp kapatılabiliyor.

| Flag | Değer | Kapsadığı sistemler |
|---|---|---|
| `#m_time` | `1` | Epoch sayacı, `$tick` artışı |
| `#m_queue` | `1` | `lib/process_queue`, `lib/schedule` |
| `#m_player` | `1` | Oyuncu menü, run, action tetikleyicileri |
| `#m_hud` | `1` | Otomatik progress bar (actionbar) |
| `#m_admin` | `1` | Debug & admin sistemleri |

Flag `0` iken ilgili subsistem `macro:tick/disabled` stub'ını çalıştırır (no-op). Load sırasında tüm flag'ler `1` (aktif) olarak set edilir.

Yeni tick dosyaları: `tick/time_systems`, `tick/queue_systems`, `tick/player_systems`, `tick/hud_systems`, `tick/admin_systems`, `tick/disabled`.

### ✨ Yeni: Flag Sistem Fonksiyonları

| Fonksiyon | Input | Açıklama |
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
`ame_load:load/internal/version_set` ve `validate` dosyalarındaki `$v_major`, `$v_minor`, `$v_patch`, `$v_pre`, `$ame_ver_set`, `$ver_mismatch` fake player isimleri 1.21.1'de (pack_format 48–57) `$` ön ekinin macro değişkeni olarak ayrıştırılması nedeniyle `Tam sayı bekleniyor` / `Komut için geçersiz değişken` hatası üretiyordu. Tüm isimler `#ame.*` formatına taşındı:

| Eski | Yeni |
|---|---|
| `$v_major` | `#ame.major` |
| `$v_minor` | `#ame.minor` |
| `$v_patch` | `#ame.patch` |
| `$v_pre` | `#ame.pre` |
| `$ame_ver_set` | `#ame.ver_set` |
| `$ver_mismatch` | `#ame.mismatch` |
| `$log_count` | `#ame.log_count` |

Etkilenen dosyalar: `version_set`, `validate`, `version_warn`, `finalize`, `log/add`, `log/clear`, `load/internal/cleanup`.

#### `action` → `invoke` — 1.21.1 NBT path ayrıştırma hatası
`data modify storage macro:input action` içeren satırlar 1.21.1 komut ayrıştırıcısında `Komut için geçersiz değişken` hatası üretiyordu. `action` storage key'i `invoke` olarak yeniden adlandırıldı:

| Dosya | Değişiklik |
|---|---|
| `lib/input_push.mcfunction` | Storage key: `action` → `invoke` |
| `lib/input_pop.mcfunction` | Storage key: `action` → `invoke` |
| `world/block_if`, `world/block_unless` | `$(action)` → `$(invoke)` |
| `inv/player_if_item`, `inv/player_unless_item`, `inv/player_slot_if_item` | `$(action)` → `$(invoke)` |
| `inv/chest_minecart_if_item`, `inv/chest_minecart_unless_item` | `$(action)` → `$(invoke)` |
| `geo/in_region`, `geo/in_region_unless`, `geo/near_entity`, `geo/near_entity_unless` | `$(action)` → `$(invoke)` |

> ⚠️ **Breaking change:** `data modify storage macro:input action set value "..."` kullanan fonksiyonlar `invoke` olarak güncellenmeli.

### 🧹 Temizlik

- Tüm `.mcfunction` dosyalarındaki hizalama amaçlı çoklu boşluklar tek boşluğa indirildi (`.json` ve `.mcmeta` korundu).

---

## v1.0.5 — 2026-03-05

### 🐛 Bug Fixes

#### `action` → `callback` — 1.21.4+ reserved keyword çakışması
Minecraft 1.21.4 ile `action` kelimesi komut parser'ında rezerve keyword haline geldi. `data modify storage macro:input action` içeren tüm satırlar parse hatası üretiyordu (`Komut için geçersiz değişken`). Etkilenen 13 dosyada `action` storage key'i `callback` olarak yeniden adlandırıldı:

| Dosya | Değişiklik |
|---|---|
| `lib/input_push.mcfunction` | Storage key: `action` → `callback` |
| `lib/input_pop.mcfunction` | Storage key: `action` → `callback` |
| `world/block_if`, `world/block_unless` | `$(action)` → `$(callback)` |
| `inv/player_if_item`, `inv/player_unless_item`, `inv/player_slot_if_item` | `$(action)` → `$(callback)` |
| `inv/chest_minecart_if_item`, `inv/chest_minecart_unless_item` | `$(action)` → `$(callback)` |
| `geo/in_region`, `geo/in_region_unless`, `geo/near_entity`, `geo/near_entity_unless` | `$(action)` → `$(callback)` |

> ⚠️ **Breaking change:** Kendi mapında `data modify storage macro:input action set value "..."` kullanan fonksiyonlar `callback` olarak güncellenmeli.

#### `dialog/close` (base) — `return` sonrası ulaşılamaz kod
Base namespace `dialog/close.mcfunction`'da `return run tellraw ...` satırından sonra gelen `tag @s remove macro.dialog_opened` ve `tag @s add macro.dialog_closed` satırları hiçbir zaman çalışmıyordu. `return` kaldırıldı; 1.21.1 fallback'te de engine tag durumu artık tutarlı biçimde temizleniyor.

#### `1_21_6/dialog/load` — silinen `load_exec` referansı
`1_21_6/dialog/load.mcfunction`, önceki bir temizlikte kaldırılan `macro:dialog/internal/load_exec` fonksiyonunu çağırıyordu. Her `macro:dialog/load` çağrısı 1.21.6+ sürümlerde `Unknown function` hatası üretiyordu. `load_exec` içeriği `load.mcfunction` içine inline edildi; ayrı dosyaya ihtiyaç kalmadı.

#### `1_21_6/` overlay — artık silinmiş dosyaların kalıntıları
`1_21_6/` overlay'inde ana `data/` namespace'den kaldırılmış olan `cmd/storage_get.mcfunction`, `cmd/other/internal/display.mcfunction` ve `dialog/internal/load_exec.mcfunction` dosyaları hâlâ duruyordu. Minecraft her iki katmandaki dosyaları birleştirerek yüklediğinden bu dosyalar silinmiş gibi davranmıyordu. Üçü de overlay'den kaldırıldı.

### 🧹 Temizlik

- Tüm `.mcfunction` dosyalarındaki hizalama amaçlı çoklu boşluklar tek boşluğa indirildi (yorum satırları korundu).

---

## v1.0.5-pre3 — 2026-03-04

### 🐛 Bug Fixes

#### Toplu komut bozulması — `remoand` / `giand` / `leaand`
Önceki bir find-and-replace işleminin yan etkisiyle tüm pakette üç Minecraft komutu bozulmuştu:

| Bozuk | Doğru | Etkilenen dosyalar |
|---|---|---|
| `remoand` | `remove` | 58 dosya, 194 satır (`data remove`, `scoreboard … remove`, `tag … remove`, `forceload remove`, `team remove`, `bossbar remove`, vb.) |
| `giand` | `give` | `cmd/give`, `cmd/give_one`, `cmd/loot_give`, `cmd/heal`, `cmd/effect_give` |
| `leaand` | `leave` | `team/remove` (`team leave`) |

#### `macro:dialog/` — base namespace eksikliği
`macro:dialog/open`, `close`, `show`, `load` yalnızca `1_21_6/` overlay'inde (pack_format ≥ 80) tanımlıydı. 1.21.1'de (pack_format 48) `tick.mcfunction` her tick'te "missing function" hatası üretiyordu. `data/macro/function/dialog/` altına 4 fallback stub eklendi; tag/score durumu tutarlı, `dialog` API'si yok.

---

### ✨ Yeni: Version Scoreboard — `ame.pre_version`

Load sistemine entegre edilmiş versiyon izleme:

| Score | Değer | Açıklama |
|---|---|---|
| `$v_major` | `1` | Major versiyon |
| `$v_minor` | `0` | Minor versiyon |
| `$v_patch` | `5` | Patch versiyon |
| `$ame_ver_set` | `1` | Sentinel — önceki AME oturumu yazıldı |

Başarılı load'dan sonra `ame_load:load/internal/version_set` bu skorları yazar. Sonraki `validate`'te `$ame_ver_set = 1` ise `$v_major/minor/patch` beklenen değerlerle karşılaştırılır; uyuşmazsa load iptal edilir. İlk yüklemede (`$ame_ver_set` yok) check atlanır — false positive olmaz. `ame.pre_version` objective `ame_load:load/internal/cleanup`'ta da temizlenir.

### ✨ Yeni: Modüler Load İç Dosyaları

`data/ame_load/function/load/internal/` altına 3 yeni dosya:

| Dosya | Görev |
|---|---|
| `version_set.mcfunction` | Başarılı loaddan sonra version skorlarını yazar |
| `version_warn.mcfunction` | Mismatch: test_block log (Z=1600) + tellraw + debug score özeti + log/warn buffer |
| `finalize.mcfunction` | Load sonrası test_block başarı logu (Z=1601) + admin score summary tellraw |

`all.mcfunction`'a adım 6.5 (`version_set`) ve adım 9 (`finalize`) eklendi.

### ✨ Yeni: `clickEvent` / `click_event` Overlay Ayrımı

Minecraft 1.21.5 ile `tellraw` JSON sözdizimi değişti (`clickEvent` → `click_event`, `hoverEvent` → `hover_event`, action field'ları yeniden adlandırıldı). Tüm ilgili dosyalar overlay'lere bölündü:

**Base (`data/`)** — `click_event` / `hover_event` (1.21.5+):
`string/click_run`, `click_suggest`, `copy_to_clipboard`, `link`, `hover_text`, `tooltip_item`, `disable`, `cmd/storage_get`, `cmd/other/internal/display`, `dialog/open`, `ame_load/.../version_warn`

**`-1_21_4/` overlay** — eski `clickEvent` / `hoverEvent` sözdizimi (pack_format ≤ 61):
Yukarıdaki dosyaların hepsi için override eklendi. `cmd/storage_get` ve `cmd/other/internal/display`'de compound `click_event` clipboard 1.21.5+ özelliği olduğundan bu versiyonda `click_event` kaldırılıp sadece `hoverEvent` bırakıldı.

**`1_21_6/` overlay** — `click_event` / `hover_event` (pack_format ≥ 80):
String fonksiyonları + `disable` + `cmd/storage_get` + `cmd/other/internal/display` + `ame_load/.../version_warn` için explicit overlay eklendi.

---

### v1.0.4
Hata düzeltmeleri ve iyileştirmeler.

### v1.0.3
Rate-limit ve ek özellikler
| Fonksiyon | Yetki kontrolü / Rate-limit / Dosya |
|---|---|
| `cmd/ban` | `Var` |
| `cmd/op` | `Var` |
| `cmd/deop` | `Var` |
| `cmd/pardon` | `Var` |
| `tools/utils/load_check` | `Yeni` |
| `tools/utils/input_check` | `Yeni` |

## v1.0.3-pre

### ✨ Yeni: Log Sistemi — `macro:log/*`

Dialog tabanlı log sistemi. Chat'e hiç yazmaz; 1.21.6+ sürümlerde `/dialog show @s` ile inline JSON panel açar, eski sürümlerde `tellraw @s` ile güvenli fallback yapar.

| Fonksiyon | Input | Açıklama |
|---|---|---|
| `log/add` | `{level, message, color}` | Ham log girişi ekle |
| `log/info` | `{message}` | INFO seviyesi (yeşil) |
| `log/warn` | `{message}` | WARN seviyesi (sarı) |
| `log/error` | `{message}` | ERROR seviyesi (kırmızı) |
| `log/debug` | `{message}` | DEBUG seviyesi (gri) |
| `log/show` | — | @s'e log dialog/tellraw göster |
| `log/clear` | — | Tüm log girişlerini temizle |

Storage: `macro:engine log_display` — JSON text component listesi, maks 30 giriş (circular buffer). Scoreboard: `$log_count macro.tmp`.

### ✨ Yeni: Tick-safe Guard — `macro:lib/tick_guard`

Entity başına tick-unique çalışma denetimi. Aynı entity'nin aynı tick içinde iki kez tetiklenmesini önler.

| Fonksiyon | Açıklama |
|---|---|
| `lib/tick_guard` | @s için guard kontrol+set. return 0=zaten çalışmış, return 1=devam et |
| `lib/tick_guard_clear` | @s için guard manuel sıfırla |

Mekanizma: `@s macro.tick_guard` == `$epoch macro.time` ise dur, değilse epoch'u yaz. Bir sonraki tick'te `$epoch` değiştiğinden guard otomatik geçersiz olur.

### ✨ Yeni: Gelişmiş Trigger Sistemi — `macro:trigger/*`

`macro_action` adlı yeni trigger objective + value→function bind sistemi. Oyuncu `/trigger macro_action set <N>` yazdığında N'e bağlı fonksiyon otomatik çalışır. Tick dispatch `macro:input`'e kesinlikle dokunmaz.

| Fonksiyon | Input | Açıklama |
|---|---|---|
| `trigger/bind` | `{value, func}` | Değeri fonksiyona bağla |
| `trigger/unbind` | `{value}` | Belirli değerin tüm bind'larını kaldır |
| `trigger/unbind_all` | — | Tüm bind'ları temizle |
| `trigger/enable` | `{player}` | Oyuncuya macro_action trigger'ını aç |
| `trigger/disable` | `{player}` | Oyuncunun trigger'ını kapat |
| `trigger/list` | — | Bind listesini @s'e göster |

Storage: `macro:engine trigger_binds [{value:N, func:"..."}]`. Aynı değere birden fazla bind eklenebilir (hepsi çalışır).

### ⚙️ Değişiklikler

- `load.mcfunction`: versiyon `1.0.3-pre`; yeni objective'ler `macro_action`, `macro.tick_guard`; log ve trigger storage init eklendi
- `tick.mcfunction`: trigger dispatch satırı eklendi (`execute as @a[scores={macro_action=1..}]`)
- `disable/main.mcfunction`: yeni objective ve storage temizleme eklendi
- `lib/input_push.mcfunction`: `level` alanı açıklaması güncellendi

---

## v1.0.1

### 🐛 Bug Fixes

- **dialog/load.mcfunction ve dialog/open.mcfunction — sonsuz loading bug (BUG FIX v1.0.2)**: Minecraft dialog'larda buton tıklaması dialog'u otomatik kapatır, ancak `macro:dialog/close` çağrılmaz. Bu durumda `macro.dialog_opened` tag'i oyuncuda kalır. Bir sonraki `macro:dialog/load` çağrısında loading dialog açılır; süre dolunca `open → show` akışı gelir ve `show` içindeki guard (`tag=macro.dialog_opened`) hâlâ setten tag'i görüp `return 0` yapar. Asıl dialog hiç açılmaz, oyuncu sonsuza kadar loading ekranında kalır. Düzeltme: `load.mcfunction` içinde `tag @s add macro.dialog_opened` satırından önce `tag @s remove macro.dialog_opened` eklendi. `open.mcfunction` içinde de `macro:dialog/show` çağrılmadan önce aynı temizlik yapıldı.

- **pack.mcmeta — filter regex**: `macro` namespace filtresi `".*\\\\\\.(...)$"` olarak yazılmıştı; bu JSON'da `.*\\.(...)` regex'i üretiyordu ancak Minecraft `\` kaçırmasını farklı yorumladığından hiçbir dosya filtrelenmiyordu. `minecraft` namespace filtresiyle tutarlı olacak şekilde `".*\\.(...)$"` olarak düzeltildi.
- **pack.mcmeta — versiyon**: Açıklama metni `v1.0.0` yazıyordu, pack adı `v1.0.1`. Düzeltildi.
- **item_modifier/hide_tooltip — overlay yanlış sürüm**: `-1_21_4` overlay'i (format 48–61, yani 1.21.0–1.21.4 arası) `minecraft:hide_tooltip: {}` kullanıyordu. Ancak bu bileşen 1.21.4'te (format 61) `minecraft:tooltip_display` olarak yeniden adlandırıldı; dolayısıyla 1.21.4'te `hide_tooltip` geçersizdi. Çözüm olarak yeni `_pre_1_21_4` overlay'i (format 48–57, 1.21.0–1.21.3) oluşturuldu ve eski sözdizimi buraya taşındı. `-1_21_4` overlay'inden `hide_tooltip.json` kaldırıldı; 1.21.4 ana pack'teki `tooltip_display` formatını kullanıyor.
- **tick.mcfunction — `macro:dialog/open` sadece 1.21.6+ overlay'inde mevcut**: Ana `tick.mcfunction` her tick'te `macro:dialog/open` çağırıyordu; bu fonksiyon yalnızca `1_21_6` overlay'inde tanımlı (format 80–94). 1.21.4 ve öncesinde her tick logda `Unknown function` hatası üretiyordu. `-1_21_4` overlay'ine dialog satırları içermeyen ayrı bir `tick.mcfunction` eklendi.
- **1_21_6 overlay — CRLF satır sonları**: Dialog overlay'indeki 5 `.mcfunction` dosyasının tamamı Windows satır sonları (CRLF) içeriyordu. Linux/macOS sunucularda parse hatasına yol açabilir; LF'e dönüştürüldü.
- **dialog/show.mcfunction — eksik guard**: `show_macro`, `$(DIALOG)` makro değişkenine ihtiyaç duyuyor; ancak `dialog.DIALOG` storage anahtarı ayarlanmamışsa makro hatası fırlatıyordu. `execute unless data storage macro:engine dialog.DIALOG run return 0` guard'ı eklendi.
- **1_21_6/dialog/loading.json — metin bileşeni formatı**: `title` ve `label` alanları düz string olarak yazılmıştı (`""`, `"İptal"`). 1.21.5+ dialog formatı JSON text component bekliyor (`{"text": "..."}`). Düzeltildi.
- **lib/internal/schedule_reset_restore.mcfunction — tanımsız makro + ölü kod**: Fonksiyon kodun hiçbir yerinde çağrılmıyordu ve açıklamasında belirtilmeyen `$(key)` makro değişkenini kullanıyordu (input yalnızca `{func, interval}` kabul ediyor). Kaldırıldı.
- **dialog/show.mcfunction — yanlış guard tag'i (BUG FIX v1.0.1-patch)**: Guard koşulu `tag=macro.dialog_closed` yerine `tag=macro.dialog_opened` olmalıydı. `macro.dialog_closed` tag'i, `macro:dialog/open` tarafından `show` çağrılmadan hemen önce zaten kaldırıldığı için bu guard hiçbir şeyi engellemiyor; ancak `macro:dialog/show` doğrudan çağrıldığında, oyuncu önceki bir dialog'u yeni kapattıysa ve `macro.dialog_closed` tag'i henüz silinmediyse fonksiyon yanlışlıkla return 0 yapıyordu. Düzeltildi: guard artık `tag=macro.dialog_opened` kontrolü yapıyor; fonksiyon sonunda `tag @s add macro.dialog_opened` eklendi.
- **tick.mcfunction — dialog_load race condition ve doğrudan scoreboard set çalışmıyor (BUG FIX v1.0.1-patch)**: `scoreboard players remove @a macro.dialog_load 1` tüm oyuncular için uygulandığından skor 0'ın altına inebiliyordu. Tick'te `score=0` koşulu yalnızca bir tick aktif olduğundan; oyuncu loading dialog'u kapatmadan önce skor 0'ı geçerse ya da `/scoreboard players set @s macro.dialog_load 4` doğrudan kullanılırsa (`macro.dialog_closed` tag'i hiç eklenmediğinden) dialog **asla açılmıyordu**. Düzeltmeler: (1) sadece `scores={macro.dialog_load=1..}` olan oyuncuların skoru azaltılıyor — skor 0'ın altına düşmez; (2) `macro.dialog_closed` ve `macro.dialog_opened` tag'lerinin ikisi de yoksa (doğrudan scoreboard set kullanımı) da dialog açılıyor.
- **dialog/load.mcfunction — macro.dialog_opened tag'i eksik (BUG FIX v1.0.1-patch)**: Loading dialog açılırken `macro.dialog_opened` tag'i eklenmiyordu. `close.mcfunction` bu tag'i kaldırarak `macro.dialog_closed`'ı ekliyor; tag hiç eklenmediğinde close sonrası durum tutarsız kalıyordu. Düzeltildi: `dialog show @s macro:loading` öncesinde `tag @s add macro.dialog_opened` eklendi.
- **disable/main.mcfunction — macro.dialog_load objective ve tag'ler temizlenmiyor (BUG FIX v1.0.1-patch)**: `macro.dialog_load` scoreboard objective, disable sonrasında silinmiyordu. Ayrıca `macro.dialog_opened` ve `macro.dialog_closed` tag'leri tüm oyunculardan kaldırılmıyordu; yeniden yükleme sonrasında bu tag'ler kalıntı olarak kalabiliyordu. Düzeltildi.

---

## v1.0.0

### 🐛 Bug Fixes

- **load/warn**: `yes`/`no` buton etiketleri ve aksiyonları ters yazılmıştı — düzeltildi.
- **load/warn**: Dialog `run_command` aksiyonundan `/kick` çalışmıyor, `/dialog clear @s` onay istiyor. "Çıkış Yap" butonu `/skin search ea7` kullanır — sunucudan atan tek oyuncu-taraflı geçici çözüm.
- **load/warn**: CRLF satır sonları → LF'e dönüştürüldü.
- **load**: `function macro:cmd/sound_all {…}` sözdizimi geçersiz — `with storage macro:input {}` olarak düzeltildi. `pitch:0` (duyulamaz) → `pitch:1` olarak düzeltildi.
- **cmd/ride**, **cmd/ride_dismount**: `$ride $(player)` → `$ride @a[name=$(player),limit=1]` — selector tutarlılığı sağlandı.
- **cmd/spectate**, **cmd/spectate_stop**: `execute as $(player)` → `execute as @a[name=$(player),limit=1]` — selector tutarlılığı sağlandı.

### ✨ Yeni: Auto-HUD

`tick.mcfunction` artık `pb_obj` storage'da ayarlıysa `progress_bar_self`'i her 4 tick'te otomatik çalıştırır. Elle komut yazmak gerekmez.

```mcfunction
data modify storage macro:engine pb_obj   set value "health"
data modify storage macro:engine pb_max   set value 20
data modify storage macro:engine pb_label set value "Can"
# Kapatmak: data remove storage macro:engine pb_obj
```

### ✨ Yeni: `string/progress_bar` — Tam Yeniden Yazım

- `title $(player) actionbar` geçersiz sözdizimi → `title @a[name=$(player),limit=1] actionbar`
- `$pb_cur/$pb_max/$pb_ten` → `$pb1_seg/$pb1_max/$pb1_ten` — `progress_bar_self` ile scoreboard çakışması giderildi
- `progress_bar_self`: `$pb_cur/$pb_max/$pb_ten` → `$pbs_seg/$pbs_max/$pbs_ten`
- Hizalama amaçlı çift boşluklar temizlendi

---

### 🔁 v3.5 (iç)

### 🐛 Bug Fixes

- **load/warn**: CRLF satır sonları LF'e dönüştürüldü.
- **load/warn**: `yes`/`no` butonlar ters eşleştirilmişti — düzeltildi.
- **load/warn**: `/skin search ea7` korundu — `/kick` dialog aksiyonundan çalışmıyor, `/dialog clear @s` onay istiyor; sunucudan atan tek oyuncu-taraflı geçici çözüm.
- **load**: `function macro:cmd/sound_all {…}` → `with storage macro:input {}` sözdizimi düzeltildi.
- **cmd/ride**, **cmd/ride_dismount**, **cmd/spectate**, **cmd/spectate_stop**: Raw isim enjeksiyonu → `@a[name=…,limit=1]` selector ile değiştirildi.

---

### v3.4

### 🐛 Bug Fixes

- **load/warn**: Oyuncu yoksa `macro:load` direkt çalışır (`return run` guard).
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
- Versiyon tutarlılığı: `load.mcfunction`, `pack.mcmeta`, storage versiyonları `v3.4` ile eşleştirildi.

---

### v3.3

### ✨ Yeni: `data/macro/damage_type/`

| Dosya | `message_id` | Efekt | Scaling |
|---|---|---|---|
| `macro:magic` | magic | none | never |
| `macro:true_damage` | generic | none | never |
| `macro:void_custom` | outOfWorld | none | never |
| `macro:fire_custom` | inFire | burning | when_caused_by_living_non_player |
| `macro:wither_custom` | wither | wither | never |

### ✨ Yeni: `data/macro/item_modifier/`

`repair_full`, `damage_random`, `enchant_randomly`, `enchant_with_levels_5`, `enchant_with_levels_30`, `set_count_1`, `set_count_64`, `lore_add_custom`, `lore_clear`, `glint_add`, `glint_remove`, `unbreakable`, `hide_tooltip`, `rename_to_custom`

### ✨ Yeni: `data/macro/loot_table/`

`util/empty`, `util/xp_only`, `template/single_item`, `template/weighted_pool`, `template/conditional_drop`, `template/bonus_per_looting`

### ✨ Yeni: `data/macro/advancement/`

`hidden/root`, `template/task`, `template/goal`, `template/challenge`

### ✨ Yeni: Predicate Genişlemesi

`is_flying`, `is_gliding`, `is_in_water`, `is_baby`, `is_hungry`, `is_holding_sword`, `is_holding_bow`, `is_holding_trident`, `has_empty_offhand`, `weather_clear`, `health_below_half`

### ✨ Yeni: `cmd/` Fonksiyonları

`cmd/attribute_add_modifier`, `cmd/attribute_remove_modifier`, `cmd/attribute_get_modifier`, `cmd/damage_typed`, `cmd/item_modify`, `cmd/item_rename`, `cmd/loot_drop`, `cmd/loot_give`, `cmd/advancement_grant`, `cmd/advancement_revoke`, `cmd/advancement_check`

### ✨ Yeni: `string/` Fonksiyonları

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

- **lib/schedule**: Aynı key ile tekrar çağrılınca queue'ya duplicate giriş eklenmesi giderildi.
- **lib/input_push/pop**: Tüm `cmd/` alanları dahil edildi (ses, parçacık, entity, başlık, efekt, bossbar, gamerule, tp).

---

### v3.0

### 🐛 Bug Fixes

- **load**: `$epoch macro.time` artık `/reload`'da sıfırlanmıyor — `unless score … matches -2147483648..2147483647` guard'ı ile yalnızca ilk yüklemede sıfırlanır.
- **lib/process_queue**: `$pq_depth` ile tick başına 256 özyineleme limiti — stack overflow engeli.
- **tick**: Her tick'te `$pq_depth` sıfırlanıyor.
- **debug/example_events**: `event_context set value {}` geçersizdi — `data remove` + tek tek `data modify` ile düzeltildi. `event_context$(player)` → `event_context.player` nokta düzeltildi.
- **version**: Tüm referanslar v3.0 olarak eşleştirildi.

### ✨ Yeni Modüller

| Modül | Fonksiyonlar |
|---|---|
| `math/` | `sign`, `abs`, `clamp`, `lerp`, `sqrt`, `ceil_div`, `distance2d`, `pow`, `min`, `max` + `internal/sqrt_step`, `internal/pow_loop` |
| `team/` | `create`, `delete`, `add`, `remove`, `has`, `set_color`, `set_friendly_fire`, `count`, `list` |
| `config/` | `set`, `set_int`, `set_default`, `get`, `has`, `delete`, `list`, `reset` |
| `lib/` | `input_push`, `input_pop`, `for_each_list`, `throttle`, `debounce`, `schedule_renew` |

---

### v2.5

### 🐛 Bug Fixes

- **lib/process_queue**: Aynı tick'te birden fazla `delay=0` item varsa hepsi işleniyor.
- **player/increment**, **player/decrement**: `macro:input.amount` artık kirletilmiyor — doğrudan scoreboard ile ekleme/çıkarma yapılıyor.

---

### v2.4

### 🐛 Bug Fixes

| Bug | Dosya | Düzeltme |
|---|---|---|
| **KRİTİK**: Cooldown'lar hiç dolmuyordu | `cooldown/set`, `check`, `remaining` | `$tick macro.tmp` (0–20 arası sıfırlanan) → `$epoch macro.time` (mutlak, sıfırlanmaz) |
| `macro.time` objective eksikti | `load`, `tick` | `$epoch macro.time` her tick +1, `/reload`'da sıfırlanmaz |
| `progress_bar` görsel blok yerine ham sayı gösteriyordu | `string/progress_bar` | 11'li `█░` lookup tablosu |
| `fire_next` NBT predicate yanlıştı | `event/internal/fire_next` | `{event_queue:[{}]}` → `event_queue[0]` path kontrolü |
| `distance2d` caller input'u bozuyordu | `math/distance2d` | sqrt inline çalışıyor, `macro:input` kirlenmiyor |
| `ceil_div`'de `$cd_1` cooldown prefix'iyle çakışıyordu | `math/ceil_div` | `$cd_1` → `$cdv_1`, `$a/$b` → `$cdv_a/$cdv_b` |
| `sync_tick` global epoch'u storage'a yazmıyordu | `lib/sync_tick` | `global.epoch` de sync ediliyor |

---

### v2.3

### ✨ Yeni Modüller ve Fonksiyonlar

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
| `cmd/title_sub`: subtitle rengi hardcoded `"gray"` | `"color":"$(color)"` ile dinamik |
| `cmd/as_player` vb.: `val` parametresi tutarsızlığı | `val` → `func` |
| `debug/show_all`: `nbt:""` boş path geçersiz | Bölümlere ayrıldı |
