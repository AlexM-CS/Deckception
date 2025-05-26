--- STEAMODDED HEADER
--- MOD NAME: Deckception
--- MOD_ID: Deckception
--- MOD_AUTHOR: [Jedi]
--- MOD_DESCRIPTION: The Deckception Mod
--- MOD_VERSION: 1.0.0
--- MOD_SITE: https://github.com/AlexM-CS/Deckception

SMODS.Atlas {
    key = "jokers",
    px = 71,
    py = 95,
    path = "Jokers.png"
}

SMODS.Joker {
    key = "red_deck_joker",
    loc_txt = {
        name = "Red Deck Joker",
        text = {
            "Sell this card to",
            "permanently gain {C:red}+#1#{}",
            "discard each round"
        }
    },
    config = {discards = 1},
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
                card.ability.discards
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.blueprint then
            if context.selling_self then
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.discards
                ease_discard(card.ability.discards)
            end
        end
    end
}

SMODS.Joker {
    key = "blue_deck_joker",
    loc_txt = {
        name = "Blue Deck Joker",
        text = {
            "Sell this card to",
            "permanently gain {C:blue}+#1#{}",
            "Hand each round"
        }
    },
    config = {hands = 1},
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
                card.ability.hands
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.blueprint then
            if context.selling_self then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.hands
                ease_hands_played(card.ability.hands)
            end
        end
    end
}

SMODS.Joker {
    key = "yellow_deck_joker",
    loc_txt = {
        name = "Yellow Deck Joker",
        text = {
            "Earn {C:money}$#1#{} at",
            "end of round"
        }
    },
    config = {
        extra = {
            bonus_dollars = 10
        }
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
                card.ability.extra.bonus_dollars
            }
        }
    end,

    calc_dollar_bonus = function(self, card)
        local dollar_bonus = card.ability.bonus_dollars
        return dollar_bonus
    end
}

SMODS.Joker {
    key = "green_deck_joker",
    loc_txt = {
        name = "Green Deck Joker",
        text = {
            "Earn {C:money}$#1#{} per remaining {C:blue}Hand{} and",
            "{C:money}$#2#{} per remaining {C:red}Discard{}",
            "at end of round"
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
    unlock_condition = {type = "win_deck", deck = "b_green"},
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