SMODS.Joker {
    key = "abandoned_joker",
    loc_txt = {
        name = "Abandoned Deck Joker",
        text = {
            "{X:red,C:white}X#1#{} Mult when there",
            "are no face cards in",
            "your {C:attention}full deck"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Abandoned Deck"
        }
    },
    config = {
        extra = {
            xmult = 5
        }
    },
    rarity = 3,
    pos = { x = 3, y = 1 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_abandoned"},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local flag = true
            for k, v in pairs(G.playing_cards) do
                if v:is_face() then
                    flag = false
                end
            end
            if flag then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
    end
}