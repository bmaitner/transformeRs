# Palette registry ---------------------------------------------------------
#
# Every palette in transformeRs is defined here with its colours and metadata.
# The exported objects `tf_palettes` and `tf_characters` are derived from this
# registry in R/palettes.R. Keep entries in one place so the two never drift.
#
# Every character has a toy palette (the original Generation 1 release) and
# may also have a cartoon palette (the Sunbow animation model) and a comic
# palette (early Marvel appearances), keyed `<base>`, `<base>_cartoon` and
# `<base>_comic`. Hex values are hand-curated approximations. See
# data-raw/README.md for the conventions and WISHLIST.md for what is queued.
#
# Adding a character: append a `member()` or `leader()` call in the right team
# block, keeping team members in the manufacturer's order (torso first, then
# limbs) and the combined form last. Colours go body colour first, then
# secondary colour, then accents, so the first few colours are the most
# distinct. Cartoon and comic versions are `variant()` calls further down that
# inherit the toy entry's metadata. Then run devtools::document(),
# devtools::test() and data-raw/make_figures.R.

ch <- function(palette, colours, character, faction, team = NA_character_,
               combiner = NA_character_, role, alt_mode, year, description,
               reference, image = NA_character_) {
  list(
    palette = palette, base = palette, medium = "toy", colours = colours,
    character = character, faction = faction, team = as.character(team),
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

.registry_toys <- c(
  .registry_leaders,
  .registry_aerialbots, .registry_protectobots, .registry_technobots,
  .registry_constructicons, .registry_stunticons, .registry_combaticons,
  .registry_terrorcons, .registry_predacons, .registry_seacons
)
.toy_index <- stats::setNames(
  .registry_toys, vapply(.registry_toys, `[[`, character(1), "palette")
)

# Cartoon and comic versions ------------------------------------------------
#
# A variant inherits everything from the toy entry except its colours, year
# (first appearance in that medium), description, reference image and the
# section anchor on the wiki page. Cartoon colours are the flat colours of the
# Sunbow animation model as seen in the linked episode still; comic colours
# come from the character's early Marvel appearances.

.anchors <- c(
  cartoon = "The_Transformers_cartoon",
  comic = "Marvel_Comics_continuity"
)

variant <- function(base, medium, colours, year, description,
                    image = NA_character_, anchor = NULL) {
  toy <- .toy_index[[base]]
  if (is.null(toy)) stop("No toy entry for '", base, "'.", call. = FALSE)
  if (is.null(anchor)) anchor <- unname(.anchors[medium])
  page <- sub("/toys$", "", toy$source)
  out <- toy
  out$palette <- paste0(base, "_", medium)
  out$medium <- medium
  out$colours <- colours
  out$year <- as.integer(year)
  out$description <- description
  out$source <- paste0(page, "#", anchor)
  out$image <- as.character(image)
  out
}
cartoon <- function(base, colours, year, description, image = NA_character_,
                    anchor = NULL) {
  variant(base, "cartoon", colours, year, description, image, anchor)
}
comic <- function(base, colours, year, description, image = NA_character_) {
  variant(base, "comic", colours, year, description, image)
}

mf <- "Super-God_Masterforce_cartoon"

.registry_cartoon <- list(
  ## Leaders (1984, season 1) ----
  cartoon("optimus_prime", c("#D9262C", "#2244A0", "#A9AEB3", "#8FCBE8", "#4A4F55"), 1984,
          "Animation model: red torso and arms, blue legs and helmet, silver-grey face, grille and smokestacks, light blue windows, dark grey joints.",
          tfimg("f/f6/Mtmte2_shermandam.jpg")),
  cartoon("megatron", c("#C4C8CC", "#6E7378", "#2B2B2B", "#C8262E", "#6B3FA0"), 1984,
          "Animation model: light grey body, darker grey arms and lower legs, black fusion cannon and chest details, red eyes, purple insignia.",
          tfimg("b/bc/Mtmte1_megatron_throne.jpg")),

  ## Aerialbots (1985, The Key to Vector Sigma) ----
  cartoon("silverbolt", c("#F2F2F0", "#7C8187", "#D42A2A", "#F2C21E", "#2B2B2B"), 1985,
          "Animation model: white body, grey legs and arms, red chest and helmet, yellow chest stripe, black detailing.",
          tfimg("d/d4/G1_Silverbolt_cartoon.jpg")),
  cartoon("air_raid", c("#1F1F22", "#F2F2F0", "#C8262E", "#8A8D91"), 1985,
          "Animation model: black body with white chest and face, red thighs and detailing, grey joints.",
          tfimg("5/53/ForeverLongTime_Air_Raid_Silverbolt.jpg")),
  cartoon("fireflight", c("#D8262C", "#F2F2F0", "#8A8D91", "#2B2B2B"), 1985,
          "Animation model: red body with white wings and chest, grey face and joints, black detailing.",
          tfimg("9/97/CosmicRust_Fireflight_in_trouble.jpg")),
  cartoon("skydive", c("#6E7378", "#2A2C30", "#C8262E", "#F2F2F0", "#3A5FA8"), 1985,
          "Animation model: grey body with black legs and wings, red chest, white face, blue details.",
          tfimg("e/ea/Skydive_slingshot.jpg")),
  cartoon("slingshot", c("#F2F2F0", "#D02A2A", "#2B2B2B", "#8A8D91"), 1985,
          "Animation model: white body with red chest and thighs, black wings and detailing, grey joints.",
          tfimg("b/ba/KeytoVectorSigmaPt2_Slingshot_Motormaster.jpg")),
  cartoon("superion", c("#C8262E", "#F2F2F0", "#2B2B2B", "#8A8D91", "#F2C21E"), 1985,
          "Animation model: red chest, fists and head over a white body, black and grey limbs, yellow chest details.",
          tfimg("d/da/Superion_studioox.jpg")),

  ## Protectobots (1985, season 2) ----
  cartoon("hot_spot", c("#2A6FD6", "#D22A2A", "#F2F2F0", "#2B2B2B", "#8A8D91"), 1985,
          "Animation model: bright blue body with red chest and hips, white face and details, black and grey joints."),
  cartoon("streetwise", c("#F2F2F0", "#1E1E1E", "#D22A2A", "#2A5BB5", "#8A8D91"), 1985,
          "Animation model: white body with black chest and arms, red light bar and details, blue stripes, grey joints.",
          tfimg("3/3a/G1_RevengeofBruticus_FirstAid_Streetwise_help.jpg")),
  cartoon("blades", c("#D22A2A", "#F2F2F0", "#2B2B2B", "#8A8D91"), 1985,
          "Animation model: red body with white chest and face, black rotors and detailing, grey joints.",
          tfimg("4/43/G1_RevengeofBruticus_Blades_savinghumans.jpg")),
  cartoon("groove", c("#F2F2F0", "#2A5BB5", "#2B2B2B", "#F2C21E", "#8A8D91"), 1985,
          "Animation model: white body with blue chest and legs, black wheels, yellow details, grey joints.",
          tfimg("5/5d/G1_RevengeofBruticus_Groove_Streetwise_freezer.jpg")),
  cartoon("first_aid", c("#F2F2F0", "#D22A2A", "#8A8D91", "#2B2B2B"), 1985,
          "Animation model: white body with red chest, shoulders and stripes, grey face and joints, black detailing.",
          tfimg("f/fa/G1_UltimateWeapon_FirstAid_Blades_repairbay.jpg")),
  cartoon("defensor", c("#D22A2A", "#F2F2F0", "#2A6FD6", "#2B2B2B", "#8A8D91"), 1985,
          "Animation model: red chest and fists over a blue body, white limbs, black and grey detailing.",
          tfimg("e/ee/Bot-episode-defensor1.jpg")),

  ## Technobots (1986, Grimlock's New Brain) ----
  cartoon("scattershot", c("#D02A2A", "#F2F2F0", "#6C7075", "#2B2B2B"), 1986,
          "Animation model: red body with white chest and wings, dark grey limbs, black detailing."),
  cartoon("lightspeed", c("#D02A2A", "#F2F2F0", "#2F5FA8", "#8A8D91"), 1986,
          "Animation model: red body with white chest and thighs, blue windows and details, grey joints.",
          tfimg("1/1d/Money-is-everything-lightspeed-bothmodes.jpg")),
  cartoon("nosecone", c("#E9B62A", "#7A4E2D", "#8A8D91", "#2B2B2B"), 1986,
          "Animation model: yellow body with brown legs and treads, grey face and drill, black detailing.",
          tfimg("3/3b/NoseconeMoneyIsEverything.jpg")),
  cartoon("strafe", c("#F2F2F0", "#D02A2A", "#2F5FA8", "#8A8D91"), 1986,
          "Animation model: white body with red chest and wings, blue details, grey joints.",
          tfimg("c/cf/GrimlocksNewBrain_strafe_robotmode.jpg")),
  cartoon("afterburner", c("#F07C1E", "#F2F2F0", "#55595E", "#2B2B2B"), 1986,
          "Animation model: orange body with white chest and face, dark grey legs, black detailing.",
          tfimg("f/f3/G1_afterburner_moneyiseverything.jpg")),
  cartoon("computron", c("#D02A2A", "#2F5FA8", "#F2F2F0", "#E9B62A", "#2B2B2B"), 1986,
          "Animation model: red chest over a blue torso, white and yellow limbs, black detailing.",
          tfimg("0/06/Money-is-everything-computron.jpg")),

  ## Constructicons (1984, Heavy Metal War) ----
  cartoon("hook", c("#79B83A", "#6E3FA3", "#9A9DA1", "#2B2B2B"), 1984,
          "Animation model: lime green body with purple chest, shoulders and thighs, grey face and crane, black detailing.",
          tfimg("b/b0/HookG1.jpg")),
  cartoon("long_haul", c("#79B83A", "#6E3FA3", "#9A9DA1", "#2B2B2B"), 1984,
          "Animation model: lime green body with purple chest and forearms, grey face and wheels, black detailing.",
          tfimg("c/c5/TFTM_LongHaulwithKickback.jpg")),
  cartoon("scrapper", c("#79B83A", "#6E3FA3", "#9A9DA1", "#2B2B2B"), 1984,
          "Animation model: lime green body with purple chest, arms and thighs, grey face and scoop, black detailing.",
          tfimg("9/9a/Scrapperg1cartoon.jpg")),
  cartoon("bonecrusher", c("#79B83A", "#6E3FA3", "#9A9DA1", "#2B2B2B"), 1984,
          "Animation model: lime green body with purple chest and blade, grey face and treads, black detailing.",
          tfimg("c/ce/AutobotRun_Bonecrusher_throws_Jazz.jpg")),
  cartoon("mixmaster", c("#79B83A", "#6E3FA3", "#9A9DA1", "#2B2B2B"), 1984,
          "Animation model: lime green body with purple chest and drum, grey face and wheels, black detailing.",
          tfimg("d/db/HeavyMetalWar_Mixmaster_spray.JPG")),
  cartoon("scavenger", c("#79B83A", "#6E3FA3", "#9A9DA1", "#2B2B2B"), 1984,
          "Animation model: lime green body with purple chest and shovel arm, grey face and treads, black detailing.",
          tfimg("e/eb/HeavyMetalWar_Scavenger.jpg")),
  cartoon("devastator", c("#79B83A", "#6E3FA3", "#9A9DA1", "#2B2B2B", "#C8262E"), 1984,
          "Animation model: lime green limbs and body with purple chest, fists and head, grey face, black detailing, red visor.",
          tfimg("f/fd/TFTM_Devastator.jpg")),

  ## Stunticons (1985, The Key to Vector Sigma) ----
  cartoon("motormaster", c("#1E1E1E", "#6E7276", "#6E3FA3", "#C9CBCF", "#C8262E"), 1985,
          "Animation model: black body with dark grey legs and trailer armour, purple chest and face plate, silver details, red eyes.",
          tfimg("8/81/MotormasterAnimated.jpg")),
  cartoon("dead_end", c("#7A1F2E", "#1E1E1E", "#B5B8BD", "#8C8F94"), 1985,
          "Animation model: maroon body with black thighs and arms, silver chest details, grey face.",
          tfimg("b/b5/Hm9_Dead_End_Smoke.jpg")),
  cartoon("breakdown", c("#F2F2F0", "#3E6FC4", "#2B2B2B", "#B5B8BD", "#C8262E"), 1985,
          "Animation model: white body with mid-blue chest, thighs and helmet, black detailing, silver face, red stripe.",
          tfimg("4/46/Breakdown.jpg")),
  cartoon("drag_strip", c("#F2C21E", "#6E3FA3", "#2B2B2B", "#B5B8BD"), 1985,
          "Animation model: yellow body with purple head, arms and thighs, black wheels, silver chest details. Noticeably yellower and more purple than the toy.",
          tfimg("6/68/Dragstripcartoon.jpg")),
  cartoon("wildrider", c("#4E5257", "#1E1E1E", "#C8262E", "#B5B8BD"), 1985,
          "Animation model: dark grey body with black arms and legs, red chest stripe and details, silver face.",
          tfimg("c/c2/KeyVectorSigma1_Wildrider_fly.JPG")),
  cartoon("menasor", c("#1E1E1E", "#6E3FA3", "#6E7276", "#C9CBCF", "#C8262E", "#F2C21E"), 1985,
          "Animation model: black body with purple chest, fists and head, dark grey armour, silver details, red eyes, yellow leg from Drag Strip.",
          tfimg("3/31/KtVS2_Introducing_Menasor.jpg")),

  ## Combaticons (1985, Starscream's Brigade) ----
  cartoon("onslaught", c("#4E6E3E", "#2E5A8A", "#2B2B2B", "#B5B8BD"), 1985,
          "Animation model: dark green body with blue-teal chest, thighs and helmet, black detailing, silver face.",
          tfimg("a/ad/StarscreamsBrigade_OnslaughtVortex.jpg")),
  cartoon("brawl", c("#5B6B3A", "#4E5257", "#F2C21E", "#2B2B2B"), 1985,
          "Animation model: olive green body with dark grey treads, arms and face, yellow chest details, black detailing. The model differs from the toy in build as well as colour.",
          tfimg("c/c7/BOT_RepairingBrawl.jpg")),
  cartoon("swindle", c("#D9B04A", "#5A3E8A", "#2B2B2B", "#B5B8BD"), 1985,
          "Animation model: tan-yellow body with purple chest, thighs and helmet, black wheels, silver face.",
          tfimg("0/00/AerialAssault_Swindle_Ali.jpg")),
  cartoon("blast_off", c("#7A5A3A", "#6E3FA3", "#2B2B2B", "#B5B8BD"), 1985,
          "Animation model: brown body with purple chest, thighs and helmet, black detailing, silver face.",
          tfimg("2/25/AerialAssault_BlastOff_Aerialbots.jpg")),
  cartoon("vortex", c("#8C97A8", "#6E3FA3", "#2E5A8A", "#2B2B2B", "#B5B8BD"), 1985,
          "Animation model: grey-blue body with purple chest and thighs, blue-teal arms, black rotors, silver face. Grey-blue rather than the toy's grey and lilac.",
          tfimg("4/4d/UltimateWeapon_Vortex_interrogation.jpg")),
  cartoon("bruticus", c("#4E6E3E", "#6E3FA3", "#7A5A3A", "#D9B04A", "#8C97A8", "#2B2B2B"), 1985,
          "Animation model: green body with purple chest, fists and head, brown, tan and grey-blue limbs, black detailing. The model was drawn inconsistently between episodes.",
          tfimg("e/e8/Bruticus_cartoon.jpg")),

  ## Terrorcons (1986, Grimlock's New Brain) ----
  cartoon("hun_gurrr", c("#F2F2F0", "#E75480", "#6E3FA3", "#8C8F94", "#2B2B2B"), 1986,
          "Animation model: white body with pink chest and thighs, purple details, grey face and dragon heads, black detailing.",
          tfimg("0/08/Hungrrtoon.jpg")),
  cartoon("blot", c("#5E4FA2", "#F07C1E", "#A88BD0", "#2B2B2B", "#8C8F94"), 1986,
          "Animation model: blue-purple body with orange chest and details, lavender arms and legs, black detailing, grey face. Orange replaces the toy's yellow.",
          tfimg("e/e2/Money-is-everything-terrorcons-robotmode.jpg")),
  cartoon("cutthroat", c("#24485C", "#E9C98C", "#8A2E7A", "#6E3FA3", "#2B2B2B"), 1986,
          "Animation model: dark teal torso with cream limbs, head and fists, magenta wings, purple insignia, black line work. Follows the toy closely.",
          tfimg("e/e8/Cutthroattoon.jpg")),
  cartoon("rippersnapper", c("#3A5F8F", "#F2F2F0", "#8C8F94", "#C8262E", "#2B2B2B"), 1986,
          "Animation model: blue body with white chest and shark head, grey arms, red details, black detailing.",
          tfimg("7/7f/Rippersnappertoon.jpg")),
  cartoon("sinnertwin", c("#E9C23B", "#3FB8B0", "#6E3FA3", "#2B2B2B", "#8C8F94"), 1986,
          "Animation model: yellow body with aqua chest and thighs, purple details, black detailing, grey face.",
          tfimg("b/b5/Grimnewbrain_kup_vs_sintwin.jpg")),
  cartoon("abominus", c("#6E3FA3", "#E75480", "#F2F2F0", "#8C8F94", "#E9C23B", "#24485C"), 1986,
          "Animation model: purple chest, fists and head over a white and pink body, grey, yellow and dark teal limbs.",
          tfimg("0/02/Money-is-everything-abominus.jpg")),

  ## Predacons (1986, Five Faces of Darkness) ----
  cartoon("razorclaw", c("#F2C21E", "#2B2B2B", "#C8262E", "#8C8F94"), 1986,
          "Animation model: yellow body with black chest, arms and lion mane, red details, grey face.",
          tfimg("e/eb/FFoD5_Razorclaw_point.jpg")),
  cartoon("rampage", c("#F07C1E", "#2B2B2B", "#C8262E", "#8C8F94"), 1986,
          "Animation model: orange body with black stripes, chest and thighs, red details, grey face.",
          tfimg("7/73/MysteryofPlanetMaster-Rampage.jpg")),
  cartoon("tantrum", c("#C8262E", "#8C8F94", "#F2C21E", "#2B2B2B"), 1986,
          "Animation model: red body with grey chest and bull head, yellow horns and details, black detailing.",
          tfimg("0/03/Tantrumchaos.jpg")),
  cartoon("headstrong", c("#F2C21E", "#C8262E", "#8C8F94", "#2B2B2B"), 1986,
          "Animation model: yellow body with red chest and thighs, grey rhino back and face, black detailing.",
          tfimg("c/c5/Headstrong_fist.jpg")),
  cartoon("divebomb", c("#F2C21E", "#C8262E", "#F07C1E", "#2B2B2B", "#8C8F94"), 1986,
          "Animation model: yellow body with red chest and wings, orange details, black detailing, grey face.",
          tfimg("4/44/Fight-or-flee-divebomb-robot.jpg")),
  cartoon("predaking", c("#F2C21E", "#C8262E", "#F07C1E", "#2B2B2B", "#8C8F94"), 1986,
          "Animation model: yellow and orange body with red chest and limbs, black detailing, grey face and joints.",
          tfimg("d/da/FFOD5_Predaking.jpg")),

  ## Seacons (1988, Super-God Masterforce; not in the Sunbow cartoon) ----
  cartoon("snaptrap", c("#3FB0B8", "#2B2B2B", "#C8262E", "#B5B8BD"), 1988,
          "Masterforce animation model (as Turtler): aqua-blue body with black chest and limbs, red details, silver face.",
          anchor = mf),
  cartoon("nautilator", c("#3FB0B8", "#2B2B2B", "#E75480", "#B5B8BD"), 1988,
          "Masterforce animation model (as Lobclaw): aqua-blue body with black limbs, pink details, silver face.",
          anchor = mf),
  cartoon("overbite", c("#6E3FA3", "#3FB0B8", "#2B2B2B", "#B5B8BD"), 1988,
          "Masterforce animation model: purple body with aqua-blue chest and limbs, black detailing, silver face.",
          anchor = mf),
  cartoon("seawing", c("#3FB0B8", "#2B2B2B", "#E75480", "#B5B8BD"), 1988,
          "Masterforce animation model (as Kraken): aqua-blue body with black limbs, pink details, silver face.",
          anchor = mf),
  cartoon("skalor", c("#3FB0B8", "#2B2B2B", "#C8262E", "#6E3FA3", "#B5B8BD"), 1988,
          "Masterforce animation model (as Gulf): aqua-blue body with black limbs, red and purple details, silver face.",
          anchor = mf),
  cartoon("tentakil", c("#3FB0B8", "#9A9DA1", "#2B2B2B", "#E75480"), 1988,
          "Masterforce animation model: aqua-blue body with grey limbs, black detailing, pink details.",
          anchor = mf),
  cartoon("piranacon", c("#3FB0B8", "#2B2B2B", "#6E3FA3", "#E75480", "#B5B8BD", "#C8262E"), 1988,
          "Masterforce animation model (as King Poseidon): aqua-blue body and limbs, black chest and fists, purple, pink, silver and red details.",
          anchor = mf)
)

.registry_comic <- list(
  comic("optimus_prime", c("#CC2229", "#22409A", "#A0A4A8", "#E6E7E8", "#2B2B2B"), 1984,
        "Marvel US #1 onwards: red torso and arms, blue legs and helmet, grey face and grille with near-white highlights, black detailing."),
  comic("megatron", c("#B9BDC2", "#5E6368", "#2B2B2B", "#C8262E", "#6B3FA0"), 1984,
        "Marvel US #1 onwards: light grey body with darker grey limbs, black fusion cannon and chest, red eyes and details, purple insignia.")
)

.registry <- c(.registry_toys, .registry_cartoon, .registry_comic)

