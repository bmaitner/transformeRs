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

- faction, team, role:

  Optional filters passed to
  [`tf_palette_names()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_names.md).

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
```
