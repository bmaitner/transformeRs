# transformeRs 0.1.0

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
* pkgdown site at <https://bmaitner.github.io/transformeRs/> with a filterable
  palette browser and prefilled GitHub issue forms for suggesting palette
  changes and requesting characters. `WISHLIST.md` tracks what is queued.
