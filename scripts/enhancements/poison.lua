SMODS.Enhancement {
    key = 'poison',
    config = {extra = {bonus_chips = 20, Xmult = 0.9, recover = 8, destroy = 12}},
    atlas = 'bs_enhancements',
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = {
            card and card.ability.extra.bonus_chips or self.ability.extra.bonus_chips,
            card and card.ability.extra.Xmult or self.ability.extra.Xmult,
            G.GAME and G.GAME.probabilities.normal or 1,
            card and card.ability.extra.recover or self.ability.extra.recover,
            G.GAME and G.GAME.probabilities.normal or 1,
            card and card.ability.extra.destroy or self.ability.extra.destroy,
        }}
    end,
    calculate = function(self, card, context, effect)
        if context.cardarea == G.play and context.main_scoring then
            local extra_chips = 0
            if (#(SMODS.find_card("j_bs_rc_poisoned_joker", false)) >= 1) then -- if poisoned joker is present...
                for k,v in pairs((SMODS.find_card("j_bs_rc_poisoned_joker", false))) do
					extra_chips = math.max(extra_chips, v.ability.extra.extra_chips) -- ...find the highest extra chips
				end
            end
            SMODS.calculate_effect({
                chips = card.ability.extra.bonus_chips + extra_chips
            }, card)
            return {
                xmult = card.ability.extra.Xmult
            }
        end
        if context.cardarea == G.play and context.after then
            if pseudorandom('enhance_poison_cure') < ((G.GAME and G.GAME.probabilities.normal or 1) / card.ability.extra.recover) then
                card:set_ability(G.P_CENTERS.c_base)
                return {
                    message = localize("bs_rc_notice_poison_cure"),
                    color = G.C.PURPLE
                }
            end
        end
        if context.destroy_card and context.cardarea == G.play then
            if pseudorandom('enhance_poison_destroy') < ((G.GAME and G.GAME.probabilities.normal or 1) / card.ability.extra.destroy) then
                return {
                    remove = true
                }
            end
        end
    end
}

SMODS.Consumable {
	set = "item",
	key = "poison_vial",
	pos = { x = 1, y = 1 },
	config = { mod_conv = "m_bs_rc_poison", max_highlighted = 2 },
	atlas = "bs_consumables",
    cost = 4,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_poison

		return { vars = { self.config.max_highlighted } }
	end,
}

SMODS.Joker {
    key = 'poison_berries',
    config = { extra = { remaining = 3 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_poison
        return { vars = { math.floor(card.ability.extra.remaining) } }
    end,
    rarity = 2,
    atlas = 'bs_jokers',
    pos = { x = 1, y = 2 },
    cost = 5,
    eternal_compat = false,
    blueprint_compat = true,
    pools = {
        Food = true
    },
    calculate = function(self, card, context)
        if context.before then
            local valid = {}
            for k,v in ipairs(context.scoring_hand) do
                if (v.config.center.key == "c_base") then -- if the card is unenhanced...
                    valid[#valid+1] = v -- ...add it to the list of valid cards
                end
            end
            if #valid > 0 then -- if there are any valid cards...
                local target = pseudorandom_element(valid, pseudoseed("poison_berries")) -- ...then pick one at random...
                target:set_ability(G.P_CENTERS.m_bs_rc_poison)-- ...and convert it to poisoned
                SMODS.calculate_effect({message = localize("bs_rc_notice_poisoned")}, target) -- Poisoned!
            end
        end
        if context.after and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker then
            card.ability.extra.remaining = card.ability.extra.remaining - 1
            if card.ability.extra.remaining <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end}))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            end
        end
    end,
}

SMODS.Joker {
    key = 'poisoned_joker',
    config = { extra = { extra_chips = 50 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bs_rc_poison
        return { vars = { math.floor(card.ability.extra.extra_chips) } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 2, y = 2 },
    cost = 7,
    -- passive - no calaculate function
}