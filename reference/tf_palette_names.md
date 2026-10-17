# List the available palettes

List the available palettes

## Usage

``` r
tf_palette_names(faction = NULL, team = NULL, role = NULL, medium = "toy")
```

## Arguments

- faction:

  Optional faction (see
  [`tf_factions()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md))
  to restrict the list to. Matched case-insensitively and by unique
  prefix, so `"auto"` works.

- team:

  Optional team or subgroup (see
  [`tf_teams()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md))
  to restrict the list to, matched the same way.

- role:

  Optional role to restrict the list to: one of `"leader"`,
  `"combiner torso"`, `"combiner limb"`, `"combined form"` or
  `"subgroup member"`, matched the same way.

- medium:

  Which medium's palettes to list: `"toy"` (default), `"cartoon"`,
  `"comic"`, `"g2"`, or `"all"` for every palette regardless of medium.
  See
  [`tf_media()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

## Value

A character vector of palette names accepted by
[`tf_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette.md)
and the `scale_*_tf()` functions.

## Examples

``` r
tf_palette_names()
#>   [1] "optimus_prime"  "megatron"       "shockwave"      "soundwave"     
#>   [5] "silverbolt"     "air_raid"       "fireflight"     "skydive"       
#>   [9] "slingshot"      "superion"       "hot_spot"       "streetwise"    
#>  [13] "blades"         "groove"         "first_aid"      "defensor"      
#>  [17] "scattershot"    "lightspeed"     "nosecone"       "strafe"        
#>  [21] "afterburner"    "computron"      "grimlock"       "slag"          
#>  [25] "sludge"         "snarl"          "swoop"          "jazz"          
#>  [29] "prowl"          "ironhide"       "ratchet"        "wheeljack"     
#>  [33] "sunstreaker"    "sideswipe"      "hound"          "mirage"        
#>  [37] "trailbreaker"   "bluestreak"     "bumblebee"      "cliffjumper"   
#>  [41] "brawn"          "huffer"         "windcharger"    "gears"         
#>  [45] "hot_rod"        "rodimus_prime"  "ultra_magnus"   "kup"           
#>  [49] "blurr"          "springer"       "wreck_gar"      "galvatron"     
#>  [53] "cyclonus"       "scourge"        "gnaw"           "hook"          
#>  [57] "long_haul"      "scrapper"       "bonecrusher"    "mixmaster"     
#>  [61] "scavenger"      "devastator"     "motormaster"    "dead_end"      
#>  [65] "breakdown"      "drag_strip"     "wildrider"      "menasor"       
#>  [69] "onslaught"      "brawl"          "swindle"        "blast_off"     
#>  [73] "vortex"         "bruticus"       "hun_gurrr"      "blot"          
#>  [77] "cutthroat"      "rippersnapper"  "sinnertwin"     "abominus"      
#>  [81] "razorclaw"      "rampage"        "tantrum"        "headstrong"    
#>  [85] "divebomb"       "predaking"      "snaptrap"       "nautilator"    
#>  [89] "overbite"       "seawing"        "skalor"         "tentakil"      
#>  [93] "piranacon"      "slog"           "birdbrain"      "icepick"       
#>  [97] "bristleback"    "wildfly"        "scowl"          "monstructor"   
#> [101] "leozack"        "drillhorn"      "guyhawk"        "hellbat"       
#> [105] "jallguar"       "killbison"      "liokaiser"      "starscream"    
#> [109] "thundercracker" "skywarp"        "dirge"          "ramjet"        
#> [113] "thrust"         "laserbeak"      "buzzsaw"        "ravage"        
#> [117] "rumble"         "frenzy"         "ratbat"         "shrapnel"      
#> [121] "bombshell"      "kickback"      
tf_palette_names(faction = "Decepticon")
#>  [1] "megatron"       "shockwave"      "soundwave"      "galvatron"     
#>  [5] "cyclonus"       "scourge"        "gnaw"           "hook"          
#>  [9] "long_haul"      "scrapper"       "bonecrusher"    "mixmaster"     
#> [13] "scavenger"      "devastator"     "motormaster"    "dead_end"      
#> [17] "breakdown"      "drag_strip"     "wildrider"      "menasor"       
#> [21] "onslaught"      "brawl"          "swindle"        "blast_off"     
#> [25] "vortex"         "bruticus"       "hun_gurrr"      "blot"          
#> [29] "cutthroat"      "rippersnapper"  "sinnertwin"     "abominus"      
#> [33] "razorclaw"      "rampage"        "tantrum"        "headstrong"    
#> [37] "divebomb"       "predaking"      "snaptrap"       "nautilator"    
#> [41] "overbite"       "seawing"        "skalor"         "tentakil"      
#> [45] "piranacon"      "slog"           "birdbrain"      "icepick"       
#> [49] "bristleback"    "wildfly"        "scowl"          "monstructor"   
#> [53] "leozack"        "drillhorn"      "guyhawk"        "hellbat"       
#> [57] "jallguar"       "killbison"      "liokaiser"      "starscream"    
#> [61] "thundercracker" "skywarp"        "dirge"          "ramjet"        
#> [65] "thrust"         "laserbeak"      "buzzsaw"        "ravage"        
#> [69] "rumble"         "frenzy"         "ratbat"         "shrapnel"      
#> [73] "bombshell"      "kickback"      
tf_palette_names(team = "Aerialbots", medium = "cartoon")
#> [1] "silverbolt_cartoon" "air_raid_cartoon"   "fireflight_cartoon"
#> [4] "skydive_cartoon"    "slingshot_cartoon"  "superion_cartoon"  
tf_palette_names(role = "leader", medium = "all")
#>  [1] "optimus_prime"         "megatron"              "rodimus_prime"        
#>  [4] "ultra_magnus"          "galvatron"             "optimus_prime_cartoon"
#>  [7] "megatron_cartoon"      "rodimus_prime_cartoon" "ultra_magnus_cartoon" 
#> [10] "galvatron_cartoon"     "optimus_prime_comic"   "megatron_comic"       
```
