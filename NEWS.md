# transformerpalettes 0.2.0

* The package is now called transformerpalettes (it started life as
  transformeRs). Function names are unchanged; reinstall with
  `pak::pak("bmaitner/transformerpalettes")`. The old GitHub URL redirects.
* Palettes now record a `medium`: every character has a `toy` palette (the
  original release), every character has a `cartoon` palette (the Sunbow
  animation model, or the Masterforce model for the Seacons), and Optimus
  Prime and Megatron have a `comic` palette (Marvel). Cartoon and comic
  palettes are keyed `<name>_cartoon` and `<name>_comic`, and
  `tf_characters` gains `base` and `medium` columns. 118 palettes in total.
* New `medium` argument on `tf_palette()`, `tf_palette_names()`,
  `tf_team_palette()`, `tf_show_palettes()`, `tf_find_palettes()` and the
  ggplot2 scales, defaulting to `"toy"` so existing code is unchanged;
  `"all"` lists every medium. New `tf_media()`.
* Cartoon palettes link to an episode still on the Transformers Wiki as their
  reference image; the palette browser gains a Medium filter and badge.
* Corrected the toy palettes of Cutthroat, Drag Strip and Vortex against
  their toy photos.
* New `tf_pick()` selects the `n` most distinguishable colours from one or
  more palettes for a light, dark or greyscale plot, optionally requiring
  them to stay distinct under simulated colour-vision deficiency. Colours
  that fail a WCAG contrast check against the background are dropped first;
  the subset is then chosen to maximise the smallest pairwise CIE Lab
  distance.
* Comic palettes for the combiner teams are queued in `WISHLIST.md` rather
  than guessed; Marvel colouring varies by issue, so each will cite the
  issue it was sampled from.

# transformerpalettes 0.1.0

* Initial release with 58 palettes: Optimus Prime, Megatron, and every member
  and combined form of the nine core Generation 1 combiner teams (Aerialbots,
  Protectobots, Technobots, Constructicons, Stunticons, Combaticons,
  Terrorcons, Predacons, Seacons).
* `tf_palette()`, `tf_palette_names()`, `tf_factions()`, `tf_teams()`,
  `tf_show_palettes()`, and `tf_team_palette()` for one colour per member of
  a combiner team (with `distinct = TRUE` for teams cast from shared plastics).
* ggplot2 scales: `scale_colour_tf()`, `scale_fill_tf()` and their
  `_d` / `_c` variants, plus `scale_color_*` aliases.
* `tf_find_palettes()` and `tf_palette_stats()` to shortlist palettes that
  work for categorical, colorblind-safe, sequential or diverging use, judged
  from the colours themselves.
* `tf_characters` metadata table with faction, team, role, alternate mode,
  year, descriptions and Transformers Wiki links and toy photos.
* pkgdown site at <https://bmaitner.github.io/transformerpalettes/> with a filterable
  palette browser and prefilled GitHub issue forms for suggesting palette
  changes and requesting characters. `WISHLIST.md` tracks what is queued.
