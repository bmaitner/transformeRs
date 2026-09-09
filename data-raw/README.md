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
2. The plastic, chrome, die-cast and paint colours of that toy are listed by
   eye from the photograph and the wiki's own description of the toy (which
   often names the plastic colours and notes regional variants, for example
   the flat grey and blue Takara Megatron versus the chromed, red-accented
   Hasbro one). Hasbro colours are used where the two differ.
3. Hex values are chosen to represent each colour as it appears on the toy
   under neutral light, ordered body plastic first, then secondary plastic,
   then chrome and paint accents, so the first few colours are the most
   distinct. Palettes have four to six colours. Chrome and die-cast parts do
   not reduce to a flat colour; a mid-grey or silver stands in for them.
4. Members of one combiner team are cast from the same plastics, so their
   entries share hex values deliberately (every Constructicon is the same
   green and purple). The combined form's palette draws one colour from each
   contributing part.

Photos on the wiki vary in lighting and white balance, and the summaries used
to check them are not perfect, so expect the palettes to be rough. The
palettes flagged in `WISHLIST.md` under "Corrections and open questions" are
the least certain.

## Conventions for an entry

- `palette`: lowercase snake_case of the character name (`hun_gurrr`,
  `blast_off`). Combined forms use their own name (`superion`), not a team
  prefix.
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
