# Transformers color and fill scales for ggplot2

Color and fill scales that use a character's palette. The `_d` variants
are for discrete data, the `_c` variants for continuous data, and
`scale_colour_tf()` / `scale_fill_tf()` choose between the two with the
`discrete` argument. `scale_color_*` spellings are aliases.

## Usage

``` r
scale_colour_tf_d(
  palette = "optimus_prime",
  reverse = FALSE,
  medium = "toy",
  ...
)

scale_fill_tf_d(
  palette = "optimus_prime",
  reverse = FALSE,
  medium = "toy",
  ...
)

scale_colour_tf_c(
  palette = "optimus_prime",
  reverse = FALSE,
  sort = FALSE,
  medium = "toy",
  ...
)

scale_fill_tf_c(
  palette = "optimus_prime",
  reverse = FALSE,
  sort = FALSE,
  medium = "toy",
  ...
)

scale_colour_tf(
  palette = "optimus_prime",
  discrete = TRUE,
  reverse = FALSE,
  sort = FALSE,
  medium = "toy",
  ...
)

scale_fill_tf(
  palette = "optimus_prime",
  discrete = TRUE,
  reverse = FALSE,
  sort = FALSE,
  medium = "toy",
  ...
)

scale_color_tf_d(
  palette = "optimus_prime",
  reverse = FALSE,
  medium = "toy",
  ...
)

scale_color_tf_c(
  palette = "optimus_prime",
  reverse = FALSE,
  sort = FALSE,
  medium = "toy",
  ...
)

scale_color_tf(
  palette = "optimus_prime",
  discrete = TRUE,
  reverse = FALSE,
  sort = FALSE,
  medium = "toy",
  ...
)
```

## Arguments

- palette:

  Name of a character's palette. See
  [`tf_palette_names()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_names.md).

- reverse:

  Logical. Reverse the order of colors in the palette?

- medium:

  Which version of the character to use: `"toy"` (default), `"cartoon"`
  or `"comic"`. See
  [`tf_media()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

- ...:

  Additional arguments passed on to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  (discrete) or
  [`ggplot2::scale_colour_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)
  /
  [`ggplot2::scale_fill_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)
  (continuous).

- sort:

  Logical, continuous scales only. Order the palette from darkest to
  lightest before building the gradient, so the scale reads as
  low-to-high. See
  [`tf_find_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_find_palettes.md)
  for palettes that suit this.

- discrete:

  Logical. If `TRUE` (default) build a discrete scale, otherwise a
  continuous gradient scale.

## Value

A ggplot2 scale object.

## Details

Discrete scales draw the first `n` colors of the palette, where `n` is
the number of levels in the data. If the data has more levels than the
palette has colors, the palette is interpolated with
[`grDevices::colorRampPalette()`](https://rdrr.io/r/grDevices/colorRamp.html)
so that every level still receives a distinct color; expect the result
to be less legible than the curated colors. For a palette with one color
per member of a combiner team, pass
[`tf_team_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_team_palette.md)
to
[`ggplot2::scale_colour_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html).

## Examples

``` r
library(ggplot2)

ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point(size = 3) +
  scale_colour_tf("optimus_prime")


ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point(size = 3) +
  scale_colour_tf("optimus_prime", medium = "cartoon")


ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar() +
  scale_fill_tf_d("bruticus")


ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_tf_c("hot_spot", sort = TRUE)
```
