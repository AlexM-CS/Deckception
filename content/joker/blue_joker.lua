SMODS.Joker {
    key = "blue_joker",
    loc_txt = {
        name = "Blue Deck Joker",
        text = {
            "Sell this card to",
            "permanently gain {C:blue}+#1#",
            "Hand each round"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Blue Deck"
        }
    },
    config = {
        extra = 1
    },
    rarity = 3,
    pos = {x = 1, y = 0},
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    discovered = false,
    unlock_condition = {type = "win_deck", deck = "b_blue"},
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

    calculate = function(self, card, context)
        if not context.blueprint then
            if context.selling_self then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra
                ease_hands_played(card.ability.extra)
            end
        end
    end
}