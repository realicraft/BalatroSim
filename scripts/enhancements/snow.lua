SMODS.Enhancement {
    key = 'snow',
    config = {extra = {bonus_chips = 15, mult = -1}},
    atlas = 'bs_enhancements',
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = {
            card and card.ability.extra.bonus_chips or self.ability.extra.bonus_chips,
            card and card.ability.extra.mult or self.ability.extra.mult
        }}
    end,
    calculate = function(self, card, context, effect)
        if context.cardarea == G.play and context.main_scoring then
			if (#(SMODS.find_card("j_bs_rc_snow_storm", false)) >= 1) then -- if snow storm is present...
				local highest = 0
				for k,v in pairs((SMODS.find_card("j_bs_rc_snow_storm", false))) do
					highest = math.max(highest, v.ability.extra.chips_per) -- ...find the highest chips per ante...
				end
				return {
					chips = highest * G.GAME.round_resets.ante, -- ...and return it, times the current ante
					mult = card.ability.extra.mult
				}
			else
				return { -- no snow storm
					chips = card.ability.extra.bonus_chips,
					mult = card.ability.extra.mult
				}
			end
        end
    end
}

SMODS.Consumable {
	set = "item",
	key = "snowball",
	pos = { x = 0, y = 0 },
	config = { mod_conv = "m_bs_rc_snow", max_highlighted = 2 },
	atlas = "bs_consumables",
	cost = 4,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_snow

		return { vars = { self.config.max_highlighted } }
	end,
}

SMODS.Consumable {
	set = "Spectral",
	key = "snowgrave",
	pos = { x = 1, y = 3 },
	config = { mod_conv = "m_bs_rc_snow"},
	atlas = "bs_consumables",
	cost = 8,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_snow

		return { vars = {} }
	end,
    can_use = function(self, card)
		-- borrowed from UnStable (specifically https://github.com/kirbio/UnStable/blob/main/Unstable.lua#L2844C4-L2844C113 )
		return G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL
	end,
    -- borrowed from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/Items/CodeCards.lua#L352C2-L393C6 )
    use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("tarot1")
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		for i = 1, #G.hand.cards do
			local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.cards[i]:flip()
					play_sound("card1", percent)
					G.hand.cards[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		delay(0.2)
		for i = 1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					CARD:flip()
					CARD:set_ability(G.P_CENTERS.m_bs_rc_snow)
					play_sound("tarot2", percent)
					CARD:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
	end,
}

SMODS.Joker {
    key = 'snow_shovel',
    config = { extra = { chip_inc = 30, mult_inc = 1, chips = 0, mult = 0 } },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_snow
        return { vars = { card.ability.extra.chip_inc, card.ability.extra.mult_inc, card.ability.extra.chips, card.ability.extra.mult } }
    end,
    rarity = 2,
    atlas = 'bs_jokers',
    pos = { x = 2, y = 1 },
    cost = 6,
	blueprint_compat = true,
	calculate = function(self, card, context)
        if (
            context.before -- trigger before scoring
            and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker -- but not with blueprint
        ) then
            for k,v in ipairs(context.scoring_hand) do
                if (v.config.center.key == "m_bs_rc_snow") then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_inc
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_inc
					v:flip() -- ...and convert it to on-fire
                    v:set_ability(G.P_CENTERS.c_base)
                    v:flip()
					SMODS.calculate_effect({message = localize("bs_rc_notice_snow_shovel")}, v) -- Shoveled!
                    --[[G.E_MANAGER:add_event(Event({ -- remove snow-covered
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            v:flip()
                            v:set_ability(G.P_CENTERS.c_base)
                            play_sound("tarot2", 1)
                            SMODS.calculate_effect({message = localize("bs_rc_notice_snow_shovel")}, v) -- Shoveled!
                            return true
                        end,
                    }))--]]
                end
            end
        end
        if context.joker_main then
            return {
				chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
            }
        end
    end
}

SMODS.Joker {
    key = 'snow_storm',
    config = { extra = { chips_per = 8 } },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_snow
        return { vars = { card.ability.extra.chips_per, card.ability.extra.chips_per*G.GAME.round_resets.ante } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 3, y = 1 },
    cost = 7,
	-- passive - no calaculate function
}