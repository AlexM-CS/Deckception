SMODS.Joker {
    key = "plasma_joker",
    loc_txt = {
        name = "Plasma Deck Joker",
        text = {
            "Balance {C:blue}Chips{} and",
            "{C:red}Mult{} when calculating",
            "score for played hand",
            "{C:inactive}(On Plasma Deck, gives",
            "{X:red,C:white}X#1#{}{C:inactive} Mult)"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Plasma Deck"
        }
    },
    config = {
        extra = {
            Xmult = 3
        }
    },
    rarity = 3,
    pos = { x = 3, y = 2 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_plasma"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if G.GAME.selected_back:get_name() == "Plasma Deck" then
            if context.joker_main then
                return {
                    x_mult = card.ability.extra.Xmult
                }
            end
        else
            if context.final_scoring_step then
                return {
                    balance = true
                }
            end
        end
    end
}