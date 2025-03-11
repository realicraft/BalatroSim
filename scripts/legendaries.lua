if (not next(SMODS.find_mod("cryptid"))) then -- if cryptid isn't installed...
    -- ...then steal the food joker pool
    -- yoinked straight from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/lib/content.lua#L285C1-L302C3 )
    SMODS.ObjectType({
        key = "Food",
        default = "j_reserved_parking",
        cards = {},
        inject = function(self)
            SMODS.ObjectType.inject(self)
            -- insert base game food jokers
            self:inject_card(G.P_CENTERS.j_gros_michel)
            self:inject_card(G.P_CENTERS.j_egg)
            self:inject_card(G.P_CENTERS.j_ice_cream)
            self:inject_card(G.P_CENTERS.j_cavendish)
            self:inject_card(G.P_CENTERS.j_turtle_bean)
            self:inject_card(G.P_CENTERS.j_diet_cola)
            self:inject_card(G.P_CENTERS.j_popcorn)
            self:inject_card(G.P_CENTERS.j_ramen)
            self:inject_card(G.P_CENTERS.j_selzer)
        end,
    })
    -- end yoink
end

SMODS.Joker {
    key = 'hank',
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    rarity = 4,
    atlas = 'bs_legendaries',
    pos = { x = 0, y = 0 },
    soul_pos = {x = 0, y = 1},
    cost = 20,
    unlocked = false,
    discovered = false,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local c = SMODS.create_card({set = "Food", area = G.jokers, key_append = "hank_food"})
                    c:add_to_deck()
                    G.jokers:emplace(c)
                    return true
                end
            }))
        end
    end
}