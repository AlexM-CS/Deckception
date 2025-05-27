SMODS.Joker {
    key = "ghost_joker",
    loc_txt = {
        name = "Ghost Deck Joker",
        text = {
            "{C:blue}Spectral{} cards may",
            "appear in the shop",
            "{C:inactive}(Chance increased on Ghost Deck)"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Ghost Deck"
        }
    },
    config = {
        extra = {
            spectral_rate = 2
        }
    },
    rarity = 3,
    pos = { x = 2, y = 1 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_ghost"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.spectral_rate
            }
        }
    end,

    add_to_deck = function(self, card)
        G.GAME.spectral_rate = G.GAME.spectral_rate + card.ability.extra.spectral_rate
    end,

    remove_from_deck = function(self, card)
        G.GAME.spectral_rate = G.GAME.spectral_rate - card.ability.extra.spectral_rate
    end
}