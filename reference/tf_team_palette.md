# One color per member of a team

Builds a categorical palette for a combiner team or subgroup by taking
one color from each member, in the team's order (torso first, then
limbs, for a combiner team). Each color is named after the member it
came from, so the palette doubles as a legend.

## Usage

``` r
tf_team_palette(
  team,
  which = 1L,
  distinct = FALSE,
  combined = FALSE,
  medium = "toy"
)
```

## Arguments

- team:

  Combiner team name; see
  [`tf_teams()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).
  Matched case-insensitively and by unique prefix.

- which:

  Which color to take from each member's palette when
  `distinct = FALSE`. `1` (the default) is the body color; `2` the
  secondary color, and so on. Members with fewer colors than `which`
  fall back to their last color.

- distinct:

  Logical. Choose each member's color to be as different as possible
  from those already chosen? See Details.

- combined:

  Logical. Include the team's combined form as the last color?

- medium:

  Which version of the team to use: `"toy"` (default), `"cartoon"` or
  `"comic"`. Errors if any member lacks a palette in that medium.

## Value

A named character vector of hex colors with class `"tf_palette"`.

## Details

By default the body color of each member is used, which is faithful but
collapses for teams cast from shared plastics: every Constructicon is
the same green, three Protectobots are white, and so on. With
`distinct = TRUE` each member instead contributes the color from its
palette that is furthest (in CIE Lab) from the colors already chosen for
the members before it, so the palette stays legible while every color is
still one the member actually wears. The Stunticons, Combaticons and
Terrorcons are distinct either way; for the others `distinct = TRUE` is
the useful setting. Check the result with
[`tf_palette_stats()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_stats.md)
on the returned colors if legibility matters.

## Examples

``` r
tf_team_palette("Stunticons")
#> Transformers team palette 'stunticons' (5 colors)
#> motormaster = #1E1E1E
#> dead_end = #7A1F2E
#> breakdown = #F0F0EC
#> drag_strip = #F4A21C
#> wildrider = #4E5257

tf_team_palette("Seekers")
#> Transformers team palette 'seekers' (6 colors)
#> starscream = #C9CCCF
#> thundercracker = #2F5FA8
#> skywarp = #1E1E1E
#> dirge = #1F3F94
#> ramjet = #F0F0EC
#> thrust = #7A1F2E

tf_team_palette("Aerialbots")
#> Transformers team palette 'aerialbots' (5 colors)
#> silverbolt = #F0F0EC
#> air_raid = #1F1F22
#> fireflight = #D8262C
#> skydive = #7C8187
#> slingshot = #F0F0EC

tf_team_palette("Aerialbots", distinct = TRUE)
#> Transformers team palette 'aerialbots' (5 colors)
#> silverbolt = #F0F0EC
#> air_raid = #C8262E
#> fireflight = #26262A
#> skydive = #3A5FA8
#> slingshot = #9A9DA1

tf_team_palette("Predacons", which = 2)
#> Transformers team palette 'predacons' (5 colors)
#> razorclaw = #C8262E
#> rampage = #262626
#> tantrum = #8C8F94
#> headstrong = #C8262E
#> divebomb = #C8262E

tf_team_palette("Combaticons", medium = "cartoon")
#> Transformers team palette 'combaticons_cartoon' (5 colors)
#> onslaught_cartoon = #4E6E3E
#> brawl_cartoon = #5B6B3A
#> swindle_cartoon = #D9B04A
#> blast_off_cartoon = #7A5A3A
#> vortex_cartoon = #8C97A8


library(ggplot2)
ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point() +
  scale_colour_manual(values = unname(tf_team_palette("Stunticons")))
```
