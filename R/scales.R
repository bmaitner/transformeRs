#' Transformers colour and fill scales for ggplot2
#'
#' Colour and fill scales that use a character's palette. The `_d` variants
#' are for discrete data, the `_c` variants for continuous data, and
#' `scale_colour_tf()` / `scale_fill_tf()` choose between the two with the
#' `discrete` argument. `scale_color_*` spellings are aliases.
#'
#' @param palette Name of a character's palette. See [tf_palette_names()].
#' @param discrete Logical. If `TRUE` (default) build a discrete scale,
#'   otherwise a continuous gradient scale.
#' @param reverse Logical. Reverse the order of colours in the palette?
#' @param sort Logical, continuous scales only. Order the palette from darkest
#'   to lightest before building the gradient, so the scale reads as
#'   low-to-high. See [tf_find_palettes()] for palettes that suit this.
#' @param ... Additional arguments passed on to
#'   [ggplot2::discrete_scale()] (discrete) or
#'   [ggplot2::scale_colour_gradientn()] / [ggplot2::scale_fill_gradientn()]
#'   (continuous).
#'
#' @details
#' Discrete scales draw the first `n` colours of the palette, where `n` is the
#' number of levels in the data. If the data has more levels than the palette
#' has colours, the palette is interpolated with [grDevices::colorRampPalette()]
#' so that every level still receives a distinct colour; expect the result to
#' be less legible than the curated colours. For a palette with one colour per
#' member of a combiner team, pass [tf_team_palette()] to
#' [ggplot2::scale_colour_manual()].
#'
#' @return A ggplot2 scale object.
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(displ, hwy, colour = drv)) +
#'   geom_point(size = 3) +
#'   scale_colour_tf("optimus_prime")
#'
#' ggplot(diamonds, aes(cut, fill = clarity)) +
#'   geom_bar() +
#'   scale_fill_tf_d("bruticus")
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_tf_c("hot_spot", sort = TRUE)
#' @name scale_tf
NULL

tf_pal <- function(palette, reverse = FALSE) {
  function(n) {
    cols <- tf_palette(palette, n = n, type = "discrete", strict = FALSE)
    cols <- as.character(cols)
    if (reverse) cols <- rev(cols)
    cols
  }
}

#' @rdname scale_tf
#' @export
scale_colour_tf_d <- function(palette = "optimus_prime", reverse = FALSE, ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    palette = tf_pal(palette, reverse),
    ...
  )
}

#' @rdname scale_tf
#' @export
scale_fill_tf_d <- function(palette = "optimus_prime", reverse = FALSE, ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    palette = tf_pal(palette, reverse),
    ...
  )
}

#' @rdname scale_tf
#' @export
scale_colour_tf_c <- function(palette = "optimus_prime", reverse = FALSE,
                              sort = FALSE, ...) {
  cols <- as.character(tf_palette(palette, sort = sort))
  if (reverse) cols <- rev(cols)
  ggplot2::scale_colour_gradientn(colours = cols, ...)
}

#' @rdname scale_tf
#' @export
scale_fill_tf_c <- function(palette = "optimus_prime", reverse = FALSE,
                            sort = FALSE, ...) {
  cols <- as.character(tf_palette(palette, sort = sort))
  if (reverse) cols <- rev(cols)
  ggplot2::scale_fill_gradientn(colours = cols, ...)
}

#' @rdname scale_tf
#' @export
scale_colour_tf <- function(palette = "optimus_prime", discrete = TRUE,
                            reverse = FALSE, sort = FALSE, ...) {
  if (discrete) {
    scale_colour_tf_d(palette = palette, reverse = reverse, ...)
  } else {
    scale_colour_tf_c(palette = palette, reverse = reverse, sort = sort, ...)
  }
}

#' @rdname scale_tf
#' @export
scale_fill_tf <- function(palette = "optimus_prime", discrete = TRUE,
                          reverse = FALSE, sort = FALSE, ...) {
  if (discrete) {
    scale_fill_tf_d(palette = palette, reverse = reverse, ...)
  } else {
    scale_fill_tf_c(palette = palette, reverse = reverse, sort = sort, ...)
  }
}

#' @rdname scale_tf
#' @export
scale_color_tf_d <- scale_colour_tf_d

#' @rdname scale_tf
#' @export
scale_color_tf_c <- scale_colour_tf_c

#' @rdname scale_tf
#' @export
scale_color_tf <- scale_colour_tf
