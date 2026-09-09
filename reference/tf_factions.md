# List the factions and combiner teams in transformeRs

List the factions and combiner teams in transformeRs

## Usage

``` r
tf_factions()

tf_teams(faction = NULL)
```

## Arguments

- faction:

  Optional faction to restrict `tf_teams()` to; see `tf_factions()`.

## Value

`tf_factions()` returns a character vector of faction names.
`tf_teams()` returns a character vector of combiner team names, in
package order (Autobot teams first). Both can be passed to the matching
argument of
[`tf_palette_names()`](https://bmaitner.github.io/transformeRs/reference/tf_palette_names.md),
[`tf_show_palettes()`](https://bmaitner.github.io/transformeRs/reference/tf_show_palettes.md)
and
[`tf_find_palettes()`](https://bmaitner.github.io/transformeRs/reference/tf_find_palettes.md).

## Examples

``` r
tf_factions()
#> [1] "Autobot"    "Decepticon"
tf_teams()
#> [1] "Aerialbots"     "Protectobots"   "Technobots"     "Constructicons"
#> [5] "Stunticons"     "Combaticons"    "Terrorcons"     "Predacons"     
#> [9] "Seacons"       
tf_teams(faction = "Decepticon")
#> [1] "Constructicons" "Stunticons"     "Combaticons"    "Terrorcons"    
#> [5] "Predacons"      "Seacons"       
```
