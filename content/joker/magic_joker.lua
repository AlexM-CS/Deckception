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