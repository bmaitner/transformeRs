# Generation 1 Transformers palettes

A named list of colour palettes, one per character, covering Optimus
Prime, Megatron, and every member and combined form of the core
Generation 1 combiner teams. Each element is a character vector of four
to six hex colours holding the plastic, chrome and paint colours of the
original toy, ordered so that the first few colours are the most
distinct from one another (body plastic first, then secondary plastic,
then accents). Use
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

Hex values are approximations of the original 1984-1988 Hasbro releases,
curated by eye from product photography on the Transformers Wiki
(<https://tfwiki.net/>) and the toys' published colour descriptions.
Chrome and die-cast parts do not reduce to a single flat colour; those
entries reflect how the part photographs.

## See also

[`tf_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_palette.md),
[`tf_palette_names()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_names.md),
[`tf_teams()`](https://bmaitner.github.io/transformeRs/reference/tf_factions.md),
[tf_characters](https://bmaitner.github.io/transformeRs/reference/tf_characters.md),
[`tf_show_palettes()`](https://bmaitner.github.io/transformeRs/reference/tf_show_palettes.md)

## Examples

``` r
length(tf_palettes)
#> [1] 58
tf_palettes$optimus_prime
#> [1] "#D0202A" "#1F3E8F" "#B8BABF" "#F2D23C" "#2D2D2D"
tf_palettes$devastator
#> [1] "#3FA23F" "#6E3FA3" "#B5B8BD" "#262626" "#E9C23B"
```
