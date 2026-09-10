# Find Transformers palettes that suit a plotting use case

Filters the palettes to those whose colors work for a given job, judged
from the perceptual statistics in
[`tf_palette_stats()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_stats.md).
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
      [`tf_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_palette.md)
      or the `_c` scales.

  `"diverging"`

  :   Exactly two distinct hue families plus a light or neutral color to
      sit between them. The curated order is not necessarily dark-A,
      light, dark-B; check
      [`tf_palette_stats()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_stats.md)
      and reorder the colors yourself for a continuous diverging scale.

  The thresholds are deliberately simple heuristics computed by
  [`tf_palette_stats()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_stats.md);
  treat the result as a shortlist to look at with
  [`tf_show_palettes()`](https://bmaitner.github.io/transformeRs/reference/tf_show_palettes.md),
  not a guarantee.

- faction, team, role, medium:

  Optional filters passed to
  [`tf_palette_names()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_names.md).
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
#>  [1] "blades"        "computron"     "air_raid"      "superion"     
#>  [5] "scattershot"   "fireflight"    "hot_spot"      "defensor"     
#>  [9] "silverbolt"    "nosecone"      "headstrong"    "slingshot"    
#> [13] "rippersnapper" "lightspeed"    "strafe"        "hook"         
#> [17] "long_haul"     "scrapper"      "bonecrusher"   "mixmaster"    
#> [21] "scavenger"     "devastator"    "first_aid"     "streetwise"   
#> [25] "skydive"       "optimus_prime" "wildrider"     "groove"       
#> [29] "afterburner"   "megatron"      "blast_off"     "swindle"      
#> [33] "cutthroat"     "breakdown"     "motormaster"   "menasor"      
#> [37] "vortex"        "divebomb"      "abominus"      "drag_strip"   
tf_find_palettes("diverging", faction = "Decepticon")
#>  [1] "scrapper"      "scavenger"     "devastator"    "rippersnapper"
#>  [5] "breakdown"     "piranacon"     "snaptrap"      "hook"         
#>  [9] "long_haul"     "bonecrusher"   "mixmaster"     "blot"         
#> [13] "nautilator"    "seawing"       "drag_strip"    "swindle"      
#> [17] "tentakil"      "motormaster"   "menasor"       "blast_off"    
#> [21] "overbite"      "megatron"     
tf_find_palettes("sequential")
#>  [1] "air_raid"    "blades"      "fireflight"  "scattershot" "afterburner"
#>  [6] "first_aid"   "slingshot"   "dead_end"    "wildrider"   "nosecone"   
#> [11] "rampage"     "brawl"      
tf_find_palettes("colorblind", medium = "cartoon")
#>  [1] "silverbolt_cartoon"    "blades_cartoon"        "first_aid_cartoon"    
#>  [4] "air_raid_cartoon"      "fireflight_cartoon"    "slingshot_cartoon"    
#>  [7] "computron_cartoon"     "nosecone_cartoon"      "scattershot_cartoon"  
#> [10] "hot_spot_cartoon"      "defensor_cartoon"      "lightspeed_cartoon"   
#> [13] "strafe_cartoon"        "streetwise_cartoon"    "groove_cartoon"       
#> [16] "superion_cartoon"      "rippersnapper_cartoon" "razorclaw_cartoon"    
#> [19] "tantrum_cartoon"       "headstrong_cartoon"    "drag_strip_cartoon"   
#> [22] "rampage_cartoon"       "skydive_cartoon"       "wildrider_cartoon"    
#> [25] "blast_off_cartoon"     "breakdown_cartoon"     "hook_cartoon"         
#> [28] "long_haul_cartoon"     "scrapper_cartoon"      "bonecrusher_cartoon"  
#> [31] "mixmaster_cartoon"     "scavenger_cartoon"     "devastator_cartoon"   
#> [34] "afterburner_cartoon"   "motormaster_cartoon"   "menasor_cartoon"      
#> [37] "megatron_cartoon"      "swindle_cartoon"       "optimus_prime_cartoon"
#> [40] "divebomb_cartoon"      "predaking_cartoon"     "onslaught_cartoon"    
```
