-- partially based off of Cryptid's flickering ( https://github.com/MathIsFun0/Cryptid/blob/main/items/spooky.lua#L745 )
SMODS.Sticker {
    key = "markedfordeath",
    atlas = "bs_stickers",
    pos = { x = 1, y = 0 },
    badge_colour = HEX("9E4D50"),
    default_compat = true,
    loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "bs_rc_markedfordeath_consumeable", vars = { card.ability.turns_left or 2 } }
		elseif card.ability.set == "Voucher" then
			return { key = "bs_rc_markedfordeath_voucher", vars = { card.ability.turns_left or 8 } }
		elseif card.ability.set == "Booster" then
			return { key = "bs_rc_markedfordeath_booster" }
		elseif card.ability.set == "Joker" then
			return { key = "bs_rc_markedfordeath_joker", vars = { card.ability.turns_left or 3 } }
		else
			return { vars = { card.ability.turns_left or 3 } }
		end
	end,
    apply = function(self, card, val)
		if not card.ability.eternal then
			card.ability[self.key] = val
			if card.ability[self.key] then
				if card.ability.consumeable then
					card.ability.turns_left = 2
				elseif card.ability.set == "Voucher" then
					card.ability.turns_left = 8
					card.ability.went_down = false -- not sure why it keeps going down extra times
				else
					card.ability.turns_left = 3
				end
			end
		end
	end,
    calculate = function(self, card, context)
		if not card.ability.turns_left then
			if card.ability.consumeable then
				card.ability.turns_left = 2
			elseif card.ability.set == "Voucher" then
				card.ability.turns_left = 8
				card.ability.went_down = false
			else
				card.ability.turns_left = 3
			end
		end
		if context.before and card.ability.went_down then
			card.ability.went_down = false
		end
		if ((card.ability.consumeable or card.ability.set == "Joker" or card.ability.set == "Default" or card.ability.set == "Enhanced") and not card.debuff) and not context.repetition then
			if context.before and context.cardarea == G.play then
				if card.ability.turns_left <= 1 then
					SMODS.calculate_effect({message = localize("bs_rc_notice_mfd_expire"), color = G.C.RED}, card)
				end
			end
			if context.after and context.cardarea == G.play then
				card.ability.turns_left = card.ability.turns_left - 1
			end
			if context.destroy_card and context.cardarea == G.play then
				if card.ability.turns_left <= 0.1 then
					return {remove = true}
				end
			end
		end
		if (card.ability.set == "Voucher") and context.end_of_round and not card.ability.went_down then -- vouchers - only possible with cryptid's sticker deck
			card.ability.turns_left = card.ability.turns_left - 1
			card.ability.went_down = true
			if card.ability.turns_left <= 0 then
				-- yoinked straight from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/4bf6e38dddd4465597959ef50686c01c1f04edb5/lib/modifiers.lua#L713C6-L748C9 )
				card.ability.turns_left = 999 -- keep it from unredeeming itself multiple times
				local area
				if G.STATE == G.STATES.HAND_PLAYED then
					if not G.redeemed_vouchers_during_hand then
						G.redeemed_vouchers_during_hand = CardArea(
							G.play.T.x,
							G.play.T.y,
							G.play.T.w,
							G.play.T.h,
							{ type = "play", card_limit = 5 }
						)
					end
					area = G.redeemed_vouchers_during_hand
				else
					area = G.play
				end

				local _card = copy_card(card)
				_card.ability.extra = copy_table(card.ability.extra)
				if _card.facing == "back" then
					_card:flip()
				end

				_card:start_materialize()
				area:emplace(_card)
				_card.cost = 0
				_card.shop_voucher = false
				_card:unredeem()
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0,
					func = function()
						_card:start_dissolve()
						card:start_dissolve()
						return true
					end,
				}))
				-- end yoink
			end
		end
	end,
}