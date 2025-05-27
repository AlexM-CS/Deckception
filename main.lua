--- STEAMODDED HEADER
--- MOD NAME: Deckception
--- MOD_ID: Deckception
--- MOD_AUTHOR: [Jedi]
--- MOD_DESCRIPTION: Adds 15 new Jokers based on the 15 playable decks!
--- MOD_VERSION: 1.0.0
--- MOD_SITE: https://github.com/AlexM-CS/Deckception
--- PREFIX: deckception

DC = {}

-- Load util
SMODS.load_file("utility/definitions.lua")()
SMODS.load_file("utility/util.lua")()

-- Load atlas
SMODS.load_file("content/atlas.lua")()

-- Load jokers
DC.register(DC.ENABLED, "content/joker")