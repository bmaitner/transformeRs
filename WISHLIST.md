# transformerpalettes wishlist

This is the working to-do list for the package’s palettes. It is
deliberately a plain Markdown file so that adding a character is a
one-line edit: put the character or team under **Queued**, and the next
maintenance pass (a person, or a Claude Code session in this repo asked
to “work through the wishlist”) turns each queued line into registry
entries, tests, figures and docs. `CLAUDE.md` describes that procedure
step by step.

Public requests arrive as GitHub issues from the [request
form](https://github.com/bmaitner/transformerpalettes/issues/new?template=new-character.yml);
triage them into this file rather than working straight from the issue,
so the queue and its priorities live in one place.

## How to write a queued line

    - [ ] **Name or team** (faction; team/subgroup; year) - priority: high | normal | low
          TFWiki: https://tfwiki.net/wiki/Name_(G1)
          Notes: members if a team, which colours matter, anything odd.

Only the bold name and a priority are required. When a line is done,
move it to **Done** with the version it landed in. Keep the sections in
this order; scripts and people both read from the top.

## Conventions the entry must follow

- One toy palette per character; combiner teams also get a palette for
  the combined form, listed last within the team. Team order is torso
  first, then limbs, then the combined form (tests enforce this).
  Subgroups that do not combine (Dinobots, Seekers) use `subgroup()` in
  the registry, which sets role `subgroup member` and no combiner; list
  members in release order.
- Every character also gets a `cartoon` palette (the animation model,
  read from an episode still linked as the image; tests enforce this),
  and may get a `comic` palette. A comic palette must say in its
  description which Marvel issue its colours were sampled from, because
  Marvel colouring changed between issues and colourists. Cartoon and
  comic entries are `cartoon()` / `comic()` calls below the toy blocks
  in the registry.
- Palette name: character name in lowercase snake_case (`hun_gurrr`,
  `blast_off`). Combined forms use their own name with no team prefix.
- Colours: 4 to 6 hex values from the original Hasbro release, body
  plastic first, then secondary plastic, then chrome/die-cast/paint
  accents, most distinct first. Members of one team share hex values for
  shared plastics.
- Metadata: character, faction, team, combiner, role (`leader`,
  `combiner torso`, `combiner limb`, `combined form`, or a new role if
  the subgroup needs one), alt_mode, year, description, TFWiki page, and
  a TFWiki toy photo URL where one exists (`NA` otherwise; the browser
  copes).
- After adding: `devtools::document()`, `devtools::test()`,
  `source("data-raw/make_figures.R")`, update the Coverage table in
  `README.md` and the entry in `NEWS.md`, and rebuild the pkgdown site.

## Done

| Item | Palettes | Landed in |
|----|----|----|
| Optimus Prime, Megatron | `optimus_prime`, `megatron` | 0.1.0 |
| Cartoon palettes for all 58 characters | `<name>_cartoon` | 0.2.0 |
| Comic palettes for Optimus Prime, Megatron | `optimus_prime_comic`, `megatron_comic` | 0.2.0 |
| Constructicons + Devastator (comic, Marvel US \#10) | `hook_comic` … `devastator_comic` | 0.3.0 |
| Aerialbots + Superion (comic, Marvel US \#21) | `silverbolt_comic` … `superion_comic` | 0.3.0 |
| Stunticons + Menasor (comic, Marvel US \#22) | `motormaster_comic` … `menasor_comic` | 0.3.0 |
| Protectobots + Defensor (comic, Marvel US \#24) | `hot_spot_comic` … `defensor_comic` | 0.3.0 |
| Combaticons + Bruticus (comic, Marvel US \#32) | `onslaught_comic` … `bruticus_comic` | 0.3.0 |
| Predacons + Predaking (comic, Marvel US \#25) | `razorclaw_comic` … `predaking_comic` | 0.3.0 |
| Seekers (toy + cartoon) | `starscream`, `thundercracker`, `skywarp`, `dirge`, `ramjet`, `thrust` | 0.3.0 |
| Dinobots (toy + cartoon) | `grimlock`, `slag`, `sludge`, `snarl`, `swoop` | 0.3.0 |
| Technobots, Terrorcons, Seacons (comic, Marvel UK) | `scattershot_comic` … `piranacon_comic` | 0.4.0 |
| Pretender Monsters + Monstructor (toy) | `slog`, `birdbrain`, `icepick`, `bristleback`, `wildfly`, `scowl`, `monstructor` | 0.4.0 |
| Breastforce + Liokaiser (toy + Victory cartoon) | `leozack` … `liokaiser` | 0.4.0 |
| Shockwave, Soundwave and the cassettes | `shockwave`, `soundwave`, `laserbeak`, `buzzsaw`, `ravage`, `rumble`, `frenzy`, `ratbat` | 0.4.0 |
| Insecticons | `shrapnel`, `bombshell`, `kickback` | 0.4.0 |
| 1984 Autobot cars and Mini Vehicles | `jazz` … `bluestreak`, `bumblebee` … `gears` | 0.4.0 |
| 1986 movie cast | `hot_rod`, `rodimus_prime`, `ultra_magnus`, `kup`, `blurr`, `springer`, `wreck_gar`, `galvatron`, `cyclonus`, `scourge`, `gnaw` | 0.4.0 |
| Generation 2 Constructicons, Aerialbots, Combaticons | `<name>_g2` | 0.4.0 |
| Aerialbots + Superion | `silverbolt`, `air_raid`, `fireflight`, `skydive`, `slingshot`, `superion` | 0.1.0 |
| Protectobots + Defensor | `hot_spot`, `streetwise`, `blades`, `groove`, `first_aid`, `defensor` | 0.1.0 |
| Technobots + Computron | `scattershot`, `lightspeed`, `nosecone`, `strafe`, `afterburner`, `computron` | 0.1.0 |
| Constructicons + Devastator | `hook`, `long_haul`, `scrapper`, `bonecrusher`, `mixmaster`, `scavenger`, `devastator` | 0.1.0 |
| Stunticons + Menasor | `motormaster`, `dead_end`, `breakdown`, `drag_strip`, `wildrider`, `menasor` | 0.1.0 |
| Combaticons + Bruticus | `onslaught`, `brawl`, `swindle`, `blast_off`, `vortex`, `bruticus` | 0.1.0 |
| Terrorcons + Abominus | `hun_gurrr`, `blot`, `cutthroat`, `rippersnapper`, `sinnertwin`, `abominus` | 0.1.0 |
| Predacons + Predaking | `razorclaw`, `rampage`, `tantrum`, `headstrong`, `divebomb`, `predaking` | 0.1.0 |
| Seacons + Piranacon | `snaptrap`, `nautilator`, `overbite`, `seawing`, `skalor`, `tentakil`, `piranacon` | 0.1.0 |

## Queued

Add new lines anywhere in this section; higher priority and earlier
lines go first when there is a choice.

### Comic palettes for the teams already in the package

Marvel colouring is not consistent, so each of these needs a specific
issue to sample from; the suggestions below are the teams’ first or most
prominent US appearances. Marvel UK reprinted the US art with its own
colouring, so say which edition was used.

### Remaining Generation 1 combiner teams

**Multiforce + Landcross** (Autobot; combiner team; Japan, 1989) -
priority: low TFWiki: <https://tfwiki.net/wiki/Landcross>

**Brainmasters + Road Caesar** (Autobot; combiner team; Japan, 1989) -
priority: low TFWiki: <https://tfwiki.net/wiki/Road_Caesar>

**Trainbots + Raiden** (Autobot; combiner team; Japan, 1987) - priority:
low TFWiki: <https://tfwiki.net/wiki/Raiden_(G1)>

**Dinoforce + Dinoking** (Decepticon; combiner team; Japan, 1989) -
priority: low TFWiki: <https://tfwiki.net/wiki/Dinoking> Notes:
Pretender-shell redecos of the Pretender Monsters; do after Monstructor.

### Other subgroups people will ask for

**Generation 2 orange Constructicons** (Decepticon; 1993) - priority:
low Notes: the `g2` palettes record the 1992 yellow release. The 1993
orange release would need a second medium or a variant key.

**Generation 2 Stunticons and Protectobots** (both; unreleased 1994) -
priority: low Notes: prototypes only (see the Menasor and Defensor toy
pages). Add only if a clear photo of the prototypes turns up.

**Arcee, Unicron** (1986 movie) - priority: low Notes: no G1 toy. Could
be added as cartoon-only characters if the toy-first rule is relaxed for
them.

**Triple Changers** (both; 1985-86) - priority: low TFWiki:
<https://tfwiki.net/wiki/Triple_Changer> Notes: Blitzwing, Astrotrain,
Octane, Springer, Sandstorm, Broadside.

**Omega Supreme, Jetfire** (Autobot; 1985) - priority: low

**Headmasters and Targetmasters** (both; 1987) - priority: low Notes:
Fortress Maximus and Scorponok would each be one palette; the small
Headmasters could be a subgroup.

## Corrections and open questions

Things already in the package that need a better source or a second
opinion. Corrections that arrive through the “Suggest a palette change”
issue form should be triaged into this list too.

**Silverbolt, Onslaught, Brawl, Tantrum: no toy photo linked.** TFWiki
has no clearly named G1 toy image on their pages that could be found
programmatically. Find the image (Special:ListFiles, or the `/toys`
subpage in a browser) and set `image` in `R/aaa-registry.R`.

**Onslaught and Brawl robot-mode colours.** Both were set from memory
because no toy photo was found; confirm Onslaught’s blue robot parts
(`#2F4F8F`) and Brawl’s olive (`#5B6B3A`) against a photo.

**Palettes checked against the linked photo so far:** Hun-Gurrr, Blot,
Cutthroat, Drag Strip, Vortex (the last three were corrected on
2026-09-08). The rest were set from the wiki’s prose and memory of the
toys; a pass through the remaining photos in the browser would be
worthwhile.

**The 0.4.0 batch was checked against toy photos, not stills.** Toy
palettes for the movie cast, Pretender Monsters, Breastforce and the G2
teams were set from the linked photos; the cassettes, Insecticons,
Autobot cars and Mini Vehicles were set from memory with the photo
linked but not individually reviewed. Comic palettes for the Technobots,
Terrorcons and Seacons come from one team panel each.

**Most cartoon palettes are unchecked against their stills.** They were
set from knowledge of the Sunbow models, then an episode still was
linked for each (none for Hot Spot, Scattershot or any Seacon). Checked
so far: Cutthroat (corrected on 2026-09-09: the model follows the toy,
not the green/red of later art) and Drag Strip (matched). Open the
browser with `?medium=cartoon`, turn on photos, and correct what looks
off. Watch for episode stills with unusual lighting (night scenes,
energy effects).

**Comic palettes for team members are read from a team panel.** The
linked panels show the combined form (Aerialbots, Stunticons,
Protectobots), a small group shot (Predacons) or vehicle modes
(Combaticons), so individual members’ comic colours are inferred from
the team’s palette and the toy. A pass that links each member to a
robot-mode panel of its own would tighten them.

**Seacon cartoon palettes have no reference image.** Their Masterforce
appearances are not illustrated on the English wiki pages; the Japanese
names (Turtler, Lobclaw, Gulf, Kraken, King Poseidon) may help find
stills elsewhere.

**Megatron regional variants.** The Hasbro chrome/red values are used.
If a Takara variant is wanted, add it as a separate palette
(`megatron_takara`) rather than editing this one.

**Team palettes for shared-plastic teams.**
[`tf_team_palette()`](https://bmaitner.github.io/transformerpalettes/reference/tf_team_palette.md)
with `distinct = TRUE` is a greedy heuristic. If a better ordering
exists for a team (e.g. Constructicons: green, purple, silver, yellow,
black, then a repeat), it could be curated per team in the registry.
