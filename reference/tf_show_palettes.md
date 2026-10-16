# Display Transformers palettes

Draws a swatch strip for each palette on the current graphics device,
labelled with the palette name and, by default, the hex code under each
swatch. Useful for picking a character or for reporting a colour that
looks wrong. With no arguments every toy palette is drawn, which is a
lot; filter by `faction`, `team`, `role` or `use` to narrow it down, or
pass a character's palettes across media to compare them.

## Usage

``` r
tf_show_palettes(
  names = NULL,
  faction = NULL,
  team = NULL,
  role = NULL,
  use = NULL,
  medium = "toy",
  ncol = 3,
  hex = TRUE
)
```

## Arguments

- names:

  Optional character vector of palette names to show. Defaults to every
  palette matching the other filters.

- faction:

  Optional faction to restrict to; see
  [`tf_factions()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

- team:

  Optional combiner team to restrict to; see
  [`tf_teams()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

- role:

  Optional role to restrict to; see
  [`tf_palette_names()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_names.md).

- use:

  Optional use case to restrict to; see
  [`tf_find_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_find_palettes.md).

- medium:

  Which medium's palettes to show: `"toy"` (default), `"cartoon"`,
  `"comic"` or `"all"`. Ignored when `names` is given.

- ncol:

  Number of columns to arrange the swatch strips in.

- hex:

  Logical. Print the hex code under each swatch?

## Value

Invisibly, the character vector of palette names that were drawn.

## Examples

``` r
tf_show_palettes(team = "Aerialbots")

tf_show_palettes(team = "Aerialbots", medium = "cartoon")

tf_show_palettes(faction = "Decepticon", role = "combined form", ncol = 2)

tf_show_palettes(use = "colorblind", ncol = 4)

tf_show_palettes(c("megatron", "megatron_cartoon", "megatron_comic"), ncol = 1)
```
