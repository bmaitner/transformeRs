# Palette provenance

The palettes in `R/aaa-registry.R` are hand-curated, not generated, so there
is no script here that rebuilds them. This file records how they were made and
the conventions an entry follows; `WISHLIST.md` at the package root records
what is queued to be added or corrected.

## How a palette is made

1. The character is matched to the original Hasbro Generation 1 release on the
   Transformers Wiki (https://tfwiki.net/), normally the `Character_(G1)` page
   and, for characters with a large toy history, its `/toys` subpage. That
   page is the `source` column of `tf_characters`, and the wiki's photo of the
   original toy in robot mode is the `image` column.
2. The plastic, chrome, die-cast and paint colors of that toy are listed by
   eye from the photograph and the wiki's own description of the toy (which
   often names the plastic colors and notes regional variants, for example
   the flat gray and blue Takara Megatron versus the chromed, red-accented
   Hasbro one). Hasbro colors are used where the two differ.
3. Hex values are chosen to represent each color as it appears on the toy
   under neutral light, ordered body plastic first, then secondary plastic,
   then chrome and paint accents, so the first few colors are the most
   distinct. Palettes have four to six colors. Chrome and die-cast parts do
   not reduce to a flat color; a mid-gray or silver stands in for them.
4. Members of one combiner team are cast from the same plastics, so their
   entries share hex values deliberately (every Constructicon is the same
   green and purple). The combined form's palette draws one color from each
   contributing part.

Photos on the wiki vary in lighting and white balance, and the summaries used
to check them are not perfect, so expect the palettes to be rough. The
palettes flagged in `WISHLIST.md` under "Corrections and open questions" are
the least certain.

## Cartoon and comic versions

Each character's toy palette is the base entry. A `cartoon()` or `comic()`
call lower in `R/aaa-registry.R` adds a version for another medium; it
inherits the character, faction, team, role and alternate mode from the toy
entry and supplies only colors, the year of the character's first
appearance in that medium, a description, a reference image and (optionally)
the anchor of the wiki section it links to.

- Cartoon colors are the flat colors of the Sunbow animation model, read
  from an episode still on the Transformers Wiki (the `image` column links
  to it). Constructicons are a lime green rather than the toy's grass green,
  Drag Strip is yellow and purple rather than orange and plum, and so on.
  The Seacons never appeared in the Sunbow cartoon; their cartoon palettes
  are from the Japanese Super-God Masterforce series, where they have
  different names.
- Comic colors come from the character's early Marvel appearances. Marvel
  coloring varied by issue and colorist, so a comic palette should name
  the issue it was sampled from in its description. Only the two leaders
  have comic palettes so far; the teams are queued in `WISHLIST.md`.

Reference images for cartoon palettes were found by listing the episode
stills on each character's wiki page and converting the filename to its
MediaWiki path (`images2/<md5[1]>/<md5[1:2]>/<filename>`). Direct requests
to tfwiki.net need a browser user agent.

## Conventions for an entry

- `palette`: lowercase snake_case of the character name (`hun_gurrr`,
  `blast_off`). Combined forms use their own name (`superion`), not a team
  prefix. Cartoon and comic versions add `_cartoon` / `_comic`; the
  `base` column holds the toy name and `medium` the medium.
- `character`: the name as printed on the toy's packaging.
- `team` / `combiner` / `role`: members of a combiner team carry the team
  name, the palette name of the combined form, and a role of
  `"combiner torso"` or `"combiner limb"`; the combined form has role
  `"combined form"` and its own name as `combiner`. Characters outside a team
  have `NA` for both and a role such as `"leader"`.
- Order within a team: torso first, then limbs in the order the toy's
  instructions list them, then the combined form last. Tests check this.
- `year`: year of the original Hasbro release.
- `source`: a `https://tfwiki.net/wiki/` page. `image`: a direct
  `https://tfwiki.net/mediawiki/images2/` file, or `NA` if none has been
  identified; the browser then shows a "no photo" note.

`make_figures.R` regenerates the README figures in `man/figures/`.
