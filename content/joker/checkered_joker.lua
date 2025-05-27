SMODS.Joker {
    key = "checkered_joker",
    loc_txt = {
        name = "Checkered Deck Joker",
        text = {
            "Retrigger each",
            "played {V:1}#1#{} card",
            "{s:0.8}suit swaps at end of round"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Checkered Deck"
        }
    },
    config = {
        extra = {
            triggers = 1,
            current_suit = "Spades"
        }
    },
    rarity = 3,
    pos = { x = 4, y = 1 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_checkered"},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(card.ability.extra.current_suit, "suits_singular"),
                colours = {
                    G.C.SUITS[card.ability.extra.current_suit]
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round then
            if card.ability.extra.current_suit == "Spades" then
                card.ability.extra.current_suit = "Hearts"
            else
                card.ability.extra.current_suit = "Spades"
            end
        end

        if self.debuff then return end
        if context.repetition and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.current_suit) then
                return {
                    repetitions = card.ability.extra.triggers
                }
            end
        end
    end
}