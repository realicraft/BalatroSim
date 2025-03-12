SMODS.Enhancement {
    key = 'fire',
    config = {extra = {
        xmult = 1, xmult_inc = 0.2, cap = 2,
        gymboost = "hmult" -- mintymod compat
    }},
    atlas = 'bs_enhancements',
    pos = { x = 3, y = 1 },
    loc_vars = function(self, info_queue, card)
        return {vars = {
            card and card.ability.extra.xmult or self.ability.extra.xmult,
            card and card.ability.extra.xmult_inc or self.ability.extra.xmult_inc,
            card and card.ability.extra.cap or self.ability.extra.cap
        }}
    end,
    calculate = function(self, card, context, effect)
        if context.cardarea == G.play and context.main_scoring and not context.repetition then -- only increment once per hand
            --print(tprint(card, 4))
            if not (card.ability.extra.xmult >= card.ability.extra.cap - card.ability.extra.xmult_inc) then -- don't increment past the cap
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_inc
            end
            return {
                x_mult = card.ability.extra.xmult
            }
        end
        if context.cardarea == G.play and context.main_scoring then
            return {
                x_mult = card.ability.extra.xmult
            }
        end
        if context.destroy_card and context.cardarea == G.play then
            if (card.ability.extra.xmult >= card.ability.extra.cap - card.ability.extra.xmult_inc) then -- remove if cap has been reached
                if not (#(SMODS.find_card("bs_rc_fireproof_joker", false)) >= 1) then -- don't remove if you have fireproof joker
                    return {
                        remove = true
                    }
                end
            end
        end
    end
}

SMODS.Consumable {
	set = "item",
	key = "lamp_oil",
	pos = { x = 2, y = 0 },
	config = { mod_conv = "m_bs_rc_fire", max_highlighted = 2 },
	atlas = "bs_consumables",
    cost = 4,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_fire

		return { vars = { self.config.max_highlighted } }
	end,
}

SMODS.Joker {
    key = 'fireproof_joker',
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_fire
        return { vars = {} }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 4, y = 1 },
    cost = 7,
    -- passive - no calaculate function
}

SMODS.Joker {
    key = 'extinguisher',
    config = { extra = { Xmult_inc = 0.15, Xmult = 1} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_fire
        return { vars = { card.ability.extra.Xmult_inc, card.ability.extra.Xmult } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 5, y = 1 },
    cost = 6,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if (
            context.before -- trigger before scoring
            and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker -- but not with blueprint
        ) then
            for k,v in ipairs(context.scoring_hand) do
                if (v.config.center.key == "m_bs_rc_fire") then
                    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_inc
                    v:flip() -- ...and convert it to on-fire
                    v:set_ability(G.P_CENTERS.c_base)
                    v:flip()
                    SMODS.calculate_effect({message = localize("bs_rc_notice_extinguish")}, v) -- Extinguished!
                    --[[G.E_MANAGER:add_event(Event({ -- remove on-fire
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            v:flip()
                            v:set_ability(G.P_CENTERS.c_base)
                            play_sound("tarot2", 1)
                            SMODS.calculate_effect({message = localize("bs_rc_notice_extinguish")}, v) -- Extinguished!
                            return true
                        end,
                    }))--]]
                end
            end
        end
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
            }
        end
    end
}

SMODS.Joker {
    key = 'heatwave',
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_fire
        return { vars = {  } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 0, y = 2 },
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if (context.before) then
            local valid = {}
            for k,v in ipairs(context.scoring_hand) do
                if (v.config.center.key == "c_base") then -- if the card is unenhanced...
                    valid[#valid+1] = v -- ...add it to the list of valid cards
                end
            end
            if #valid > 0 then -- if there are any valid cards...
                local target = pseudorandom_element(valid, pseudoseed("heatwave")) -- ...then pick one at random...
                target:flip() -- ...and convert it to on-fire
                target:set_ability(G.P_CENTERS.m_bs_rc_fire)
                target:flip()
                SMODS.calculate_effect({message = localize("bs_rc_notice_heatwave")}, target) -- Enflamed!
                --[[G.E_MANAGER:add_event(Event({ -- ...and convert it to on-fire
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        target:flip()
                        target:set_ability(G.P_CENTERS.m_bs_rc_fire)
                        play_sound("tarot2", 1)
                        SMODS.calculate_effect({message = localize("bs_rc_notice_heatwave")}, target) -- Enflamed!
                        return true
                    end,
                }))--]]
            end
        end
    end
}