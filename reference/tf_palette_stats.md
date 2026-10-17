# Perceptual statistics for every Transformers palette

Computes, from the hex colors alone, how suitable each palette is for
the common plotting jobs. Used by
[`tf_find_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_find_palettes.md);
exposed so you can apply your own thresholds.

## Usage

``` r
tf_palette_stats(names = tf_palette_names(medium = "all"))
```

## Arguments

- names:

  Palette names to compute for. Defaults to every palette in every
  medium.

## Value

A data frame with one row per palette and the columns:

- palette:

  Palette name.

- n_colours:

  Number of colors.

- min_de:

  Smallest pairwise Lab distance between any two colors. Larger is
  easier to tell apart; 20 is a comfortable floor for categorical use.

- min_de_deutan, min_de_protan, min_de_tritan:

  The same after simulating each color-vision deficiency.

- lum_range:

  Range of CIE lightness (0 to 100) across the palette.

- hue_spread:

  Angular spread of the chromatic colors' hues, in degrees. Near 0 means
  one hue family.

- hue_clusters:

  Number of distinct hue families (hues separated by more than 60
  degrees).

- has_light:

  Whether the palette contains a light or neutral color that can serve
  as a midpoint.

- categorical, colorblind, sequential, diverging:

  Logical flags as used by
  [`tf_find_palettes()`](https://bmaitner.github.io/transformerpalettes/reference/tf_find_palettes.md).

## Details

Distances are CIE76 (Euclidean in CIE Lab). Color-vision deficiency is
simulated with the Machado, Oliveira and Fernandes (2009) matrices at
full severity for deuteranopia, protanopia and tritanopia. Hue
statistics only consider colors with chroma of at least 20, so grays and
blacks do not count as a hue.

## Examples

``` r
s <- tf_palette_stats()
head(s[order(-s$min_de_deutan), c("palette", "min_de", "min_de_deutan")])
#>               palette   min_de min_de_deutan
#> 277 scattershot_comic 60.24956      60.12099
#> 248    air_raid_comic 60.16312      58.55659
#> 249  fireflight_comic 60.16312      58.55659
#> 251   slingshot_comic 60.16312      58.55659
#> 204    mirage_cartoon 57.99994      53.21237
#> 119            ratbat 59.59306      51.21162
```
