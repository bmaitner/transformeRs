# List the available palettes

List the available palettes

## Usage

``` r
tf_palette_names(faction = NULL, team = NULL, role = NULL, medium = "toy")
```

## Arguments

- faction:

  Optional faction (see
  [`tf_factions()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md))
  to restrict the list to. Matched case-insensitively and by unique
  prefix, so `"auto"` works.

- team:

  Optional combiner team (see
  [`tf_teams()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md))
  to restrict the list to, matched the same way.

- role:

  Optional role to restrict the list to: one of `"leader"`,
  `"combiner torso"`, `"combiner limb"` or `"combined form"`, matched
  the same way.

- medium:

  Which medium's palettes to list: `"toy"` (default), `"cartoon"`,
  `"comic"`, or `"all"` for every palette regardless of medium. See
  [`tf_media()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md).

## Value

A character vector of palette names accepted by
[`tf_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_palette.md)
and the `scale_*_tf()` functions.

## Examples

``` r
tf_palette_names()
#>  [1] "optimus_prime" "megatron"      "silverbolt"    "air_raid"     
#>  [5] "fireflight"    "skydive"       "slingshot"     "superion"     
#>  [9] "hot_spot"      "streetwise"    "blades"        "groove"       
#> [13] "first_aid"     "defensor"      "scattershot"   "lightspeed"   
#> [17] "nosecone"      "strafe"        "afterburner"   "computron"    
#> [21] "hook"          "long_haul"     "scrapper"      "bonecrusher"  
#> [25] "mixmaster"     "scavenger"     "devastator"    "motormaster"  
#> [29] "dead_end"      "breakdown"     "drag_strip"    "wildrider"    
#> [33] "menasor"       "onslaught"     "brawl"         "swindle"      
#> [37] "blast_off"     "vortex"        "bruticus"      "hun_gurrr"    
#> [41] "blot"          "cutthroat"     "rippersnapper" "sinnertwin"   
#> [45] "abominus"      "razorclaw"     "rampage"       "tantrum"      
#> [49] "headstrong"    "divebomb"      "predaking"     "snaptrap"     
#> [53] "nautilator"    "overbite"      "seawing"       "skalor"       
#> [57] "tentakil"      "piranacon"    
tf_palette_names(faction = "Decepticon")
#>  [1] "megatron"      "hook"          "long_haul"     "scrapper"     
#>  [5] "bonecrusher"   "mixmaster"     "scavenger"     "devastator"   
#>  [9] "motormaster"   "dead_end"      "breakdown"     "drag_strip"   
#> [13] "wildrider"     "menasor"       "onslaught"     "brawl"        
#> [17] "swindle"       "blast_off"     "vortex"        "bruticus"     
#> [21] "hun_gurrr"     "blot"          "cutthroat"     "rippersnapper"
#> [25] "sinnertwin"    "abominus"      "razorclaw"     "rampage"      
#> [29] "tantrum"       "headstrong"    "divebomb"      "predaking"    
#> [33] "snaptrap"      "nautilator"    "overbite"      "seawing"      
#> [37] "skalor"        "tentakil"      "piranacon"    
tf_palette_names(team = "Aerialbots", medium = "cartoon")
#> [1] "silverbolt_cartoon" "air_raid_cartoon"   "fireflight_cartoon"
#> [4] "skydive_cartoon"    "slingshot_cartoon"  "superion_cartoon"  
tf_palette_names(role = "leader", medium = "all")
#> [1] "optimus_prime"         "megatron"              "optimus_prime_cartoon"
#> [4] "megatron_cartoon"      "optimus_prime_comic"   "megatron_comic"       
```
