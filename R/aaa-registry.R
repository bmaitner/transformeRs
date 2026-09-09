# Palette registry ---------------------------------------------------------
#
# Every palette in transformeRs is defined here with its colours and metadata.
# The exported objects `tf_palettes` and `tf_characters` are derived from this
# registry in R/palettes.R. Keep entries in one place so the two never drift.
#
# Hex values are hand-curated approximations of the original Generation 1
# toys' plastic, chrome and paint colours. See data-raw/README.md for the
# conventions and WISHLIST.md for what is queued to be added or corrected.
#
# Adding a character: append a `member()` or `leader()` call in the right team
# block, keeping team members in the manufacturer's order (torso first, then
# limbs) and the combined form last. Colours go body plastic first, then
# secondary plastic, then paint/chrome accents, so the first few colours are
# the most distinct. Then run devtools::document(), devtools::test() and
# data-raw/make_figures.R.

ch <- function(palette, colours, character, faction, team = NA_character_,
               combiner = NA_character_, role, alt_mode, year, description,
               reference, image = NA_character_) {
  list(
    palette = palette, colours = colours, character = character,
    faction = faction, team = as.character(team),
    combiner = as.character(combiner), role = role, alt_mode = alt_mode,
    year = as.integer(year), description = description,
    source = tfwiki(reference), image = as.character(image)
  )
}

tfwiki <- function(title) {
  paste0("https://tfwiki.net/wiki/", gsub(" ", "_", title, fixed = TRUE))
}
tfimg <- function(path) paste0("https://tfwiki.net/mediawiki/images2/", path)

.team_faction <- c(
  Aerialbots = "Autobot", Protectobots = "Autobot", Technobots = "Autobot",
  Constructicons = "Decepticon", Stunticons = "Decepticon",
  Combaticons = "Decepticon", Terrorcons = "Decepticon",
  Predacons = "Decepticon", Seacons = "Decepticon"
)

leader <- function(palette, colours, character, faction, alt_mode, year,
                   description, reference, image = NA_character_) {
  ch(palette, colours, character, faction, role = "leader",
     alt_mode = alt_mode, year = year, description = description,
     reference = reference, image = image)
}

member <- function(palette, colours, character, team, combiner, role,
                   alt_mode, year, description, reference,
                   image = NA_character_) {
  ch(palette, colours, character, faction = unname(.team_faction[team]),
     team = team, combiner = combiner, role = role, alt_mode = alt_mode,
     year = year, description = description, reference = reference,
     image = image)
}

combined <- function(palette, colours, character, team, year, description,
                     reference, image = NA_character_) {
  member(palette, colours, character, team, combiner = palette,
         role = "combined form", alt_mode = "Combined robot", year = year,
         description = description, reference = reference, image = image)
}

# Leaders --------------------------------------------------------------------

.registry_leaders <- list(
  leader("optimus_prime", c("#D0202A", "#1F3E8F", "#B8BABF", "#F2D23C", "#2D2D2D"),
         "Optimus Prime", "Autobot", "Freightliner cab-over semi truck", 1984,
         "Red cab plastic, blue legs and forearms, silver die-cast chest and grey thighs, yellow detail stickers, black tyres.",
         "Optimus Prime (G1)/toys", tfimg("2/2d/G1_OptimusPrime_toy.jpg")),
  leader("megatron", c("#C9CBCF", "#8C9095", "#C8323A", "#2A2A2A", "#6B3FA0"),
         "Megatron", "Decepticon", "Walther P38 pistol", 1984,
         "Chromed silver body, grey plastic barrel and legs, red inner arms and legs on the Hasbro release, black grip and trigger, purple Decepticon insignia.",
         "Megatron (G1)/toys", tfimg("d/d7/G1Megatron_toy.jpg"))
)

# Autobot combiner teams ----------------------------------------------------

.registry_aerialbots <- list(
  member("silverbolt", c("#F0F0EC", "#6E7378", "#D42A2A", "#F4C542", "#2B2B2B"),
         "Silverbolt", "Aerialbots", "superion", "combiner torso",
         "Concorde supersonic airliner", 1986,
         "White jet plastic, dark grey legs and arms, red and yellow chest stickers, black detailing.",
         "Silverbolt (G1)"),
  member("air_raid", c("#1F1F22", "#C8262E", "#F2F2F0", "#8A8D91"),
         "Air Raid", "Aerialbots", "superion", "combiner limb",
         "F-15 Eagle fighter jet", 1986,
         "Black jet plastic with red and white stripe stickers, grey chrome and detailing.",
         "Air Raid (G1)", tfimg("2/2d/Airraid_toy.jpg")),
  member("fireflight", c("#D8262C", "#F2F2F0", "#9A9DA1", "#26262A"),
         "Fireflight", "Aerialbots", "superion", "combiner limb",
         "F-4 Phantom II fighter jet", 1986,
         "Red fuselage plastic with white wings, grey chrome and black detailing.",
         "Fireflight (G1)", tfimg("a/a7/G1Fireflight_toy.JPG")),
  member("skydive", c("#7C8187", "#2A2C30", "#3A5FA8", "#C8262E", "#ECECEA"),
         "Skydive", "Aerialbots", "superion", "combiner limb",
         "F-16 Fighting Falcon fighter jet", 1986,
         "Dark grey jet plastic with black, blue accents, red stickers and white detailing.",
         "Skydive (G1)", tfimg("7/77/G1Skydive_Toy.JPG")),
  member("slingshot", c("#F0F0EC", "#D02A2A", "#2A2C30", "#9A9DA1"),
         "Slingshot", "Aerialbots", "superion", "combiner limb",
         "Sea Harrier jump jet", 1986,
         "White jet plastic with red chest and thighs, black and grey detailing.",
         "Slingshot (G1)", tfimg("0/05/G1Slingshot_toy.jpg")),
  combined("superion", c("#C8262E", "#F0F0EC", "#1F1F22", "#8A8D91", "#F4C542"),
           "Superion", "Aerialbots", 1986,
           "Red chest plate and fists over the white body of Silverbolt, black and grey limbs from the four jets, yellow chest sticker.",
           "Superion (G1)", tfimg("d/d3/Superion_toy.jpg"))
)

.registry_protectobots <- list(
  member("hot_spot", c("#1F55B0", "#D22A2A", "#F2F2F0", "#2A2A2A", "#9A9DA1"),
         "Hot Spot", "Protectobots", "defensor", "combiner torso",
         "Mitsubishi Fuso fire engine", 1986,
         "Light blue fire engine plastic with red and white stripes, black tyres and grey chrome ladder.",
         "Hot Spot (G1)", tfimg("6/6a/G1HotSpotToy.jpg")),
  member("streetwise", c("#F2F2EE", "#1E1E1E", "#D22A2A", "#2A5BB5", "#A6A9AE"),
         "Streetwise", "Protectobots", "defensor", "combiner limb",
         "Nissan 300ZX police car", 1986,
         "Off-white car plastic with black doors and hood, red light bar, blue police stickers and grey chrome.",
         "Streetwise (G1)", tfimg("6/6c/G1toy_streetwise.jpg")),
  member("blades", c("#D22A2A", "#F2F2F0", "#262626", "#8C8F94"),
         "Blades", "Protectobots", "defensor", "combiner limb",
         "Bell UH-1 rescue helicopter", 1986,
         "Red helicopter plastic with white doors, black rotors and grey chrome.",
         "Blades (G1)", tfimg("6/67/Bladesg1toy.jpg")),
  member("groove", c("#F2F2EE", "#2F5FA8", "#C9A227", "#262626", "#D22A2A"),
         "Groove", "Protectobots", "defensor", "combiner limb",
         "Honda Goldwing police motorcycle", 1986,
         "White motorcycle plastic with blue fairing, gold painted die-cast chest, black tyres and red stickers.",
         "Groove (G1)", tfimg("7/78/G1-toy_Groove.jpg")),
  member("first_aid", c("#F2F2F0", "#D22A2A", "#A6A9AE", "#2A2A2A"),
         "First Aid", "Protectobots", "defensor", "combiner limb",
         "Datsun Vanette ambulance", 1986,
         "White ambulance plastic with red stripes and robot chest, grey chrome and black detailing.",
         "First Aid (G1)", tfimg("d/d9/G1toy_FirstAid.jpg")),
  combined("defensor", c("#D22A2A", "#F2F2F0", "#1F55B0", "#262626", "#9A9DA1"),
           "Defensor", "Protectobots", 1986,
           "Red chest plate and fists over the blue body of Hot Spot, white limbs from the rescue vehicles, black and grey detailing.",
           "Defensor (G1)", tfimg("8/86/G1defensor_toy.jpg"))
)

.registry_technobots <- list(
  member("scattershot", c("#D02A2A", "#F0F0EC", "#6C7075", "#262626"),
         "Scattershot", "Technobots", "computron", "combiner torso",
         "Cybertronic space cruiser", 1987,
         "Red and white cruiser plastic with dark grey limbs and black detailing.",
         "Scattershot (G1)", tfimg("7/7b/G1-toy_Scattershot.jpg")),
  member("lightspeed", c("#D02A2A", "#F0F0EC", "#2F5FA8", "#8C8F94"),
         "Lightspeed", "Technobots", "computron", "combiner limb",
         "Cybertronic car", 1987,
         "Red car plastic with white robot parts, blue windows and grey chrome.",
         "Lightspeed (G1)", tfimg("5/51/G1-toy_LightspeedTechno.jpg")),
  member("nosecone", c("#E9B62A", "#7A4E2D", "#8C8F94", "#2A2A2A"),
         "Nosecone", "Technobots", "computron", "combiner limb",
         "Cybertronic drill tank", 1987,
         "Yellow drill tank plastic with brown treads and robot parts, grey chrome and black detailing.",
         "Nosecone (G1)", tfimg("6/63/G1-toy_Nosecone.jpg")),
  member("strafe", c("#F0F0EC", "#D02A2A", "#2F5FA8", "#8C8F94"),
         "Strafe", "Technobots", "computron", "combiner limb",
         "Cybertronic rocket plane", 1987,
         "White plane plastic with red and blue paint applications and grey chrome.",
         "Strafe (G1)", tfimg("0/00/G1-toy_Strafe.jpg")),
  member("afterburner", c("#F07C1E", "#F0F0EC", "#55595E", "#262626"),
         "Afterburner", "Technobots", "computron", "combiner limb",
         "Cybertronic motorcycle", 1987,
         "Orange motorcycle plastic with white fairing, dark grey hips and black detailing.",
         "Afterburner (G1)", tfimg("7/73/G1-toy_Afterburner.jpg")),
  combined("computron", c("#D02A2A", "#2F5FA8", "#F0F0EC", "#E9B62A", "#262626"),
           "Computron", "Technobots", 1987,
           "Red and blue chest plate over Scattershot, white and yellow limbs, black detailing.",
           "Computron (G1)", tfimg("f/f6/G1-toy_Computron.jpg"))
)

# Decepticon combiner teams -------------------------------------------------

.registry_constructicons <- list(
  member("hook", c("#3FA23F", "#6E3FA3", "#B5B8BD", "#262626"),
         "Hook", "Constructicons", "devastator", "combiner torso",
         "Truck crane", 1985,
         "Bright green crane plastic with purple robot parts, silver chrome and black detailing.",
         "Hook (G1)", tfimg("2/2f/Hook_toy.jpg")),
  member("long_haul", c("#3FA23F", "#6E3FA3", "#262626", "#B5B8BD"),
         "Long Haul", "Constructicons", "devastator", "combiner torso",
         "Dump truck", 1985,
         "Bright green dump truck plastic with purple robot parts, black tyres and silver chrome.",
         "Long Haul (G1)", tfimg("7/7c/G1Long_Haul_toy.jpg")),
  member("scrapper", c("#3FA23F", "#6E3FA3", "#E9C23B", "#B5B8BD", "#262626"),
         "Scrapper", "Constructicons", "devastator", "combiner limb",
         "Front-end loader", 1985,
         "Bright green loader plastic with purple robot parts, yellow canopy, silver chrome and black detailing.",
         "Scrapper (G1)", tfimg("1/1c/Scrapper_toy.jpg")),
  member("bonecrusher", c("#3FA23F", "#6E3FA3", "#B5B8BD", "#262626"),
         "Bonecrusher", "Constructicons", "devastator", "combiner limb",
         "Bulldozer", 1985,
         "Bright green bulldozer plastic with purple blade and robot parts, silver chrome and black detailing.",
         "Bonecrusher (G1)", tfimg("5/53/Bonecrusher_toy.jpg")),
  member("mixmaster", c("#3FA23F", "#6E3FA3", "#B5B8BD", "#262626"),
         "Mixmaster", "Constructicons", "devastator", "combiner limb",
         "Cement mixer", 1985,
         "Bright green mixer plastic with purple drum and robot parts, silver chrome and black detailing.",
         "Mixmaster (G1)", tfimg("8/8f/Mixmaster_toy.JPG")),
  member("scavenger", c("#3FA23F", "#6E3FA3", "#B5B8BD", "#E9C23B", "#262626"),
         "Scavenger", "Constructicons", "devastator", "combiner limb",
         "Excavator", 1985,
         "Bright green excavator plastic with purple robot parts, silver chrome, yellow stickers and black detailing.",
         "Scavenger (G1)", tfimg("d/d8/ScavengerG1.jpg")),
  combined("devastator", c("#3FA23F", "#6E3FA3", "#B5B8BD", "#262626", "#E9C23B"),
           "Devastator", "Constructicons", 1985,
           "Green limbs and body with the purple chest plate, fists and head, silver chrome, black and yellow stickers.",
           "Devastator (G1)/toys", tfimg("9/91/G1devastator_toy.jpg"))
)

.registry_stunticons <- list(
  member("motormaster", c("#1E1E1E", "#6E7276", "#6E3FA3", "#C9CBCF", "#C8262E"),
         "Motormaster", "Stunticons", "menasor", "combiner torso",
         "Kenworth K100 semi truck", 1986,
         "Black cab plastic, dark silver-grey trailer, purple chest, vacuum-metallised silver chrome and red stickers.",
         "Motormaster (G1)", tfimg("4/4a/G1Motormaster_toy.jpg")),
  member("dead_end", c("#7A1F2E", "#1E1E1E", "#B5B8BD", "#8C8F94"),
         "Dead End", "Stunticons", "menasor", "combiner limb",
         "Porsche 928 sports car", 1986,
         "Maroon car plastic with black robot parts, silver chrome and grey detailing.",
         "Dead End (G1)", tfimg("b/b8/G1DeadEnd_toy.jpg")),
  member("breakdown", c("#F0F0EC", "#2F5FA8", "#262626", "#B5B8BD", "#C8262E"),
         "Breakdown", "Stunticons", "menasor", "combiner limb",
         "Lamborghini Countach sports car", 1986,
         "Off-white car plastic with blue robot parts, black detailing, silver chrome and a red stripe.",
         "Breakdown (G1)", tfimg("2/2b/G1Breakdown_toy.jpg")),
  member("drag_strip", c("#F4A21C", "#5B2C4F", "#262626", "#B5B8BD", "#2A7DE1"),
         "Drag Strip", "Stunticons", "menasor", "combiner limb",
         "Tyrrell P34 six-wheeled race car", 1986,
         "Yellow-orange race car plastic with dark plum head and blaster, black tyres, silver chrome chest and blue painted eyes.",
         "Drag Strip (G1)", tfimg("c/c2/G1Dragstrip_toy.jpg")),
  member("wildrider", c("#4E5257", "#1E1E1E", "#C8262E", "#B5B8BD"),
         "Wildrider", "Stunticons", "menasor", "combiner limb",
         "Ferrari 308 GTB sports car", 1986,
         "Dark grey car plastic with black robot parts, red stripe stickers and silver chrome.",
         "Wildrider (G1)", tfimg("e/e1/G1Wildrider_toy.jpg")),
  combined("menasor", c("#1E1E1E", "#6E3FA3", "#6E7276", "#C9CBCF", "#C8262E"),
           "Menasor", "Stunticons", 1986,
           "Black body from Motormaster with the purple chest plate and fists, dark grey trailer armour, silver chrome and red stickers.",
           "Menasor (G1)", tfimg("4/40/G1menasor_toy.jpg"))
)

.registry_combaticons <- list(
  member("onslaught", c("#4E6E3E", "#2F4F8F", "#262626", "#B5B8BD", "#C8262E"),
         "Onslaught", "Combaticons", "bruticus", "combiner torso",
         "Anti-aircraft missile truck", 1986,
         "Dark green truck plastic with blue robot parts, black tyres, silver chrome and red missiles.",
         "Onslaught (G1)"),
  member("brawl", c("#5B6B3A", "#4E5257", "#C9A227", "#262626"),
         "Brawl", "Combaticons", "bruticus", "combiner limb",
         "Leopard tank", 1986,
         "Olive green tank plastic with dark grey treads and robot parts, gold-yellow accents and black detailing.",
         "Brawl (G1)"),
  member("swindle", c("#D9B04A", "#5A3E8A", "#262626", "#B5B8BD"),
         "Swindle", "Combaticons", "bruticus", "combiner limb",
         "Military jeep", 1986,
         "Tan-yellow jeep plastic with purple robot parts, black tyres and silver chrome.",
         "Swindle (G1)", tfimg("d/df/Swindleg1.jpg")),
  member("blast_off", c("#7A5A3A", "#6E3FA3", "#262626", "#B5B8BD"),
         "Blast Off", "Combaticons", "bruticus", "combiner limb",
         "Space shuttle", 1986,
         "Brown shuttle plastic with purple robot parts, black detailing and silver die-cast chest.",
         "Blast Off (G1)", tfimg("d/d4/G1Blastoff_toy.jpg")),
  member("vortex", c("#7C8187", "#1F5A6B", "#B9A0D6", "#262626", "#F2C21E"),
         "Vortex", "Combaticons", "bruticus", "combiner limb",
         "Kaman SH-2 Seasprite helicopter", 1986,
         "Grey helicopter plastic with dark teal arms and guns, lilac chest plate, black rotors and yellow and red stickers.",
         "Vortex (G1)", tfimg("9/92/G1Vortex_toy.jpg")),
  combined("bruticus", c("#4E6E3E", "#6E3FA3", "#7A5A3A", "#D9B04A", "#7C8187", "#262626"),
           "Bruticus", "Combaticons", 1986,
           "Green body from Onslaught with the purple chest plate and fists, brown, tan and grey limbs, black detailing.",
           "Bruticus (G1)", tfimg("6/60/Bruticus_toy.jpg"))
)

.registry_terrorcons <- list(
  member("hun_gurrr", c("#F0F0EC", "#E75480", "#6E3FA3", "#8C8F94", "#262626"),
         "Hun-Gurrr", "Terrorcons", "abominus", "combiner torso",
         "Two-headed dragon", 1987,
         "White dragon plastic with pink and purple robot parts, grey chrome and black detailing.",
         "Hun-Gurrr (G1)", tfimg("2/2d/G1Hun-Gurrr_toy.jpg")),
  member("blot", c("#6E3FA3", "#A88BD0", "#8C8F94", "#E9C23B", "#262626"),
         "Blot", "Terrorcons", "abominus", "combiner limb",
         "Hunchbacked ogre monster", 1987,
         "Purple monster plastic with lavender robot parts, grey chrome, yellow details and black detailing.",
         "Blot (G1)", tfimg("e/ed/G1Blot_toy.jpg")),
  member("cutthroat", c("#2E6B4F", "#E8D49A", "#8A2E7A", "#E8632A", "#B5B8BD"),
         "Cutthroat", "Terrorcons", "abominus", "combiner limb",
         "Two-legged hawk monster", 1987,
         "Dark green torso plastic with cream legs and head, magenta-purple wings, orange and silver stickers.",
         "Cutthroat (G1)", tfimg("f/f7/G1Cutthroat_toy.jpg")),
  member("rippersnapper", c("#3A5F8F", "#9A9DA1", "#F0F0EC", "#C8262E", "#262626"),
         "Rippersnapper", "Terrorcons", "abominus", "combiner limb",
         "Bipedal shark monster", 1987,
         "Blue shark plastic with grey and white robot parts, red paint and black detailing.",
         "Rippersnapper (G1)", tfimg("7/7e/G1Rippersnapper_toy.jpg")),
  member("sinnertwin", c("#E9C23B", "#3FB8B0", "#6E3FA3", "#262626", "#B5B8BD"),
         "Sinnertwin", "Terrorcons", "abominus", "combiner limb",
         "Two-headed hound monster", 1987,
         "Yellow monster plastic with aqua robot parts, purple details, black and silver detailing.",
         "Sinnertwin (G1)", tfimg("7/73/G1Sinnertwin_toy.jpg")),
  combined("abominus", c("#6E3FA3", "#E75480", "#9A9DA1", "#F0F0EC", "#E9C23B", "#2E6B4F"),
           "Abominus", "Terrorcons", 1987,
           "Purple chest plate and fists over the white and pink body of Hun-Gurrr, grey, yellow and dark green limbs.",
           "Abominus (G1)", tfimg("a/a4/G1abominus_toy.jpg"))
)

.registry_predacons <- list(
  member("razorclaw", c("#F2C21E", "#C8262E", "#262626", "#8C8F94", "#B5B8BD"),
         "Razorclaw", "Predacons", "predaking", "combiner torso",
         "Lion", 1986,
         "Yellow lion plastic with red robot parts, black detailing, grey die-cast and silver chrome.",
         "Razorclaw (G1)", tfimg("f/f5/G1toy-Razorclaw.jpg")),
  member("rampage", c("#F07C1E", "#262626", "#C8262E", "#8C8F94", "#B5B8BD"),
         "Rampage", "Predacons", "predaking", "combiner limb",
         "Tiger", 1986,
         "Orange tiger plastic with black stripes and robot parts, red details, grey die-cast and silver chrome.",
         "Rampage (G1)", tfimg("d/d1/G1_Rampage_toy.jpg")),
  member("tantrum", c("#C8262E", "#8C8F94", "#262626", "#F2C21E", "#B5B8BD"),
         "Tantrum", "Predacons", "predaking", "combiner limb",
         "Bull", 1986,
         "Red bull plastic with grey painted die-cast torso, black detailing, yellow horns and silver chrome.",
         "Tantrum (G1)"),
  member("headstrong", c("#F2C21E", "#C8262E", "#8C8F94", "#262626"),
         "Headstrong", "Predacons", "predaking", "combiner limb",
         "Rhinoceros", 1986,
         "Yellow rhino plastic with red robot parts, grey die-cast back and black detailing.",
         "Headstrong (G1)", tfimg("8/8e/TF-Generation-1-Headstrong.jpg")),
  member("divebomb", c("#F2C21E", "#C8262E", "#F07C1E", "#262626", "#8C8F94"),
         "Divebomb", "Predacons", "predaking", "combiner limb",
         "Eagle", 1986,
         "Yellow eagle plastic with red robot parts, orange accents, black and grey die-cast detailing.",
         "Divebomb (G1)", tfimg("c/c6/G1Divebomb_toy.jpg")),
  combined("predaking", c("#F2C21E", "#C8262E", "#F07C1E", "#262626", "#8C8F94", "#C9A227"),
           "Predaking", "Predacons", 1986,
           "Yellow and orange body from the beasts with red chest plate and limbs, black and grey detailing, gold-coloured die-cast parts.",
           "Predaking (G1)", tfimg("6/61/G1_Predaking_toy.jpg"))
)

.registry_seacons <- list(
  member("snaptrap", c("#3FB0B8", "#262626", "#C8262E", "#B5B8BD"),
         "Snaptrap", "Seacons", "piranacon", "combiner torso",
         "Sea turtle", 1988,
         "Aqua-blue turtle plastic with black robot parts, red paint applications and silver chrome.",
         "Snaptrap (G1)", tfimg("f/f2/G1Snaptrap_toy.jpg")),
  member("nautilator", c("#3FB0B8", "#262626", "#E75480", "#B5B8BD"),
         "Nautilator", "Seacons", "piranacon", "combiner limb",
         "Lobster", 1988,
         "Aqua-blue lobster plastic with black robot parts, pink details and silver chrome.",
         "Nautilator", tfimg("8/8d/Nautilatorg1toy.jpg")),
  member("overbite", c("#6E3FA3", "#3FB0B8", "#262626", "#B5B8BD"),
         "Overbite", "Seacons", "piranacon", "combiner limb",
         "Shark", 1988,
         "Purple shark plastic with aqua-blue robot parts, black detailing and silver chrome.",
         "Overbite (G1)", tfimg("7/76/Overbiteg1toy.jpg")),
  member("seawing", c("#3FB0B8", "#262626", "#E75480", "#B5B8BD"),
         "Seawing", "Seacons", "piranacon", "combiner limb",
         "Manta ray", 1988,
         "Aqua-blue manta plastic with black robot parts, pink stickers and silver chrome.",
         "Seawing (G1)", tfimg("6/63/Seawingg1toy.jpg")),
  member("skalor", c("#3FB0B8", "#262626", "#C8262E", "#6E3FA3", "#B5B8BD"),
         "Skalor", "Seacons", "piranacon", "combiner limb",
         "Coelacanth", 1988,
         "Aqua-blue fish plastic with black robot parts, red and purple paint applications and silver chrome.",
         "Skalor (G1)", tfimg("d/d9/Skalorg1toy.jpg")),
  member("tentakil", c("#3FB0B8", "#9A9DA1", "#262626", "#E75480"),
         "Tentakil", "Seacons", "piranacon", "combiner limb",
         "Squid", 1988,
         "Aqua-blue squid plastic with grey robot parts, black detailing and pink stickers.",
         "Tentakil (G1)", tfimg("4/4a/Tentakilg1toy.jpg")),
  combined("piranacon", c("#3FB0B8", "#262626", "#6E3FA3", "#E75480", "#B5B8BD", "#C8262E"),
           "Piranacon", "Seacons", 1988,
           "Aqua-blue body and limbs from the sea creatures, black chest and fists, purple, pink, silver and red details.",
           "Piranacon (G1)", tfimg("8/83/Piranacong1toy.jpg"))
)

.registry <- c(
  .registry_leaders,
  .registry_aerialbots, .registry_protectobots, .registry_technobots,
  .registry_constructicons, .registry_stunticons, .registry_combaticons,
  .registry_terrorcons, .registry_predacons, .registry_seacons
)
