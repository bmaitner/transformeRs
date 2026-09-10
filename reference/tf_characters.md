# Generation 1 Transformers character metadata

Background information for every palette in
[tf_palettes](https://bmaitner.github.io/transformeRs/reference/tf_palettes.md):
the character, which medium the palette records (toy, cartoon or comic),
its faction, the combiner team and combined form it belongs to, its role
in that team, its alternate mode, the year of the reference, a
description of the colours, and links to the reference page and image on
the Transformers Wiki.

## Usage

``` r
tf_characters
```

## Format

A data frame with one row per palette and the columns:

- palette:

  Palette name, as used by
  [`tf_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_palette.md).
  Unique.

- base:

  The character's toy palette name, shared by all of that character's
  palettes across media (e.g. `"optimus_prime"` for both `optimus_prime`
  and `optimus_prime_cartoon`).

- medium:

  `"toy"`, `"cartoon"` or `"comic"`. See
  [`tf_media()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md).

- character:

  Character name as printed on the toy's packaging.

- faction:

  `"Autobot"` or `"Decepticon"`. See
  [`tf_factions()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md).

- team:

  Combiner team, e.g. `"Aerialbots"`, or `NA` for characters that are
  not part of a team. See
  [`tf_teams()`](https://bmaitner.github.io/transformeRs/reference/tf_media.md).

- combiner:

  Base palette name of the team's combined form, e.g. `"superion"`, or
  `NA`.

- role:

  One of `"leader"`, `"combiner torso"`, `"combiner limb"` or
  `"combined form"`.

- alt_mode:

  The character's alternate mode.

- year:

  Year of the reference: the original Hasbro release for toy palettes,
  the character's first appearance for cartoon and comic palettes.

- n_colours:

  Number of colours in the palette.

- description:

  Description of the colours in that medium.

- source:

  URL of the character's page on the Transformers Wiki, with an anchor
  to the relevant section for cartoon and comic palettes.

- image:

  Direct URL of the reference image the palette was checked against (a
  toy photo, an episode still, or a comic panel), hosted by the
  Transformers Wiki, or `NA` where none has been identified yet.

## Source

Transformers Wiki, <https://tfwiki.net/>.

## Examples

``` r
head(tf_characters)
#>         palette          base medium     character    faction       team
#> 1 optimus_prime optimus_prime    toy Optimus Prime    Autobot       <NA>
#> 2      megatron      megatron    toy      Megatron Decepticon       <NA>
#> 3    silverbolt    silverbolt    toy    Silverbolt    Autobot Aerialbots
#> 4      air_raid      air_raid    toy      Air Raid    Autobot Aerialbots
#> 5    fireflight    fireflight    toy    Fireflight    Autobot Aerialbots
#> 6       skydive       skydive    toy       Skydive    Autobot Aerialbots
#>   combiner           role                         alt_mode year n_colours
#> 1     <NA>         leader Freightliner cab-over semi truck 1984         5
#> 2     <NA>         leader               Walther P38 pistol 1984         5
#> 3 superion combiner torso     Concorde supersonic airliner 1986         5
#> 4 superion  combiner limb           F-15 Eagle fighter jet 1986         4
#> 5 superion  combiner limb       F-4 Phantom II fighter jet 1986         4
#> 6 superion  combiner limb F-16 Fighting Falcon fighter jet 1986         5
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
table(tf_characters$team, tf_characters$medium)
#>                 
#>                  cartoon comic toy
#>   Aerialbots           6     0   6
#>   Combaticons          6     0   6
#>   Constructicons       7     0   7
#>   Predacons            6     0   6
#>   Protectobots         6     0   6
#>   Seacons              7     0   7
#>   Stunticons           6     0   6
#>   Technobots           6     0   6
#>   Terrorcons           6     0   6
subset(tf_characters, base == "megatron", c(palette, medium, description))
#>              palette  medium
#> 2           megatron     toy
#> 60  megatron_cartoon cartoon
#> 118   megatron_comic   comic
#>                                                                                                                                               description
#> 2   Chromed silver body, grey plastic barrel and legs, red inner arms and legs on the Hasbro release, black grip and trigger, purple Decepticon insignia.
#> 60                   Animation model: light grey body, darker grey arms and lower legs, black fusion cannon and chest details, red eyes, purple insignia.
#> 118                   Marvel US #1 onwards: light grey body with darker grey limbs, black fusion cannon and chest, red eyes and details, purple insignia.
```
