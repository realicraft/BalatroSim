SMODS.ConsumableType {
	key = "item",
	primary_colour = HEX("7f7f7f"),
	secondary_colour = HEX("9f9f9f"),
	collection_rows = { 4, 4 },
	shop_rate = 1,
	default = "c_bs_rc_chip",
	can_stack = true,
	can_divide = true,
}

SMODS.UndiscoveredSprite {
	key = "item",
	atlas = 'bs_consumables',
	pos = { x = 0, y = 5 },
	overlay_pos = { x = 1, y = 5 },
}

SMODS.Consumable {
	set = "item",
	key = "glove",
	pos = { x = 5, y = 0 },
	config = { hands = 2 },
	atlas = 'bs_consumables',
	cost = 4,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.hands } }
	end,
	can_use = function(self, card)
		-- borrowed from UnStable (specifically https://github.com/kirbio/UnStable/blob/main/Unstable.lua#L2844C4-L2844C113 )
		return G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack
	end,
	use = function(self, card, area, copier)
		-- borrowed from Codex Arcanum (specifically https://github.com/itayfeder/Codex-Arcanum/blob/main/mod/data/CA_Alchemicals.lua#L63C9-L65C28 )
		G.E_MANAGER:add_event(Event(
			{trigger = 'after', delay = 0.1, func = function()
				ease_hands_played(card.ability.hands)
				return true
				end
			}
		))
	end
}

SMODS.Consumable {
	set = "item",
	key = "trash_can",
	pos = { x = 6, y = 0 },
	config = { discards = 2 },
	atlas = 'bs_consumables',
	cost = 4,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.discards } }
	end,
	can_use = function(self, card)
		-- borrowed from UnStable (specifically https://github.com/kirbio/UnStable/blob/main/Unstable.lua#L2844C4-L2844C113 )
		return G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack
	end,
	use = function(self, card, area, copier)
		-- borrowed from Codex Arcanum (specifically https://github.com/itayfeder/Codex-Arcanum/blob/main/mod/data/CA_Alchemicals.lua#L63C9-L65C28 )
		G.E_MANAGER:add_event(Event(
			{trigger = 'after', delay = 0.1, func = function()
				ease_discard(card.ability.discards)
				return true
				end
			}
		))
	end
}

SMODS.Consumable {
	set = "Spectral",
	key = "time_candy",
	pos = { x = 9, y = 1 },
	config = {},
	cost = 7,
	atlas = 'bs_consumables',
	hidden = "true",
	soul_set = "item",
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		ease_ante(-1)
	end
}

SMODS.Consumable {
	set = "item",
	key = "chip",
	pos = { x = 7, y = 0 },
	config = { chip = 1 },
	atlas = 'bs_consumables',
	cost = 1,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.chip } }
	end,
	can_use = function(self, card)
		return BalatroSim:blind_active()
	end,
	use = function(self, card, area, copier)
		BalatroSim:damage_blind(true, 1, 0.1)
	end,
	in_pool = function(self, args)
		return pseudorandom('chip_spawn') < 0.01, { allow_duplicates = false } -- very rare
	end
}

SMODS.Consumable {
	set = "item",
	key = "killbind",
	pos = { x = 9, y = 0 },
	config = {  },
	atlas = 'bs_consumables',
	cost = 1,
	loc_vars = function(self, info_queue)
		return { vars = {  } }
	end,
	can_use = function(self, card)
		-- borrowed from UnStable (specifically https://github.com/kirbio/UnStable/blob/main/Unstable.lua#L2844C4-L2844C113 )
		return G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack
	end,
	use = function(self, card, area, copier)
		-- borrowed from LobotomyCorp (specifically https://github.com/Mysthaps/LobotomyCorp/blob/main/indiv_jokers/punishing_bird.lua#L48C13-L54C37 )
		G.STATE = G.STATES.GAME_OVER
		if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
			G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
		end
		G:save_settings()
		G.FILE_HANDLER.force = true
		G.STATE_COMPLETE = false
	end,
	in_pool = function(self, args)
		return pseudorandom('killbind_spawn') < 0.05, { allow_duplicates = false } -- quite rare
	end
}

SMODS.Consumable {
	set = "item",
	key = "exp_bottle",
	pos = { x = 0, y = 1 },
	config = { hand_types = 3 },
	atlas = 'bs_consumables',
	cost = 5,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.hand_types } }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		local hands = {}
		-- borrowed from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/Items/Planets.lua#L830C1-L853C4 )
		local chosen_hand
		while (#hands < self.config.hand_types) do
			chosen_hand = pseudorandom_element(G.handlist, pseudoseed("expbottle"))
			if G.GAME.hands[chosen_hand].visible then
				table.insert(hands, chosen_hand)
			end
		end
		-- also borrowed from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/Items/Planets.lua#L811C1-L829C4 )
		for _, v in pairs(hands) do
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
				{
					handname = localize(v, "poker_hands"),
					chips = G.GAME.hands[v].chips,
					mult = G.GAME.hands[v].mult,
					level = G.GAME.hands[v].level,
				}
			)
			level_up_hand(used_consumable, v, nil, 1)
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	in_pool = function(self, args)
		return pseudorandom('expbottle_spawn') < 0.1, { allow_duplicates = false } -- quite rare
	end
}

BalatroSim.BadEnhancements = {
	-- balatrosim --
	"m_bs_rc_poison",
	"m_bs_rc_paralyzed",
	-- unstable --
	"m_unstb_radioactive",
	"m_unstb_biohazard",
	"m_unstb_poison"
}

--- @param enhance string
function BalatroSim.BadEnhancements:add_enhance(enhance)
    table.insert(self, enhance)
end

--- @param cards table
local function allBad(cards)
	for _,v in ipairs(cards) do
		local isbad = false
		for _,e in ipairs(BalatroSim.BadEnhancements) do
			if v.config.center.key == e then
				isbad = true
			end
		end
		if not isbad then
			return false
		end
	end
	return true
end

SMODS.Consumable {
	set = "item",
	key = "heal_potion",
	pos = { x = 3, y = 1 },
	config = { max_highlighted = 2 },
	atlas = 'bs_consumables',
	cost = 4,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.max_highlighted } }
	end,
	can_use = function(self, card)
        if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= self.config.max_highlighted) and allBad(G.hand.highlighted) then
            return true
        end
    end,
	use = function(self, card, area, copier)
		for _,v in ipairs(G.hand.cards) do
			if v.highlighted then
				for _,e in ipairs(BalatroSim.BadEnhancements) do
					if v.config.center.key == e then -- only heal "bad" enhancements
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.5,
							func = function()
								v:set_ability(G.P_CENTERS.c_base)
								v:juice_up(0.3, 0.4)
								play_sound('tarot2')
								return true
							end
						}))
					end
				end
			end
		end
	end,
	in_pool = function(self, args)
		return pseudorandom('healpotion_spawn') < 0.25, { allow_duplicates = false } -- uncommon
	end
}

SMODS.Consumable {
	set = "item",
	key = "wallet",
	pos = { x = 4, y = 1 },
	config = { base = 5, mul = 4 },
	atlas = 'bs_consumables',
	cost = 5,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.base-1, self.config.base+self.config.mul-1 } }
	end,
	can_use = function(self, card)
        return true
    end,
	use = function(self, card, area, copier)
		local coins = self.config.base + math.floor(pseudorandom('wallet')*self.config.mul)
		ease_dollars(coins)
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + coins
        G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
	end,
}

SMODS.Consumable {
	set = "item",
	key = "sword",
	pos = { x = 8, y = 0 },
	config = { percent = 30 },
	atlas = 'bs_consumables',
	cost = 4,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.percent } }
	end,
	can_use = function(self, card)
		return BalatroSim:blind_active()
	end,
	use = function(self, card, area, copier)
		BalatroSim:damage_blind(false, self.config.percent, 0.6 * math.sqrt(G.SETTINGS.GAMESPEED))
	end,
	in_pool = function(self, args)
		return pseudorandom('sword_spawn') < 0.5, { allow_duplicates = false }
	end
}

SMODS.Consumable {
	set = "item",
	key = "gun",
	pos = { x = 5, y = 1 },
	config = { percent = 50 },
	atlas = 'bs_consumables',
	cost = 6,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.percent } }
	end,
	can_use = function(self, card)
		return BalatroSim:blind_active() and BalatroSim:has_item("c_bs_rc_bullet", G.consumeables)
	end,
	use = function(self, card, area, copier)
		play_sound("bs_rc_gun_shoot")
		BalatroSim:damage_blind(false, self.config.percent, 0.3 * math.sqrt(G.SETTINGS.GAMESPEED))
		for _,v in pairs(G.consumeables.cards) do
			if v.config.center.key == "c_bs_rc_bullet" then
				v:start_dissolve()
				break
			end
		end
	end,
	in_pool = function(self, args)
		return BalatroSim:has_item("c_bs_rc_bullet", G.consumeables) and true or (pseudorandom('gun_spawn') < 0.35), { allow_duplicates = false }
	end
}

SMODS.Consumable {
	set = "item",
	key = "bullet",
	pos = { x = 6, y = 1 },
	config = {  },
	atlas = 'bs_consumables',
	cost = 2,
	loc_vars = function(self, info_queue)
		return { vars = {  } }
	end,
	can_use = function(self, card)
		return false
	end,
	use = function(self, card, area, copier)
		error("somehow used a bullet")
	end,
	in_pool = function(self, args)
		return BalatroSim:has_item("c_bs_rc_gun", G.consumeables) and true or (pseudorandom('bullet_spawn') < 0.5), { allow_duplicates = false }
	end
}