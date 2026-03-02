# Advanced Macro Engine — Changelog

---

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