SMODS.Blind {
    key = 'gana',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 0 },
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    press_play = function(self)
        ease_dollars(1)
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 1
        G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
    end
}

SMODS.Blind {
    key = 'sebu',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 1 },
    dollars = 5,
    mult = 2,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if to_big(G.GAME.dollars) == to_big(1) or to_big(G.GAME.dollars) == to_big(-1) then
            return mult, hand_chips, false
        end
        if to_big(G.GAME.dollars) < to_big(0) then
            return mult, hand_chips / (G.GAME.dollars * -1), true
        end
        if to_big(G.GAME.dollars) == to_big(0) then
            return mult, hand_chips, false
        end
        if to_big(G.GAME.dollars) > to_big(0) then
            return mult, hand_chips / G.GAME.dollars, true
        end
    end
}

SMODS.Blind {
    key = 'wepa',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 2 },
    dollars = 5,
    mult = 2,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        for k, v in ipairs(cards) do
            if pseudorandom('blind_wepa') < 1/4 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        v.ability["bs_rc_markedfordeath"] = true
                        v:juice_up(0.3, 0.4)
                        play_sound('tarot2')
                        return true
                    end,
                }))
            end
        end
        return mult, hand_chips, false
    end
}

SMODS.Blind {
    key = 'pano',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 3 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.has_alignment("", card, "bs_rc_align_plant")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'maca',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 4 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if card.area ~= G.jokers and not G.GAME.blind.disabled then
			if
				(
                    SMODS.has_enhancement(card, "m_stone")
                    or SMODS.has_enhancement(card, "m_steel")
                    or SMODS.has_enhancement(card, "m_gold")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'lana',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 5 },
    dollars = 5,
    mult = 2,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    press_play = function(self)
        ease_dollars(-2) -- remove $2 when playing hand
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - 2
        G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
    end
}

--[[SMODS.Blind { -- broken :(
    key = 'hata',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 6 },
    dollars = 5,
    mult = 3,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    after_scoring = function(self)
        SMODS.juice_up_blind()
        SMODS.calculate_effect({
            xmult = 1.2,
            remove_default_message = true
        }, ipairs(G.play.cards)[1][2])
    end
}

SMODS.Blind {
    key = 'fodo',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 7 },
    dollars = 5,
    mult = 2,
    boss = {min = 4, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    after_scoring = function(self)
        for k, v in ipairs(G.consumeables.cards) do
            SMODS.calculate_effect({xmult = 0.5}, v) -- show the Xmult on the card
        end
    end
}--]]

SMODS.Blind {
    key = 'firi',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 8 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.has_alignment("", card, "bs_rc_align_fire")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'ata',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 9 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.has_alignment("", card, "bs_rc_align_water")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'leko',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 10 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.has_alignment("", card, "bs_rc_align_electric")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'liti',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 11 },
    dollars = 5,
    mult = 2,
    boss = {min = 5, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.has_alignment("", card, "bs_rc_align_light")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'diri',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 12 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.has_alignment("", card, "bs_rc_align_dark")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'saze',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 13 },
    dollars = 5,
    mult = 5,
    boss = {min = 4, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    set_blind = function(self)
        self.hands_add = 3
        self.discards_add = 3
        ease_hands_played(self.hands_add)
        ease_discard(self.discards_add)
    end,
    disable = function(self)
        ease_hands_played(-self.hands_add)
        ease_discard(-self.discards_add)
        self.chips = self.chips/2.5
        self.chip_text = number_format(self.chips)
    end
}

--[[SMODS.Blind {
    key = 'piri',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 14 },
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    after_scoring = function(self)
        local unscored = 0
        for k, v in ipairs(G.play.cards) do
            -- how
        end
    end
}--]]

SMODS.Blind {
    key = 'fica',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 15 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
        if not G.GAME.blind.disabled then
			if (card:get_id()) and (card:get_id() < 6) then
				return true
			end
			return false
		end
    end
}

SMODS.Blind {
    key = 'ere',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 16 },
    dollars = 10,
    mult = 2,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    set_blind = function(self)
        self.hands_sub = 1
        ease_hands_played(-self.hands_sub)
    end,
    disable = function(self)
        ease_hands_played(self.hands_sub)
    end
}

SMODS.Blind {
    key = 'bufu',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 17 },
    dollars = 5,
    mult = 3,
    boss = {min = 1, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        level_up_hand(G.GAME.blind.children.animatedSprite, text, nil, 2)
        return mult, hand_chips, false -- not actually modifying the hand
    end,
}

SMODS.Blind {
    key = 'fubu',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 18 },
    dollars = 5,
    mult = 2,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        level_up_hand(G.GAME.blind.children.animatedSprite, text, nil, -2)
        return mult, hand_chips, false -- not actually modifying the hand
    end,
}

SMODS.Blind {
    key = 'citi',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 19 },
    dollars = 5,
    mult = 2,
    boss = {min = 4, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    debuff_hand = function(self, cards, hand, handname, check)
        if not G.GAME.blind.disabled then
            if not check then
                G.E_MANAGER:add_event(Event({ -- disable the blind once it's triggered
                    trigger = 'after',
                    func = (function()
                        G.GAME.blind:disable()
                        return true
                    end)
                }))
            end
            return true
        end
        return false
    end
}

SMODS.Blind {
    key = 'mero',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 20 },
    dollars = 5,
    mult = 2,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if card.area ~= G.jokers and not G.GAME.blind.disabled then
			if
				(
                    SMODS.has_enhancement(card, "m_steel")
                    or SMODS.has_enhancement(card, "m_gold")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'zesa',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 21 },
    dollars = 5,
    mult = 1.7,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    set_blind = function(self)
        self.hands_sub = 1
        self.discards_sub = 2
        ease_hands_played(-self.hands_sub)
        ease_discard(-self.discards_sub)
    end,
    disable = function(self)
        ease_hands_played(self.hands_sub)
        ease_discard(self.discards_sub)
    end
}

--[[SMODS.Blind { -- next update
    key = 'kaba',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 22 },
    dollars = 5,
    mult = 2,
    boss = {min = 5, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
}--]]

SMODS.Blind {
    key = 'toko',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 31 },
    dollars = 5,
    mult = 2,
    boss = {min = 3, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    -- borrowed from Maximus (specifically https://github.com/the-Astra/Maximus/blob/main/items/blinds/grinder.lua#L17C5-L35C8 )
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        local valid = {}
        for k, v in ipairs(G.play.cards) do
            if v.config.center.key == "c_base" then
                valid[#valid+1] = v
            end
        end
        if #valid > 0 then
            local target = pseudorandom_element(valid, pseudoseed("toko_played"))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    target:set_ability(G.P_CENTERS.m_bs_rc_poison)
                    target:juice_up(0.3, 0.4)
                    play_sound('tarot2')
                    return true
                end
            }))
            SMODS.calculate_effect({ message = localize("bs_rc_notice_poisoned") }, target)
        end
        valid = {}
        for k, v in ipairs(G.hand.cards) do
            if v.config.center.key == "c_base" then
                valid[#valid+1] = v
            end
        end
        if #valid > 0 then
            local target = pseudorandom_element(valid, pseudoseed("toko_hand"))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    target:set_ability(G.P_CENTERS.m_bs_rc_poison)
                    target:juice_up(0.3, 0.4)
                    play_sound('tarot2')
                    return true
                end
            }))
            SMODS.calculate_effect({ message = localize("bs_rc_notice_poisoned") }, target)
        end
        return mult, hand_chips, false -- not actually modifying these numbers
    end
}

SMODS.Blind {
    key = 'ifi',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 32 },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.has_alignment("", card, "bs_rc_align_ice")
                )
			then
				return true
			end
			return false
		end
	end,
}

SMODS.Blind {
    key = 'esi',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 33 },
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 99},
    boss_colour = HEX('E6E6A1'),
    bs_rc_is_glyph = true,
    set_blind = function(self)
        for k, v in ipairs(G.jokers.cards) do
            v:flip()
        end
    end,
    disable = function(self)
        for k, v in ipairs(G.jokers.cards) do
            if v.facing == 'back' then v:flip() end
        end
    end,
    defeat = function(self)
        for k, v in ipairs(G.jokers.cards) do
            if v.facing == 'back' then v:flip() end
        end
    end,
}

SMODS.Blind {
    key = 'unaligned',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 23 },
    dollars = 8,
    mult = 2,
    boss = {min = 8, max = 99, showdown = true},
    boss_colour = HEX('665247'),
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.get_alignment("", card) == "bs_rc_align_none"
                )
			then
				return true
			end
			return false
		end
	end,
    in_pool = function(self)
        return not BalatroSim.vars.deck_has_no_unaligned -- if the deck makes all cards have alignments, don't spawn this blind
    end
}

SMODS.Blind {
    key = 'energy',
    atlas = 'bs_blinds',
    pos = { x = 0, y = 24 },
    dollars = 8,
    mult = 2,
    boss = {min = 8, max = 99, showdown = true},
    boss_colour = HEX('733F59'),
    recalc_debuff = function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			if
				(
                    BalatroSim.get_alignment("", card) ~= "bs_rc_align_none"
                )
			then
				return true
			end
			return false
		end
	end,
    in_pool = function(self)
        return not BalatroSim.vars.deck_has_aligned -- if the deck starts with a large number of aligned cards, don't spawn this blind
    end
}