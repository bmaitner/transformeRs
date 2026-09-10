# Generation 1 Transformers palettes

A named list of colour palettes covering Optimus Prime, Megatron, and
every member and combined form of the core Generation 1 combiner teams.
Each character has a palette for the original toy, most also have one
for the Sunbow cartoon, and some have one for the Marvel comic; see the
`medium` column of
[tf_characters](https://bmaitner.github.io/transformeRs/reference/tf_characters.md).
Each element is a character vector of four to six hex colours ordered so
that the first few are the most distinct from one another (body colour
first, then secondary colour, then accents). Use
[`tf_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_palette.md)
to pull colours from a palette,
[`tf_team_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_team_palette.md)
to take one colour from each member of a combiner team, and
[tf_characters](https://bmaitner.github.io/transformeRs/reference/tf_characters.md)
for background on each character.

## Usage

``` r
tf_palettes
```

## Format

A named list of character vectors of hex colours.

## Details

Toy palettes are named after the character (`optimus_prime`); cartoon
and comic palettes carry a suffix (`optimus_prime_cartoon`,
`optimus_prime_comic`). Hex values are approximations: toy colours were
curated by eye from product photography on the Transformers Wiki
(<https://tfwiki.net/>) and the toys' published colour descriptions,
cartoon colours from the animation models as they appear in episode
stills, and comic colours from the character's early Marvel appearances.
Chrome and die-cast parts do not reduce to a single flat colour; those
entries reflect how the part photographs.

## See also

[`tf_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_palette.md),
[`tf_palette_names()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_names.md),
[`tf_media()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md),
[`tf_teams()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md),
[tf_characters](https://bmaitner.github.io/transformeRs/reference/tf_characters.md),
[`tf_show_palettes()`](https://bmaitner.github.io/transformeRs/reference/tf_show_palettes.md)

## Examples

``` r
length(tf_palettes)
#> [1] 118
tf_palettes$optimus_prime
#> [1] "#D0202A" "#1F3E8F" "#B8BABF" "#F2D23C" "#2D2D2D"
tf_palettes$optimus_prime_cartoon
#> [1] "#D9262C" "#2244A0" "#A9AEB3" "#8FCBE8" "#4A4F55"
tf_palettes$devastator
#> [1] "#3FA23F" "#6E3FA3" "#B5B8BD" "#262626" "#E9C23B"
```
