## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new submission.

## Notes for the reviewer

* Possibly misspelled words in DESCRIPTION are proper nouns from the toy
  line: the combiner teams (Aerialbots, Protectobots, Technobots,
  Constructicons, Stunticons, Combaticons, Terrorcons, Predacons, Seacons,
  Breastforce), the subgroups (Dinobots, Insecticons), the character
  Soundwave, the faction Autobot and the company Takara Tomy. They are
  spelled as the manufacturers spell them.

* Links to the Transformers Wiki (<https://tfwiki.net/>) point at the
  community wiki that documents each toy. The `image` column of the
  `tf_characters` data frame holds direct links to photographs hosted there;
  they are data rather than documentation and were verified at build time.

## Test environments

* local Windows 11, R 4.4.1
* GitHub Actions: ubuntu-latest (R devel, release, oldrel-1), macos-latest
  (release), windows-latest (release)
* win-builder (devel)
* R-hub v2: linux (R devel), macos (R devel), windows (R devel), ubuntu-next
  (R next), clang-asan (R devel with AddressSanitizer)
