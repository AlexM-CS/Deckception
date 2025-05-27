SMODS.Joker {
    key = "nebula_joker",
    loc_txt = {
        name = "Nebula Deck Joker",
        text = {
            "{C:planet}Planet{} cards in your",
            "{C:attention}consumable{} area give",
            "{X:red,C:white} X#1# {} Mult for their",
            "specified {C:attention}poker hand"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Nebula Deck"
        }
    },
    config = {
        extra = {
            xmult = 1.5
        }
    },
    rarity = 3,
    pos = { x = 1, y = 1 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_nebula"},
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
        if context.other_consumeable and context.other_consumeable.ability.set == "Planet" and context.other_consumeable.ability.consumeable.hand_type == context.scoring_name then
            return {
                x_mult = card.ability.extra.xmult,
                message_card = context.other_consumable
            }
        end
    end
}