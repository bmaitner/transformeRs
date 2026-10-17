# transformerpalettes

R package of color palettes drawn from the Transformers franchise
(Generation 1 toys, their Generation 2 re-releases, the cartoon and the
Marvel comics), built on the same pattern as the sibling package
`glyospalettes` (same author, Glyos colorways; formerly `rglyos`). Fan
project; hex values are hand-curated approximations.

## Where things live

- `R/aaa-registry.R`: the single source of truth. Every toy palette is a
  `leader()` / `member()` / `combined()` call with colors and metadata;
  cartoon and comic versions are `cartoon()` / `comic()` calls further
  down that inherit the toy entry. `tf_palettes` and `tf_characters` are
  derived from it in `R/palettes.R`. Every function takes `medium`
  (default `"toy"`).
- `R/usecase.R`: perceptual stats and the categorical / colorblind /
  sequential / diverging shortlists. Shared logic with glyospalettes;
  keep in sync.
- `vignettes/articles/browse.Rmd`: the filterable browser on the pkgdown
  site. It serialises `tf_characters` + stats to JSON and renders cards
  with “Suggest a change” links that prefill
  `.github/ISSUE_TEMPLATE/*.yml`.
- `WISHLIST.md`: the queue of characters to add and corrections to
  check. This is the intended way to extend the package: the user edits
  the wishlist, then asks for a pass over it.
- `data-raw/README.md`: how a palette is made and the conventions an
  entry follows. `data-raw/make_figures.R` regenerates `man/figures/`.

## Working through the wishlist

When asked to add characters (or with no other instruction, when
`WISHLIST.md` has unchecked lines under **Queued**):

1.  Take queued lines in order, high priority first. For each character,
    fetch its Transformers Wiki page
    (`https://tfwiki.net/wiki/Name_(G1)`; some large characters have a
    `/toys` subpage) to confirm the page exists, the original toy’s
    release year, its alternate mode, and the URL of the toy photo
    (`https://tfwiki.net/mediawiki/images2/<a>/<ab>/<File>.jpg`; strip
    the `thumb/` and size prefix). Direct `curl` to tfwiki.net gets a
    403; use the WebFetch tool. The wiki’s fast summaries are unreliable
    about colors; rely on the toy photo, the wiki’s prose about the toy,
    and knowledge of the toy. Leave `image` as `NA` rather than guessing
    a URL.
2.  Add entries to `R/aaa-registry.R` in a new or existing block,
    following the conventions in `WISHLIST.md` (order, naming, 4-6
    colors, body color first). New teams go in `.team_faction` and the
    `.registry_toys` vector. New roles or subgroups may need
    `tf_characters` docs and tests updated. Add a `cartoon()` entry for
    every new toy entry (tests require it), with an episode still as the
    image: list the episode-named image filenames on the wiki page with
    WebFetch, compute the MediaWiki hash path (see `data-raw/README.md`)
    and verify it with `curl -A "Mozilla/5.0 ..."`. Comic entries are
    optional; when adding one, name the Marvel issue the colors were
    sampled from in the description.
3.  Run `Rscript -e "devtools::document()"`,
    `Rscript -e "devtools::test()"`, `Rscript data-raw/make_figures.R`.
    Fix anything that fails.
4.  Move the wishlist line to **Done** with the next version number,
    update the Coverage table in `README.md`, add a `NEWS.md` bullet,
    bump `Version` in `DESCRIPTION` if this is a release.
5.  Rebuild the site locally to check the browser renders the new cards:
    `Rscript -e "pkgdown::build_site()"`, then open
    `docs/articles/browse.html` (the `.claude/launch.json` config
    `pkgdown-site` serves `docs/`).

Do not commit or push unless asked. Keep the package free of non-ASCII
characters in R code and Rd (CRAN check), including in descriptions.

## Release checks

`dev/release_checks.R` is the pre-CRAN checklist (not shipped; `dev` is
in `.Rbuildignore`). Source it section by section: document, figures,
site, tests,
`devtools::check(cran = TRUE, incoming = TRUE, remote = TRUE)`,
`urlchecker::url_check()`, `spelling::spell_check_package()` against
`inst/WORDLIST`, tarball size, then win-builder. `cran-comments.md`
holds the notes for the reviewer; update its check results before
submitting. When a wishlist pass adds new names, run
`spelling::update_wordlist()` after confirming the only new words are
character, team or company names.

## Commands

``` bash
Rscript -e "devtools::document()"
Rscript -e "devtools::test()"
Rscript -e "devtools::check()"
Rscript data-raw/make_figures.R
Rscript -e "pkgdown::build_site()"
Rscript -e "spelling::spell_check_package()"
Rscript -e "urlchecker::url_check()"
```
