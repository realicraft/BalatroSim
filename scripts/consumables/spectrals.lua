SMODS.Consumable {
	set = "Spectral",
	key = "revert",
	pos = { x = 2, y = 3 },
	config = { max_highlighted = 1 },
	atlas = "bs_consumables",
	loc_vars = function(self, info_queue)
		return { vars = {self.config.max_highlighted} }
	end,
    can_use = function(self, card)
        if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= self.config.max_highlighted) then
            return true
        end
	end,
    cost = 6,
    use = function(self, card, area, copier)
        for _,v in ipairs(G.hand.cards) do
			if v.highlighted then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        v:set_ability(G.P_CENTERS.c_base) -- remove enhancement
                        v:set_seal(nil, nil, true) -- remove seal
                        v:set_edition(nil, true) -- remove edition
                            for key,val in pairs(v.ability) do -- remove stickers
                                if SMODS.Sticker.obj_table[key] and val then
                                    v.ability.key = nil
                                end
                            end
                        v:juice_up(0.3, 0.4)
                        play_sound('tarot2')
                        return true
                    end
                }))
			end
		end
	end,
}