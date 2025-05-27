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