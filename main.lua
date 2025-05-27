--- STEAMODDED HEADER
--- MOD NAME: Deckception
--- MOD_ID: Deckception
--- MOD_AUTHOR: [Jedi]
--- MOD_DESCRIPTION: Adds 15 new Jokers based on the 15 playable decks!
--- MOD_VERSION: 1.0.0
--- MOD_SITE: https://github.com/AlexM-CS/Deckception
--- PREFIX: deckception

SMODS.Atlas {
    key = "jokers",
    px = 71,
    py = 95,
    path = "Jokers.png"
}

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

SMODS.Joker {
    key = "magic_joker",
    loc_txt = {
        name = "Magic Deck Joker",
        text = {
            "Create a copy of {C:purple}The Fool{} card",
            "when {C:attention}Blind{} is selected",
            "{C:inactive}(Must have room)"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Magic Deck"
        }
    },
    config = {
    },
    rarity = 3,
    pos = { x = 0, y = 1 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_magic"},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card {
                                        key = "c_fool",
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                                context.blueprint_card or card)
                            return true
                        end)
                    }))
                end
            }
        end
    end
}

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

SMODS.Joker {
    key = "ghost_joker",
    loc_txt = {
        name = "Ghost Deck Joker",
        text = {
            "{C:blue}Spectral{} cards may",
            "appear in the shop",
            "{C:inactive}(Chance increased on Ghost Deck)"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Ghost Deck"
        }
    },
    config = {
        extra = {
            spectral_rate = 2
        }
    },
    rarity = 3,
    pos = { x = 2, y = 1 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_ghost"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.spectral_rate
            }
        }
    end,

    add_to_deck = function(self, card)
        G.GAME.spectral_rate = G.GAME.spectral_rate + card.ability.extra.spectral_rate
    end,

    remove_from_deck = function(self, card)
        G.GAME.spectral_rate = G.GAME.spectral_rate - card.ability.extra.spectral_rate
    end
}

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

    face_tally = function()
        for k, v in pairs(G.playing_cards) do
            if v:is_face() then
                return false
            end
        end
        return true
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

SMODS.Joker {
    key = "zodiac_joker",
    loc_txt = {
        name = "Zodiac Deck Joker",
        text = {
            "{C:purple}Tarot{} and {C:planet}Planet",
            "cards in the shop are {C:attention}free"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Zodiac Deck"
        }
    },
    config = {
    },
    rarity = 3,
    pos = { x = 0, y = 2 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_zodiac"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    add_to_deck = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then
                        v:set_cost()
                    end
                end
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then
                        v:set_cost()
                    end
                end
                return true
            end
        }))
    end
}

local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    if next(SMODS.find_card("j_deckception_zodiac_joker")) then
        if (self.ability.set == "Tarot" or self.ability.set == "Planet") then self.cost = 0 end
        self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
        self.sell_cost_label = self.facing == "back" and "?" or self.sell_cost
    end
end

SMODS.Joker {
    key = "painted_joker",
    loc_txt = {
        name = "Painted Deck Joker",
        text = {
            "{C:attention}+#1#{} hand size"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Painted Deck"
        }
    },
    config = {
        extra = {
            h_size = 3
        }
    },
    rarity = 3,
    pos = { x = 1, y = 2 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_painted"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card)
        G.hand:change_size(card.ability.extra.h_size)
    end,

    remove_from_deck = function(self, card)
        G.hand:change_size(-card.ability.extra.h_size)
    end
}

SMODS.Joker {
    key = "anaglyph_joker",
    loc_txt = {
        name = "Anaglyph Deck Joker",
        text = {
            "After defeating each",
            "{C:attention}Boss Blind{}, gain a",
            "{C:attention}Double Tag"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Anaglyph Deck"
        }
    },
    config = {
    },
    rarity = 3,
    pos = { x = 2, y = 2 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_anaglyph"},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag(Tag("tag_double"))
                    play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
                    play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
        end
    end
}

SMODS.Joker {
    key = "plasma_joker",
    loc_txt = {
        name = "Plasma Deck Joker",
        text = {
            "Balance {C:blue}Chips{} and",
            "{C:red}Mult{} when calculating",
            "score for played hand"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Plasma Deck"
        }
    },
    
}

SMODS.Joker {
    key = "erratic_joker",
    loc_txt = {
        name = "Erratic Deck Joker",
        text = {
            "Uniformly randomize the",
            "{C:attention}suit{} and {C:attention}rank{} of scored cards",
            "after hand is scored"
        },
        unlock = {
            "Win a run with the",
            "{C:attention}Erratic Deck"
        }
    },
    
}