# Get colours from a character's palette

Returns `n` colours from the named character's palette, either the first
`n` curated colours (`type = "discrete"`) or `n` colours interpolated
across the whole palette (`type = "continuous"`).

## Usage

``` r
tf_palette(
  name,
  n = NULL,
  type = c("discrete", "continuous"),
  strict = TRUE,
  sort = FALSE,
  medium = "toy"
)
```

## Arguments

- name:

  Palette name. Case-insensitive, and spaces or hyphens may stand in for
  underscores, so `"Optimus Prime"` and `"Hun-Gurrr"` work. See
  [`tf_palette_names()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_names.md).
  A full name with a medium suffix (`"megatron_cartoon"`) also works and
  takes precedence over `medium`.

- n:

  Number of colours wanted. Defaults to every colour in the palette.

- type:

  Either `"discrete"` (default) to return the curated colours as they
  are, or `"continuous"` to interpolate `n` colours across the palette
  with
  [`grDevices::colorRampPalette()`](https://rdrr.io/r/grDevices/colorRamp.html).

- strict:

  Logical. For discrete palettes, error when `n` exceeds the number of
  curated colours (default). If `FALSE`, interpolate to `n` colours
  instead.

- sort:

  Logical. If `TRUE`, order the colours from darkest to lightest (by CIE
  lightness) before selecting or interpolating. Useful when a palette is
  used as a sequential gradient; see
  [`tf_find_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_find_palettes.md).

- medium:

  Which version of the character to use: `"toy"` (default), `"cartoon"`,
  `"comic"` or `"g2"`. See
  [`tf_media()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).
  Errors with a pointer to the wishlist if the character has no palette
  in that medium.

## Value

A character vector of hex colours with class `"tf_palette"`, which has a
print method that draws the swatches.

## Examples

``` r
tf_palette("optimus_prime")
#> Transformers palette 'optimus_prime' (5 colours, toy)
#> Autobot: Optimus Prime
#> #D0202A #1F3E8F #B8BABF #F2D23C #2D2D2D

tf_palette("optimus_prime", medium = "cartoon")
#> Transformers palette 'optimus_prime_cartoon' (5 colours, cartoon)
#> Autobot: Optimus Prime
#> #D9262C #2244A0 #A9AEB3 #8FCBE8 #4A4F55

tf_palette("Megatron", 3, medium = "comic")
#> Transformers palette 'megatron_comic' (3 colours, comic)
#> Decepticon: Megatron
#> #B9BDC2 #5E6368 #2B2B2B

tf_palette("devastator", medium = "g2")
#> Transformers palette 'devastator_g2' (5 colours, g2)
#> Decepticon / Constructicons: Devastator
#> #F2D21E #6E3FA3 #B5B8BD #262626 #F07C1E

tf_palette("devastator", 12, type = "continuous")
#> Transformers palette 'devastator' (12 colours, toy)
#> Decepticon / Constructicons: Devastator
#> #3FA23F #507D63 #615987 #7449A5 #8E76AE #A8A2B8 #9B9DA1 #67686A #323333 #5B502B #A28933 #E9C23B

tf_palette("hot_spot", 12, type = "continuous", sort = TRUE)
#> Transformers palette 'hot_spot' (12 colours, toy)
#> Autobot / Protectobots: Hot Spot
#> #2A2A2A #26395A #22498B #2F51A3 #704173 #B13142 #C73E3F #B3686A #9F9296 #B2B4B6 #D2D3D3 #F2F2F0


# base graphics
barplot(1:5, col = tf_palette("predaking"))
```
