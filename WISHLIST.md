# transformeRs wishlist

This is the working to-do list for the package’s palettes. It is
deliberately a plain Markdown file so that adding a character is a
one-line edit: put the character or team under **Queued**, and the next
maintenance pass (a person, or a Claude Code session in this repo asked
to “work through the wishlist”) turns each queued line into registry
entries, tests, figures and docs. `CLAUDE.md` describes that procedure
step by step.

Public requests arrive as GitHub issues from the [request
form](https://github.com/bmaitner/transformeRs/issues/new?template=new-character.yml);
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

- One palette per character; combiner teams also get a palette for the
  combined form, listed last within the team. Team order is torso first,
  then limbs, then the combined form (tests enforce this).
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

### Remaining Generation 1 combiner teams

**Pretender Monsters + Monstructor** (Decepticon; combiner team; 1989) -
priority: normal TFWiki: <https://tfwiki.net/wiki/Monstructor_(G1)>
Notes: Icepick, Bristleback, Wildfly, Slog, Birdbrain, Scowl. Six-member
team with no fixed torso; use the inner robots’ colours, not the
Pretender shells. Would add a `role` such as `combiner component`.

**Breastforce + Liokaiser** (Decepticon; combiner team; Japan, 1989) -
priority: normal TFWiki: <https://tfwiki.net/wiki/Liokaiser> Notes:
Leozack, Drillhorn, Guyhawk, Hellbat, Jallguar, Killbison. Takara
Victory release only, so the “original Hasbro release” rule needs a
Takara exception; note that in the description.

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

**Seekers** (Decepticon; jets; 1984-85) - priority: high TFWiki:
<https://tfwiki.net/wiki/Starscream_(G1)> Notes: Starscream,
Thundercracker, Skywarp, then the coneheads Dirge, Ramjet, Thrust. Same
mould, so shared greys; body colour differs.

**Dinobots** (Autobot; 1985) - priority: high TFWiki:
<https://tfwiki.net/wiki/Dinobot> Notes: Grimlock, Slag, Sludge, Snarl,
Swoop. Grey and gold chrome with red; Swoop’s red/blue is the outlier.

**Soundwave and the cassettes** (Decepticon; 1984-86) - priority: normal
TFWiki: <https://tfwiki.net/wiki/Soundwave_(G1)> Notes: Soundwave,
Laserbeak, Buzzsaw, Ravage, Rumble, Frenzy, Ratbat. Which of Rumble and
Frenzy is red and which is blue differs between the toys and the
cartoon; follow the Hasbro toys (Rumble blue, Frenzy red) and say so in
the description.

**1984 Autobot cars** (Autobot; 1984) - priority: normal TFWiki:
<https://tfwiki.net/wiki/Autobot_Cars> Notes: Bumblebee, Cliffjumper,
Jazz, Prowl, Ironhide, Ratchet, Wheeljack, Sunstreaker, Sideswipe,
Hound, Mirage, Trailbreaker, Bluestreak. Big batch; could land in two
passes (minibots, then Diaclone cars).

**Insecticons** (Decepticon; 1985) - priority: normal TFWiki:
<https://tfwiki.net/wiki/Insecticon> Notes: Shrapnel, Bombshell,
Kickback. Black and purple with silver.

**1986 movie cast** (both; 1986) - priority: normal TFWiki:
<https://tfwiki.net/wiki/The_Transformers:_The_Movie> Notes: Hot Rod,
Rodimus Prime, Ultra Magnus, Kup, Blurr, Springer, Wreck-Gar, Galvatron,
Cyclonus, Scourge, Sharkticons. Arcee and Unicron had no G1 toy; skip or
mark the source as the animation model.

**Shockwave** (Decepticon; 1985) - priority: normal TFWiki:
<https://tfwiki.net/wiki/Shockwave_(G1)>

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

**Megatron regional variants.** The Hasbro chrome/red values are used.
If a Takara variant is wanted, add it as a separate palette
(`megatron_takara`) rather than editing this one.

**Team palettes for shared-plastic teams.**
[`tf_team_palette()`](https://bmaitner.github.io/transformeRs/reference/tf_team_palette.md)
with `distinct = TRUE` is a greedy heuristic. If a better ordering
exists for a team (e.g. Constructicons: green, purple, silver, yellow,
black, then a repeat), it could be curated per team in the registry.
