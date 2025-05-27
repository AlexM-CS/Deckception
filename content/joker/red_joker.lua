SMODS.Joker {
    key = "red_joker",
    loc_txt = {
        name = "Red Deck Joker",
        text = {
            "Sell this card to",
            "permanently gain {C:red}+#1#",
            "discard each round"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Red Deck"
        }
    },
    config = {
        extra = 1
    },
    rarity = 3,
    pos = {x = 0, y = 0},
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    discovered = false,
    unlock_condition = {type = "win_deck", deck = "b_red"},
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
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra
                ease_discard(card.ability.extra)
            end
        end
    end
}