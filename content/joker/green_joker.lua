SMODS.Joker {
    key = "green_joker",
    loc_txt = {
        name = "Green Deck Joker",
        text = {
            "Earn {C:money}$#1#{} per remaining {C:blue}Hand{} and",
            "{C:money}$#2#{} per remaining {C:red}Discard",
            "at end of round"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Green Deck"
        }
    },
    config = {
        extra = {
            hand_bonus = 2,
            discard_bonus = 1
        }
    },
    rarity = 3,
    pos = { x = 3, y = 0 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hand_bonus,
                card.ability.extra.discard_bonus
            }
        }
    end,

    add_to_deck = function(self, card)
        G.GAME.modifiers.money_per_hand = card.ability.extra.hand_bonus
        G.GAME.modifiers.money_per_discard = card.ability.extra.discard_bonus
    end
}