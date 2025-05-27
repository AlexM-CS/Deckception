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
    rarity = 3,
    pos = { x = 4, y = 2 },
    atlas = "jokers",
    cost = 8,
    unlocked = false,
    unlock_condition = {type = "win_deck", deck = "b_erratic"},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after then
            local _suit = pseudorandom_element({"Spades", "Hearts", "Clubs", "Diamonds"}, pseudoseed("err"))
            local _rank = math.random(2, 14)
            for i = 1, #context.scoring_hand do
                G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.1, func = function()
                    local _card = context.scoring_hand[i]
                    _card:flip()
                    local suit_prefix = string.sub(_suit, 1, 1).."_"
                    local rank_suffix = _rank
                    if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
                    elseif rank_suffix == 10 then rank_suffix = "T"
                    elseif rank_suffix == 11 then rank_suffix = "J"
                    elseif rank_suffix == 12 then rank_suffix = "Q"
                    elseif rank_suffix == 13 then rank_suffix = "K"
                    elseif rank_suffix == 14 then rank_suffix = "A"
                    end
                    _card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                    _card:flip()
                return true end }))
            end
            delay(1.5)
        end
    end
}