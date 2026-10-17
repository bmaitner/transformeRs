# Generation 1 Transformers palettes

A named list of color palettes covering the Generation 1 Transformers
cast: the leaders, every member and combined form of the combiner teams,
the Dinobots, Seekers, cassettes, Insecticons, the 1984 Autobot cars and
Mini Vehicles, and the 1986 movie cast. Each character has a palette for
the original toy, most have one for the cartoon, many have one for the
Marvel comic, and the three combiner teams Hasbro re-released in
Generation 2 have one for that; see the `medium` column of
[tf_characters](https://bmaitner.github.io/transformerpalettes/reference/tf_characters.md).
Each element is a character vector of four to six hex colors ordered so
that the first few are the most distinct from one another (body color
first, then secondary color, then accents). Use
[`tf_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette.md)
to pull colors from a palette,
[`tf_team_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_team_palette.md)
to take one color from each member of a combiner team, and
[tf_characters](https://bmaitner.github.io/transformerpalettes/reference/tf_characters.md)
for background on each character.

## Usage

``` r
tf_palettes
```

## Format

A named list of character vectors of hex colors.

## Details

Toy palettes are named after the character (`optimus_prime`); cartoon
and comic palettes carry a suffix (`optimus_prime_cartoon`,
`optimus_prime_comic`). Hex values are approximations: toy colors were
curated by eye from product photography on the Transformers Wiki
(<https://tfwiki.net/wiki/Main_Page>) and the toys' published color
descriptions, cartoon colors from the animation models as they appear in
episode stills, and comic colors from the character's early Marvel
appearances. Chrome and die-cast parts do not reduce to a single flat
color; those entries reflect how the part photographs.

## See also

[`tf_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette.md),
[`tf_palette_names()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_names.md),
[`tf_media()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md),
[`tf_teams()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md),
[tf_characters](https://bmaitner.github.io/transformerpalettes/reference/tf_characters.md),
[`tf_show_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_show_palettes.md)

## Examples

``` r
length(tf_palettes)
#> [1] 314
tf_palettes$optimus_prime
#> [1] "#D0202A" "#1F3E8F" "#B8BABF" "#F2D23C" "#2D2D2D"
tf_palettes$optimus_prime_cartoon
#> [1] "#D9262C" "#2244A0" "#A9AEB3" "#8FCBE8" "#4A4F55"
tf_palettes$devastator
#> [1] "#3FA23F" "#6E3FA3" "#B5B8BD" "#262626" "#E9C23B"
```
