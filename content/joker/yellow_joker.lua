SMODS.Joker {
    key = "yellow_joker",
    loc_txt = {
        name = "Yellow Deck Joker",
        text = {
            "Earn {C:money}$#1#{} at",
            "end of round"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Yellow Deck"
        }
    },
    config = {
        extra = 10
    },
    rarity = 3,
    pos = {x = 2, y = 0},
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_yellow"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra
            }
        }
    end,

    calc_dollar_bonus = function(self, card)
        local dollar_bonus = card.ability.extra
        return dollar_bonus
    end
}