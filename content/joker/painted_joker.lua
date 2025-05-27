SMODS.Joker {
    key = "painted_joker",
    loc_txt = {
        name = "Painted Deck Joker",
        text = {
            "{C:attention}+#1#{} hand size"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Painted Deck"
        }
    },
    config = {
        extra = {
            h_size = 3
        }
    },
    rarity = 3,
    pos = { x = 1, y = 2 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_painted"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card)
        G.hand:change_size(card.ability.extra.h_size)
    end,

    remove_from_deck = function(self, card)
        G.hand:change_size(-card.ability.extra.h_size)
    end
}