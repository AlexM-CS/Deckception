SMODS.Joker {
    key = "black_joker",
    loc_txt = {
        name = "Black Deck Joker",
        text = {
            "Sell this card to",
            "permanently gain {C:attention}+#1#",
            "Joker slot"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Black Deck"
        }
    },
    config = {
        extra = 1
    },
    rarity = 3,
    pos = { x = 4, y = 0 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_black"},
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
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra
            end
        end
    end
}