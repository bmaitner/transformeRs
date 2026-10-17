# Pick the most distinguishable colors from one or more palettes

Pools the colors of the named palettes and selects the `n` that are
hardest to confuse with one another on a given kind of plot: light
background, dark background, or output that will be read in grayscale.
Optionally judges distinctness under simulated color-vision deficiency.
Use it when a single character's palette does not have enough usable
colors, or when you want a team's or a faction's colors but only the
ones that hold up on a chart.

## Usage

``` r
tf_pick(
  palettes,
  n = 5,
  style = c("light", "dark", "grayscale"),
  colorblind = FALSE,
  medium = "toy",
  background = NULL,
  min_contrast = 3
)
```

## Arguments

- palettes:

  Character vector of one or more palette names; see
  [`tf_palette_names()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_names.md).
  Team names are not accepted; use `tf_palette_names(team = ...)` to
  expand a team.

- n:

  Number of colors wanted.

- style:

  One of `"light"` (white background), `"dark"` (near-black background)
  or `"grayscale"` (white background, judged by lightness alone).

- colorblind:

  Logical. Require the colors to stay distinct under simulated
  deuteranopia, protanopia and tritanopia?

- medium:

  Medium for plain palette names; see
  [`tf_media()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

- background:

  Optional background color overriding the one implied by `style`, as a
  hex string.

- min_contrast:

  Minimum WCAG 2 contrast ratio a color must have against the background
  to be considered. Set to 1 to disable the filter.

## Value

A character vector of `n` hex colors with class `"tf_palette"`, named by
the palette each color came from, and with attributes `min_distance`
(smallest pairwise distance under the chosen criterion), `style`,
`colorblind` and `background`.

## Details

The selection runs in three steps.

1.  **Pool.** The colors of every palette in `palettes` are combined,
    with duplicates removed. Names may be plain (`"optimus_prime"`) or
    carry a medium suffix (`"optimus_prime_cartoon"`); plain names use
    `medium`.

2.  **Filter for the background.** Colors whose WCAG 2 contrast ratio
    against the background is below `min_contrast` are dropped, so a
    light-mode selection never contains a near-white and a dark-mode
    selection never contains a near-black. The background is white for
    `"light"` and `"grayscale"` and near-black (`"#121212"`) for
    `"dark"` unless `background` is given. The default of 3 is the WCAG
    minimum for graphical objects; lower it to keep more colors, raise
    it for text.

3.  **Choose.** Every pair of remaining colors is scored by its distance
    in CIE Lab (CIE76). With `colorblind = TRUE` the distance is the
    smallest of the normal-vision distance and the distances after
    simulating deuteranopia, protanopia and tritanopia (Machado,
    Oliveira and Fernandes 2009), so two colors only count as distinct
    if every viewer can tell them apart. With `style = "grayscale"` only
    the lightness difference counts, so the colors survive conversion to
    gray. The `n` colors whose closest pair is farthest apart are chosen
    (a maximum-dispersion subset, found exhaustively when the pool is
    small and by greedy seeding plus swap search otherwise), then
    ordered so that each color is as different as possible from those
    before it.

The result is a categorical palette: it does not try to build a
gradient. The smallest pairwise distance in the selection is returned as
the `min_distance` attribute; values above about 20 are comfortably
distinct, and below about 12 two colors will be hard to tell apart. If
the pool cannot supply `n` colors after filtering, the function errors
and says how many it had, so add palettes or lower `min_contrast`.

## See also

[`tf_find_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_find_palettes.md)
to shortlist whole palettes instead;
[`tf_palette_stats()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_stats.md)
for the underlying measures.

## Examples

``` r
# five colors for a white-background plot, from the two leaders
tf_pick(c("optimus_prime", "megatron"), n = 5)
#> Transformers pick of 5 colors from optimus_prime + megatron
#> light background #FFFFFF, min distance 21.7
#> optimus_prime = #D0202A
#> optimus_prime = #1F3E8F
#> megatron = #8C9095
#> megatron = #2A2A2A
#> megatron = #6B3FA0


# the same for a dark theme, and color-blind safe
tf_pick(c("optimus_prime", "megatron"), n = 4, style = "dark", colorblind = TRUE)
#> Transformers pick of 4 colors from optimus_prime + megatron
#> dark background #121212, colorblind-safe, min distance 22
#> optimus_prime = #D0202A
#> megatron = #C9CBCF
#> optimus_prime = #F2D23C
#> megatron = #8C9095


# a whole team, cartoon colors, printable in grayscale
tf_pick(tf_palette_names(team = "Combaticons"), n = 4,
        style = "grayscale", medium = "cartoon")
#> Transformers pick of 4 colors from onslaught_cartoon + brawl_cartoon + swindle_cartoon + blast_off_cartoon + vortex_cartoon + bruticus_cartoon
#> grayscale background #FFFFFF, min distance 4.5
#> onslaught_cartoon = #2B2B2B
#> onslaught_cartoon = #4E6E3E
#> swindle_cartoon = #5A3E8A
#> onslaught_cartoon = #2E5A8A


library(ggplot2)
cols <- tf_pick(tf_palette_names(team = "Predacons"), n = 3, colorblind = TRUE)
ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point(size = 2.5) +
  scale_colour_manual(values = unname(cols)) +
  theme_minimal()
```
