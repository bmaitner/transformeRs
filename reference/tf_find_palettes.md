# Find Transformers palettes that suit a plotting use case

Filters the palettes to those whose colors work for a given job, judged
from the perceptual statistics in
[`tf_palette_stats()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_stats.md).
Many toys look great on a figure but poor on a chart; this surfaces the
ones that hold up.

## Usage

``` r
tf_find_palettes(
  use = c("categorical", "colorblind", "sequential", "diverging"),
  faction = NULL,
  team = NULL,
  role = NULL,
  medium = "toy",
  min_colours = 4
)
```

## Arguments

- use:

  One of:

  `"categorical"`

  :   Every pair of colors is clearly distinguishable (minimum Lab
      distance of 20 or more). Good for unordered groups.

  `"colorblind"`

  :   Categorical, and still distinguishable under simulated
      deuteranopia, protanopia and tritanopia (minimum distance 15 or
      more in each).

  `"sequential"`

  :   One hue family (hue spread of 45 degrees or less among the
      chromatic colors) spanning at least 50 units of lightness, so a
      continuous gradient reads as low-to-high. Pair with `sort = TRUE`
      in
      [`tf_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette.md)
      or the `_c` scales.

  `"diverging"`

  :   Exactly two distinct hue families plus a light or neutral color to
      sit between them. The curated order is not necessarily dark-A,
      light, dark-B; check
      [`tf_palette_stats()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_stats.md)
      and reorder the colors yourself for a continuous diverging scale.

  The thresholds are deliberately simple heuristics computed by
  [`tf_palette_stats()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_stats.md);
  treat the result as a shortlist to look at with
  [`tf_show_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_show_palettes.md),
  not a guarantee.

- faction, team, role, medium:

  Optional filters passed to
  [`tf_palette_names()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_names.md).
  `medium` defaults to `"toy"`; use `"all"` to search cartoon and comic
  palettes too.

- min_colours:

  Minimum number of colors the palette must have.

## Value

A character vector of palette names, ordered so that the strongest
candidates for the use case come first.

## Examples

``` r
tf_find_palettes("colorblind")
#>  [1] "blades"        "computron"     "air_raid"      "huffer"       
#>  [5] "superion"      "brawn"         "scattershot"   "jallguar"     
#>  [9] "fireflight"    "hot_spot"      "defensor"      "trailbreaker" 
#> [13] "silverbolt"    "nosecone"      "ratchet"       "sunstreaker"  
#> [17] "bumblebee"     "cliffjumper"   "windcharger"   "gears"        
#> [21] "ultra_magnus"  "headstrong"    "slingshot"     "rippersnapper"
#> [25] "ramjet"        "lightspeed"    "strafe"        "snarl"        
#> [29] "swoop"         "soundwave"     "drillhorn"     "hook"         
#> [33] "long_haul"     "scrapper"      "bonecrusher"   "mixmaster"    
#> [37] "scavenger"     "devastator"    "ratbat"        "shrapnel"     
#> [41] "bombshell"     "kickback"      "first_aid"     "streetwise"   
#> [45] "skydive"       "galvatron"     "optimus_prime" "wreck_gar"    
#> [49] "wildrider"     "groove"        "afterburner"   "megatron"     
#> [53] "blast_off"     "hot_rod"       "birdbrain"     "swindle"      
#> [57] "cutthroat"     "jazz"          "prowl"         "sideswipe"    
#> [61] "mirage"        "bluestreak"    "breakdown"     "motormaster"  
#> [65] "menasor"       "kup"           "vortex"        "wheeljack"    
#> [69] "slog"          "rodimus_prime" "divebomb"      "leozack"      
#> [73] "guyhawk"       "hellbat"       "scourge"       "abominus"     
#> [77] "drag_strip"   
tf_find_palettes("diverging", faction = "Decepticon")
#>  [1] "hellbat"        "scrapper"       "scavenger"      "devastator"    
#>  [5] "rippersnapper"  "birdbrain"      "breakdown"      "drillhorn"     
#>  [9] "starscream"     "jallguar"       "piranacon"      "soundwave"     
#> [13] "snaptrap"       "hook"           "long_haul"      "bonecrusher"   
#> [17] "mixmaster"      "slog"           "shockwave"      "leozack"       
#> [21] "blot"           "nautilator"     "seawing"        "scourge"       
#> [25] "shrapnel"       "bombshell"      "kickback"       "drag_strip"    
#> [29] "swindle"        "tentakil"       "motormaster"    "menasor"       
#> [33] "blast_off"      "thundercracker" "overbite"       "gnaw"          
#> [37] "killbison"      "scowl"          "megatron"       "skywarp"       
#> [41] "dirge"          "galvatron"      "ratbat"        
tf_find_palettes("sequential")
#>  [1] "air_raid"    "thrust"      "blades"      "ratchet"     "sideswipe"  
#>  [6] "cliffjumper" "windcharger" "fireflight"  "scattershot" "afterburner"
#> [11] "ramjet"      "first_aid"   "slingshot"   "springer"    "dead_end"   
#> [16] "wildrider"   "ravage"      "ironhide"    "laserbeak"   "buzzsaw"    
#> [21] "rumble"      "frenzy"      "nosecone"    "rampage"     "brawl"      
tf_find_palettes("colorblind", medium = "cartoon")
#>  [1] "silverbolt_cartoon"     "blades_cartoon"         "first_aid_cartoon"     
#>  [4] "air_raid_cartoon"       "fireflight_cartoon"     "slingshot_cartoon"     
#>  [7] "computron_cartoon"      "brawn_cartoon"          "huffer_cartoon"        
#> [10] "skywarp_cartoon"        "jallguar_cartoon"       "bumblebee_cartoon"     
#> [13] "nosecone_cartoon"       "scattershot_cartoon"    "hot_spot_cartoon"      
#> [16] "defensor_cartoon"       "lightspeed_cartoon"     "strafe_cartoon"        
#> [19] "streetwise_cartoon"     "groove_cartoon"         "superion_cartoon"      
#> [22] "rippersnapper_cartoon"  "razorclaw_cartoon"      "tantrum_cartoon"       
#> [25] "headstrong_cartoon"     "thundercracker_cartoon" "ramjet_cartoon"        
#> [28] "soundwave_cartoon"      "laserbeak_cartoon"      "buzzsaw_cartoon"       
#> [31] "rumble_cartoon"         "frenzy_cartoon"         "jazz_cartoon"          
#> [34] "prowl_cartoon"          "ironhide_cartoon"       "ratchet_cartoon"       
#> [37] "sunstreaker_cartoon"    "sideswipe_cartoon"      "mirage_cartoon"        
#> [40] "trailbreaker_cartoon"   "bluestreak_cartoon"     "cliffjumper_cartoon"   
#> [43] "windcharger_cartoon"    "gears_cartoon"          "ultra_magnus_cartoon"  
#> [46] "grimlock_cartoon"       "slag_cartoon"           "sludge_cartoon"        
#> [49] "snarl_cartoon"          "swoop_cartoon"          "leozack_cartoon"       
#> [52] "drillhorn_cartoon"      "drag_strip_cartoon"     "ratbat_cartoon"        
#> [55] "shrapnel_cartoon"       "bombshell_cartoon"      "kickback_cartoon"      
#> [58] "rampage_cartoon"        "galvatron_cartoon"      "hound_cartoon"         
#> [61] "wreck_gar_cartoon"      "skydive_cartoon"        "wildrider_cartoon"     
#> [64] "blast_off_cartoon"      "hot_rod_cartoon"        "breakdown_cartoon"     
#> [67] "hook_cartoon"           "long_haul_cartoon"      "scrapper_cartoon"      
#> [70] "bonecrusher_cartoon"    "mixmaster_cartoon"      "scavenger_cartoon"     
#> [73] "devastator_cartoon"     "afterburner_cartoon"    "motormaster_cartoon"   
#> [76] "menasor_cartoon"        "megatron_cartoon"       "swindle_cartoon"       
#> [79] "kup_cartoon"            "wheeljack_cartoon"      "optimus_prime_cartoon" 
#> [82] "divebomb_cartoon"       "predaking_cartoon"      "rodimus_prime_cartoon" 
#> [85] "guyhawk_cartoon"        "hellbat_cartoon"        "scourge_cartoon"       
#> [88] "gnaw_cartoon"           "onslaught_cartoon"     
```
