# One colour per member of a combiner team

Builds a categorical palette for a combiner team by taking one colour
from each member, in the team's order: torso first, then limbs. Each
colour is named after the member it came from, so the palette doubles as
a legend.

## Usage

``` r
tf_team_palette(team, which = 1L, distinct = FALSE, combined = FALSE)
```

## Arguments

- team:

  Combiner team name; see
  [`tf_teams()`](https://bmaitner.github.io/transformeRs/reference/tf_factions.md).
  Matched case-insensitively and by unique prefix.

- which:

  Which colour to take from each member's palette when
  `distinct = FALSE`. `1` (the default) is the body plastic; `2` the
  secondary plastic, and so on. Members with fewer colours than `which`
  fall back to their last colour.

- distinct:

  Logical. Choose each member's colour to be as different as possible
  from those already chosen? See Details.

- combined:

  Logical. Include the team's combined form as the last colour?

## Value

A named character vector of hex colours with class `"tf_palette"`.

## Details

By default the body colour of each member is used, which is faithful but
collapses for teams cast from shared plastics: every Constructicon is
the same green, three Protectobots are white, and so on. With
`distinct = TRUE` each member instead contributes the colour from its
palette that is furthest (in CIE Lab) from the colours already chosen
for the members before it, so the palette stays legible while every
colour is still one the member actually wears. The Stunticons,
Combaticons and Terrorcons are distinct either way; for the others
`distinct = TRUE` is the useful setting. Check the result with
[`tf_palette_stats()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_stats.md)
on the returned colours if legibility matters.

## Examples

``` r
tf_team_palette("Stunticons")
#> Transformers team palette 'stunticons' (5 colours)
#> motormaster = #1E1E1E
#> dead_end = #7A1F2E
#> breakdown = #F0F0EC
#> drag_strip = #F4A21C
#> wildrider = #4E5257

tf_team_palette("Aerialbots")
#> Transformers team palette 'aerialbots' (5 colours)
#> silverbolt = #F0F0EC
#> air_raid = #1F1F22
#> fireflight = #D8262C
#> skydive = #7C8187
#> slingshot = #F0F0EC

tf_team_palette("Aerialbots", distinct = TRUE)
#> Transformers team palette 'aerialbots' (5 colours)
#> silverbolt = #F0F0EC
#> air_raid = #C8262E
#> fireflight = #26262A
#> skydive = #3A5FA8
#> slingshot = #9A9DA1

tf_team_palette("Predacons", which = 2)
#> Transformers team palette 'predacons' (5 colours)
#> razorclaw = #C8262E
#> rampage = #262626
#> tantrum = #8C8F94
#> headstrong = #C8262E
#> divebomb = #C8262E


library(ggplot2)
ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point() +
  scale_colour_manual(values = unname(tf_team_palette("Stunticons")))
```
