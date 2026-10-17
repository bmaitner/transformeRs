# Regenerates the README figures in man/figures/. Run from the package root.
devtools::load_all(quiet = TRUE)
library(ggplot2)

# Leaders and combined forms in one figure
lead <- tf_palette_names(role = "leader")
gestalts <- tf_palette_names(role = "combined form")
png("man/figures/palettes-leaders-and-combiners.png",
    width = 2000, height = 160 + 260 * ceiling(length(c(lead, gestalts)) / 3),
    res = 200)
tf_show_palettes(c(lead, gestalts), ncol = 3)
dev.off()

# One figure per combiner team: members then combined form
for (tm in tf_teams()) {
  nms <- tf_palette_names(team = tm)
  slug <- gsub(" ", "-", tolower(tm), fixed = TRUE)
  ncol <- 2
  nrow <- ceiling(length(nms) / ncol)
  png(sprintf("man/figures/palettes-%s.png", slug),
      width = 1600, height = 160 + 260 * nrow, res = 200)
  tf_show_palettes(nms, ncol = ncol)
  dev.off()
}

# Team palettes: one color per member, body color and distinct variants
teams <- tf_teams()
draw_team <- function(cols, title) {
  k <- length(cols)
  plot(0, 0, type = "n", xlim = c(0, k), ylim = c(-0.45, 1), axes = FALSE,
       xlab = "", ylab = "", main = title, cex.main = 0.9, font.main = 1,
       xaxs = "i", yaxs = "i")
  rect(seq_len(k) - 1, 0, seq_len(k), 1, col = cols, border = NA)
  text(seq_len(k) - 0.5, -0.22, labels = names(cols), cex = 0.55, xpd = NA)
}
png("man/figures/team-palettes.png", width = 2000,
    height = 160 + 260 * length(teams) / 2, res = 200)
old <- par(mfrow = c(ceiling(length(teams) / 2), 4), mar = c(0.2, 0.4, 1.4, 0.4))
for (tm in teams) {
  draw_team(tf_team_palette(tm), tm)
  draw_team(tf_team_palette(tm, distinct = TRUE), paste(tm, "(distinct)"))
}
par(old)
dev.off()

# Toy, cartoon, comic and G2 versions side by side for the original leaders
# and the nine core combined forms
trio <- c("optimus_prime", "megatron", gestalts[1:9])
keys <- unlist(lapply(trio, function(b) {
  tf_characters$palette[tf_characters$base == b]
}))
png("man/figures/media-comparison.png", width = 2000,
    height = 160 + 260 * ceiling(length(keys) / 3), res = 200)
tf_show_palettes(keys, ncol = 3)
dev.off()

# Colorblind-friendly shortlist
cb <- tf_find_palettes("colorblind")
if (length(cb)) {
  png("man/figures/palettes-colorblind.png",
      width = 2000, height = 160 + 260 * ceiling(length(cb) / 3), res = 200)
  tf_show_palettes(cb, ncol = 3)
  dev.off()
}

# tf_pick(): the same pool of palettes picked for three plot styles
pool <- c("optimus_prime", "megatron", "devastator", "predaking")
draw_pick <- function(p, title) {
  bg <- attr(p, "background")
  dark <- relative_luminance(bg) < 0.2
  k <- length(p)
  plot(0, 0, type = "n", xlim = c(0, k), ylim = c(-0.45, 1), axes = FALSE,
       xlab = "", ylab = "", main = title, cex.main = 0.9, font.main = 1,
       xaxs = "i", yaxs = "i")
  # paint the plot region in the pick's background so the swatches are seen
  # against what they were chosen for
  rect(-1, -1, k + 1, 2, col = bg, border = NA)
  rect(seq_len(k) - 1, 0, seq_len(k), 1, col = p, border = NA)
  text(seq_len(k) - 0.5, -0.22, labels = as.character(p), cex = 0.55,
       family = "mono", col = if (dark) "white" else "black")
}
png("man/figures/pick-examples.png", width = 2000, height = 900, res = 200)
par(mfrow = c(2, 2), mar = c(0.2, 0.4, 1.4, 0.4))
draw_pick(tf_pick(pool, n = 5), 'tf_pick(pool, 5)')
draw_pick(tf_pick(pool, n = 5, style = "dark"), 'tf_pick(pool, 5, style = "dark")')
draw_pick(tf_pick(pool, n = 5, colorblind = TRUE), 'tf_pick(pool, 5, colorblind = TRUE)')
draw_pick(tf_pick(pool, n = 5, style = "grayscale"), 'tf_pick(pool, 5, style = "grayscale")')
dev.off()

# ggplot2 examples
p1 <- ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point(size = 2.5) +
  scale_colour_tf("optimus_prime") +
  theme_minimal() +
  labs(title = 'scale_colour_tf("optimus_prime")')
p2 <- ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar(show.legend = FALSE) +
  scale_fill_tf("predaking") +
  theme_minimal() +
  labs(title = 'scale_fill_tf("predaking")', x = NULL)
p3 <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster() +
  scale_fill_tf_c("hot_spot", sort = TRUE) +
  theme_minimal() +
  labs(title = 'scale_fill_tf_c("hot_spot", sort = TRUE)')
p4 <- ggplot(economics_long, aes(date, value01, colour = variable)) +
  geom_line(linewidth = 0.8) +
  scale_colour_manual(values = unname(tf_team_palette("Combaticons"))) +
  theme_minimal() +
  labs(title = 'tf_team_palette("Combaticons")', y = NULL)

png("man/figures/examples.png", width = 2000, height = 1500, res = 180)
grid::grid.newpage()
grid::pushViewport(grid::viewport(layout = grid::grid.layout(2, 2)))
plots <- list(p1, p2, p3, p4)
for (i in seq_along(plots)) {
  print(plots[[i]], vp = grid::viewport(
    layout.pos.row = (i - 1) %/% 2 + 1,
    layout.pos.col = (i - 1) %% 2 + 1
  ))
}
dev.off()
