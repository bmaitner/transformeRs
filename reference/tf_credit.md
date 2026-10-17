# Credit the rights holders behind a plot's colors

Builds a short attribution sentence naming the characters whose palettes
were used and where their colors come from (the Hasbro and Takara Tomy
toys, the Generation 1 animated series, or the Marvel comics), suitable
for a figure caption or an acknowledgments section. Naming the source of
a color scheme is ordinary factual attribution; the longer form also
states that the colors are approximations and imply no endorsement,
which is the wording journals tend to want.

## Usage

``` r
tf_credit(
  x,
  format = c("caption", "acknowledgment", "markdown"),
  package = TRUE,
  medium = "toy"
)
```

## Arguments

- x:

  What to credit: a palette name, a character vector of names, or a
  `tf_palette` object. Objects from
  [`tf_pick()`](https://bmaitner.github.io/transformerpalettes/reference/tf_pick.md)
  and
  [`tf_team_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_team_palette.md)
  carry their source palettes, so the credit covers every character that
  contributed a color. Names may carry a medium suffix
  (`"megatron_cartoon"`) or rely on `medium`.

- format:

  One of:

  `"caption"`

  :   One sentence for a figure caption, e.g.
      `Colors: Optimus Prime toy colorway by Hasbro and Takara Tomy, via the transformerpalettes R package.`

  `"acknowledgment"`

  :   Two sentences in the register of an acknowledgments section,
      naming the sources and stating that the hex values are
      approximations that imply no endorsement.

  `"markdown"`

  :   The caption with each character linked to its Transformers Wiki
      reference page, for R Markdown, Quarto or pkgdown captions.

- package:

  Logical. Mention the transformerpalettes package? Set to `FALSE` when
  the package is cited elsewhere in the text.

- medium:

  Medium for plain palette names; see
  [`tf_media()`](https://bmaitner.github.io/transformerpalettes/reference/tf_media.md).

## Value

A single character string.

## See also

[tf_characters](https://bmaitner.github.io/transformerpalettes/reference/tf_characters.md)
for the underlying metadata; `citation("transformerpalettes")` for the
package reference.

## Examples

``` r
tf_credit("optimus_prime")
#> [1] "Colors: Optimus Prime toy colorway by Hasbro and Takara Tomy, via the transformerpalettes R package."
tf_credit(c("optimus_prime", "megatron_cartoon", "megatron_comic"))
#> [1] "Colors: Optimus Prime toy colorway by Hasbro and Takara Tomy; Megatron cartoon colors from the Generation 1 animated series; Megatron comic colors from the Marvel Transformers comics, via the transformerpalettes R package."
tf_credit(tf_team_palette("Stunticons"))
#> [1] "Colors: Motormaster, Dead End, Breakdown, Drag Strip and Wildrider toy colorways by Hasbro and Takara Tomy, via the transformerpalettes R package."
tf_credit(tf_pick(c("optimus_prime", "megatron"), n = 4))
#> [1] "Colors: Optimus Prime and Megatron toy colorways by Hasbro and Takara Tomy, via the transformerpalettes R package."
tf_credit("optimus_prime", format = "acknowledgment")
#> [1] "Figure colors are derived from the Optimus Prime toy colorway designed by Hasbro and Takara Tomy. Hex values are approximations from the transformerpalettes R package (Maitner 2026) and imply no endorsement by Hasbro or Takara Tomy."
cat(tf_credit(c("optimus_prime", "megatron"), format = "markdown"))
#> Colors: [Optimus Prime](https://tfwiki.net/wiki/Optimus_Prime_(G1)/toys) and [Megatron](https://tfwiki.net/wiki/Megatron_(G1)/toys) toy colorways by Hasbro and Takara Tomy, via the transformerpalettes R package.

library(ggplot2)
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point(size = 2.5) +
  scale_color_tf("optimus_prime") +
  labs(caption = tf_credit("optimus_prime"))
```
