# List the media, factions and combiner teams in transformerpalettes

List the media, factions and combiner teams in transformerpalettes

## Usage

``` r
tf_media()

tf_factions()

tf_teams(faction = NULL)
```

## Arguments

- faction:

  Optional faction to restrict `tf_teams()` to; see `tf_factions()`.

## Value

`tf_media()` returns the media a palette can record, in the order
`"toy"` (the original Generation 1 release), `"cartoon"` (the animation
model), `"comic"` (Marvel) and `"g2"` (the Generation 2 re-release of
the toy in new colours, 1992-1994). `tf_factions()` returns a character
vector of faction names. `tf_teams()` returns a character vector of team
and subgroup names, in package order (Autobot teams first). All can be
passed to the matching argument of
[`tf_palette_names()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette_names.md),
[`tf_show_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_show_palettes.md)
and
[`tf_find_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_find_palettes.md).

## Examples

``` r
tf_media()
#> [1] "toy"     "cartoon" "comic"   "g2"     
tf_factions()
#> [1] "Autobot"    "Decepticon"
tf_teams()
#>  [1] "Aerialbots"         "Protectobots"       "Technobots"        
#>  [4] "Dinobots"           "Autobot Cars"       "Minibots"          
#>  [7] "Constructicons"     "Stunticons"         "Combaticons"       
#> [10] "Terrorcons"         "Predacons"          "Seacons"           
#> [13] "Pretender Monsters" "Breastforce"        "Seekers"           
#> [16] "Cassettes"          "Insecticons"       
tf_teams(faction = "Decepticon")
#>  [1] "Constructicons"     "Stunticons"         "Combaticons"       
#>  [4] "Terrorcons"         "Predacons"          "Seacons"           
#>  [7] "Pretender Monsters" "Breastforce"        "Seekers"           
#> [10] "Cassettes"          "Insecticons"       
```
