# Generation 1 Transformers character metadata

Background information for every palette in
[tf_palettes](https://bmaitner.github.io/transformeRs/reference/tf_palettes.md):
the character, its faction, the combiner team and combined form it
belongs to, its role in that team, its alternate mode, the year of the
original toy, a description of the toy's colours, and links to the
character's page and toy photograph on the Transformers Wiki.

## Usage

``` r
tf_characters
```

## Format

A data frame with one row per palette and the columns:

- palette:

  Palette name, as used by
  [`tf_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_palette.md).

- character:

  Character name as printed on the toy's packaging.

- faction:

  `"Autobot"` or `"Decepticon"`. See
  [`tf_factions()`](https://bmaitner.github.io/transformeRs/reference/tf_factions.md).

- team:

  Combiner team, e.g. `"Aerialbots"`, or `NA` for characters that are
  not part of a team. See
  [`tf_teams()`](https://bmaitner.github.io/transformeRs/reference/tf_factions.md).

- combiner:

  Palette name of the team's combined form, e.g. `"superion"`, or `NA`.

- role:

  One of `"leader"`, `"combiner torso"`, `"combiner limb"` or
  `"combined form"`.

- alt_mode:

  The toy's alternate mode.

- year:

  Year of the original Hasbro release.

- n_colours:

  Number of colours in the palette.

- description:

  Description of the plastic, chrome and paint colours.

- source:

  URL of the character's page on the Transformers Wiki.

- image:

  Direct URL of the toy photograph the palette was checked against,
  hosted by the Transformers Wiki, or `NA` where none has been
  identified yet.

## Source

Transformers Wiki, <https://tfwiki.net/>.

## Examples

``` r
head(tf_characters)
#>         palette     character    faction       team combiner           role
#> 1 optimus_prime Optimus Prime    Autobot       <NA>     <NA>         leader
#> 2      megatron      Megatron Decepticon       <NA>     <NA>         leader
#> 3    silverbolt    Silverbolt    Autobot Aerialbots superion combiner torso
#> 4      air_raid      Air Raid    Autobot Aerialbots superion  combiner limb
#> 5    fireflight    Fireflight    Autobot Aerialbots superion  combiner limb
#> 6       skydive       Skydive    Autobot Aerialbots superion  combiner limb
#>                           alt_mode year n_colours
#> 1 Freightliner cab-over semi truck 1984         5
#> 2               Walther P38 pistol 1984         5
#> 3     Concorde supersonic airliner 1986         5
#> 4           F-15 Eagle fighter jet 1986         4
#> 5       F-4 Phantom II fighter jet 1986         4
#> 6 F-16 Fighting Falcon fighter jet 1986         5
#>                                                                                                                                             description
#> 1                                  Red cab plastic, blue legs and forearms, silver die-cast chest and grey thighs, yellow detail stickers, black tyres.
#> 2 Chromed silver body, grey plastic barrel and legs, red inner arms and legs on the Hasbro release, black grip and trigger, purple Decepticon insignia.
#> 3                                                           White jet plastic, dark grey legs and arms, red and yellow chest stickers, black detailing.
#> 4                                                                      Black jet plastic with red and white stripe stickers, grey chrome and detailing.
#> 5                                                                               Red fuselage plastic with white wings, grey chrome and black detailing.
#> 6                                                                     Dark grey jet plastic with black, blue accents, red stickers and white detailing.
#>                                            source
#> 1 https://tfwiki.net/wiki/Optimus_Prime_(G1)/toys
#> 2      https://tfwiki.net/wiki/Megatron_(G1)/toys
#> 3         https://tfwiki.net/wiki/Silverbolt_(G1)
#> 4           https://tfwiki.net/wiki/Air_Raid_(G1)
#> 5         https://tfwiki.net/wiki/Fireflight_(G1)
#> 6            https://tfwiki.net/wiki/Skydive_(G1)
#>                                                               image
#> 1 https://tfwiki.net/mediawiki/images2/2/2d/G1_OptimusPrime_toy.jpg
#> 2      https://tfwiki.net/mediawiki/images2/d/d7/G1Megatron_toy.jpg
#> 3                                                              <NA>
#> 4         https://tfwiki.net/mediawiki/images2/2/2d/Airraid_toy.jpg
#> 5    https://tfwiki.net/mediawiki/images2/a/a7/G1Fireflight_toy.JPG
#> 6       https://tfwiki.net/mediawiki/images2/7/77/G1Skydive_Toy.JPG
table(tf_characters$team, tf_characters$faction)
#>                 
#>                  Autobot Decepticon
#>   Aerialbots           6          0
#>   Combaticons          0          6
#>   Constructicons       0          7
#>   Predacons            0          6
#>   Protectobots         6          0
#>   Seacons              0          7
#>   Stunticons           0          6
#>   Technobots           6          0
#>   Terrorcons           0          6
subset(tf_characters, team == "Constructicons", c(palette, role, alt_mode))
#>        palette           role         alt_mode
#> 21        hook combiner torso      Truck crane
#> 22   long_haul combiner torso       Dump truck
#> 23    scrapper  combiner limb Front-end loader
#> 24 bonecrusher  combiner limb        Bulldozer
#> 25   mixmaster  combiner limb     Cement mixer
#> 26   scavenger  combiner limb        Excavator
#> 27  devastator  combined form   Combined robot
```
