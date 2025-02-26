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

SMODS.Consumable {
	set = "item",
	key = "glove",
	pos = { x = 5, y = 0 },
	config = { hands = 2 },
	atlas = "consumeables",
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
	atlas = "consumeables",
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
	atlas = "consumeables",
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
	atlas = "consumeables",
	loc_vars = function(self, info_queue)
		return { vars = { self.config.chip } }
	end,
	can_use = function(self, card)
		-- borrowed from UnStable (specifically https://github.com/kirbio/UnStable/blob/main/Unstable.lua#L2844C4-L2844C113 )
		return G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack
	end,
	use = function(self, card, area, copier)
		-- borrowed from Codex Arcanum (specifically https://github.com/itayfeder/Codex-Arcanum/blob/main/mod/data/CA_Alchemicals.lua#L63C9-L65C28 )
		G.E_MANAGER:add_event(Event(
			{
				trigger = 'ease',
				delay = 0.1,
				ref_table = G.GAME,
				ref_value = "chips",
				ease_to = G.GAME.chips + card.ability.chip,
			}
		))
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
	atlas = "consumeables",
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
	atlas = "consumeables",
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