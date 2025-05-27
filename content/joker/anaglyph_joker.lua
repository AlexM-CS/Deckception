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
        if context.end_of_round and not context.game_over and context.main_eval and G.GAME.blind.boss then
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