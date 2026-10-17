# Transformers character metadata

Background information for every palette in
[tf_palettes](https://bmaitner.github.io/transformerpalettes/reference/tf_palettes.md):
the character, which medium the palette records (toy, cartoon, comic or
Generation 2 re-release), its faction, the combiner team and combined
form it belongs to, its role in that team, its alternate mode, the year
of the reference, a description of the colors, and links to the
reference page and image on the Transformers Wiki.

## Usage

``` r
tf_characters
```

## Format

A data frame with one row per palette and the columns:

- palette:

  Palette name, as used by
  [`tf_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_palette.md).
  Unique.

- base:

  The character's toy palette name, shared by all of that character's
  palettes across media (e.g. `"optimus_prime"` for both `optimus_prime`
  and `optimus_prime_cartoon`).

- medium:

  `"toy"`, `"cartoon"`, `"comic"` or `"g2"`. See
  [`tf_media()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

- character:

  Character name as printed on the toy's packaging.

- faction:

  `"Autobot"` or `"Decepticon"`. See
  [`tf_factions()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

- team:

  Combiner team or subgroup, e.g. `"Aerialbots"` or `"Seekers"`, or `NA`
  for characters that are not part of one. See
  [`tf_teams()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

- combiner:

  Base palette name of the team's combined form, e.g. `"superion"`, or
  `NA` for leaders and for subgroups that do not combine.

- role:

  One of `"leader"`, `"standalone"` (a character outside any team),
  `"combiner torso"`, `"combiner limb"`, `"combined form"` or
  `"subgroup member"` (Dinobots, Seekers, Cassettes, Insecticons,
  Autobot Cars, Minibots).

- alt_mode:

  The character's alternate mode.

- year:

  Year of the reference: the original Hasbro release for toy palettes,
  the character's first appearance for cartoon and comic palettes.

- n_colours:

  Number of colors in the palette.

- description:

  Description of the colors in that medium.

- source:

  URL of the character's page on the Transformers Wiki, with an anchor
  to the relevant section for cartoon and comic palettes.

- image:

  Direct URL of the reference image the palette was checked against (a
  toy photo, an episode still, or a comic panel), hosted by the
  Transformers Wiki, or `NA` where none has been identified yet.

## Source

Transformers Wiki, <https://tfwiki.net/wiki/Main_Page>.

## Examples

``` r
head(tf_characters)
#>         palette          base medium     character    faction       team
#> 1 optimus_prime optimus_prime    toy Optimus Prime    Autobot       <NA>
#> 2      megatron      megatron    toy      Megatron Decepticon       <NA>
#> 3     shockwave     shockwave    toy     Shockwave Decepticon       <NA>
#> 4     soundwave     soundwave    toy     Soundwave Decepticon       <NA>
#> 5    silverbolt    silverbolt    toy    Silverbolt    Autobot Aerialbots
#> 6      air_raid      air_raid    toy      Air Raid    Autobot Aerialbots
#>   combiner           role                         alt_mode year n_colours
#> 1     <NA>         leader Freightliner cab-over semi truck 1984         5
#> 2     <NA>         leader               Walther P38 pistol 1984         5
#> 3     <NA>     standalone                     Laser pistol 1985         5
#> 4     <NA>     standalone           Microcassette recorder 1984         5
#> 5 superion combiner torso     Concorde supersonic airliner 1986         5
#> 6 superion  combiner limb           F-15 Eagle fighter jet 1986         4
#>                                                                                                                                             description
#> 1                                  Red cab plastic, blue legs and forearms, silver die-cast chest and gray thighs, yellow detail stickers, black tires.
#> 2 Chromed silver body, gray plastic barrel and legs, red inner arms and legs on the Hasbro release, black grip and trigger, purple Decepticon insignia.
#> 3                                              Purple plastic with light lavender-gray arms and barrel, yellow eye and hose, black grip, silver chrome.
#> 4                                             Dark blue plastic with gray chest door and limbs, black detailing, yellow eyes and buttons, red stickers.
#> 5                                                           White jet plastic, dark gray legs and arms, red and yellow chest stickers, black detailing.
#> 6                                                                      Black jet plastic with red and white stripe stickers, gray chrome and detailing.
#>                                            source
#> 1 https://tfwiki.net/wiki/Optimus_Prime_(G1)/toys
#> 2      https://tfwiki.net/wiki/Megatron_(G1)/toys
#> 3     https://tfwiki.net/wiki/Shockwave_(G1)/toys
#> 4     https://tfwiki.net/wiki/Soundwave_(G1)/toys
#> 5         https://tfwiki.net/wiki/Silverbolt_(G1)
#> 6           https://tfwiki.net/wiki/Air_Raid_(G1)
#>                                                               image
#> 1 https://tfwiki.net/mediawiki/images2/2/2d/G1_OptimusPrime_toy.jpg
#> 2      https://tfwiki.net/mediawiki/images2/d/d7/G1Megatron_toy.jpg
#> 3     https://tfwiki.net/mediawiki/images2/4/4e/G1Shockwave_toy.jpg
#> 4     https://tfwiki.net/mediawiki/images2/3/36/G1Soundwave_toy.jpg
#> 5                                                              <NA>
#> 6         https://tfwiki.net/mediawiki/images2/2/2d/Airraid_toy.jpg
table(tf_characters$team, tf_characters$medium)
#>                     
#>                      cartoon comic g2 toy
#>   Aerialbots               6     6  6   6
#>   Autobot Cars            11     0  0  11
#>   Breastforce              7     0  0   7
#>   Cassettes                6     0  0   6
#>   Combaticons              6     6  6   6
#>   Constructicons           7     7  7   7
#>   Dinobots                 5     0  0   5
#>   Insecticons              3     0  0   3
#>   Minibots                 6     0  0   6
#>   Predacons                6     6  0   6
#>   Pretender Monsters       0     0  0   7
#>   Protectobots             6     6  0   6
#>   Seacons                  7     7  0   7
#>   Seekers                  6     0  0   6
#>   Stunticons               6     6  0   6
#>   Technobots               6     6  0   6
#>   Terrorcons               6     6  0   6
subset(tf_characters, base == "megatron", c(palette, medium, description))
#>              palette  medium
#> 2           megatron     toy
#> 124 megatron_cartoon cartoon
#> 239   megatron_comic   comic
#>                                                                                                                                               description
#> 2   Chromed silver body, gray plastic barrel and legs, red inner arms and legs on the Hasbro release, black grip and trigger, purple Decepticon insignia.
#> 124                  Animation model: light gray body, darker gray arms and lower legs, black fusion cannon and chest details, red eyes, purple insignia.
#> 239                   Marvel US #1 onwards: light gray body with darker gray limbs, black fusion cannon and chest, red eyes and details, purple insignia.
```
