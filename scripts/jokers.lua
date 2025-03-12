SMODS.Joker {
    key = 'chest',
    config = { extra = { slots = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { math.floor(card.ability.extra.slots) } }
    end,
    rarity = 2,
    atlas = 'bs_jokers',
    pos = { x = 3, y = 0 },
    cost = 6,
    add_to_deck = function(self, card, from_debuff)
        local count = math.floor(card.ability.extra.slots)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + count
    end,
    remove_from_deck = function(self, card, from_debuff)
        local count = math.floor(card.ability.extra.slots)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - count
    end,
}

SMODS.Joker {
    key = 'tray_of_cookies',
    config = { extra = { chips = 20, mult = 10, money = 2, Xmult = 1.2, remaining = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.money, card.ability.extra.Xmult, math.floor(card.ability.extra.remaining) } }
    end,
    rarity = 2,
    atlas = 'bs_jokers',
    pos = { x = 0, y = 0 },
    cost = 5,
    eternal_compat = false,
    blueprint_compat = true,
    pools = {
        Food = true
    },
    calculate = function(self, card, context)
        if context.joker_main then
            local rand = pseudorandom('tray_of_cookies')
            if rand < 0.25 then
                return {
                    chips_mod = card.ability.extra.chips,
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
                }
            end
            if rand < 0.5 then
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
            end
            if rand < 0.75 then
                ease_dollars(card.ability.extra.money)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    message = localize('$')..card.ability.extra.money,
                    dollars = card.ability.extra.money,
                    colour = G.C.MONEY
                }
            end
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
            }
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
    key = 'sticker_book',
    config = { extra = { mult = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 1, y = 0 },
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for _,joker in pairs(G.jokers.cards) do -- for each joker...
                for key,val in pairs(joker.ability) do -- for each "ability"...
                    if SMODS.Sticker.obj_table[key] and val then -- if it's a valid sticker...
                        local valid = true
                        for _,id in pairs(BalatroSim.AllAlignments) do
                            if key == id then
                                valid = false -- ...which isn't an alignment sticker...
                                break
                            end
                        end
                        if valid then
                            count = count + 1 -- ..then increment count
                        end
                    end
                end
            end
            return {
                mult = count * card.ability.extra.mult
            }
        end
    end
}

--[[SMODS.Joker { -- for later
    key = 'phone',
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 2, y = 0 },
    cost = 4,
}--]]

SMODS.Joker {
    key = 'prize',
    config = { extra = { amount = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.amount } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 4, y = 0 },
    cost = 7,
    calculate = function(self, card, context)
        if context.selling_self then
            local count = 0
            local cap = math.min(card.ability.extra.amount, G.consumeables.config.card_limit - #G.consumeables.cards)
            while count < cap do
                -- borrowed from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/Cryptid.lua#L485C3-L486C31 )
                local key = pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed("prize")).key
                -- borrowed from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/Items/Misc.lua#L1040C6-L1042C35 )
                play_sound('timpani')
                local _card = create_card("Consumeables", G.consumeables, nil, nil, nil, nil, key, "prize")
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                count = count + 1
            end
        end
    end
}

SMODS.Joker {
    key = 'shield',
    config = { extra = { percent = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.percent } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 5, y = 0 },
    cost = 6,
    calculate = function(self, card, context)
        if context.joker_main then
            rcBLib.cap_score(nil, 0.5)
        end
    end
}

SMODS.Joker {
    key = 'joko',
    config = { extra = { tarot_Xmult = 1.3, blind_Xmult = 2.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tarot_Xmult, card.ability.extra.blind_Xmult } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 0, y = 1 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            for k, v in ipairs(G.consumeables.cards) do
				if v.config.center.set == "Tarot" then
                    SMODS.calculate_effect({xmult = card.ability.extra.tarot_Xmult}, v) -- show the Xmult on the tarot card
                end
			end
            if (G.P_BLINDS[G.GAME.blind.name]) and (G.P_BLINDS[G.GAME.blind.name].bs_rc_is_glyph) then -- if the current blind is a glyph blind
                return {
                    xmult = card.ability.extra.blind_Xmult
                }
            end
        end
    end
}

local function snake_desc()
    local spectra = (next(SMODS.find_mod("SpectrumFramework"))) or (next(SMODS.find_mod("Bunco"))) or (next(SMODS.find_mod("SixSuits"))) or (next(SMODS.find_mod("paperback")))
    local cry = (next(SMODS.find_mod("Cryptid")) or false) -- or false to turn it into a boolean
    if spectra and cry then
        return "j_bs_rc_snake_spec_cry"
    elseif spectra then
        return "j_bs_rc_snake_spec"
    elseif cry then
        return "j_bs_rc_snake_cry"
    else
        return "j_bs_rc_snake"
    end
end

SMODS.Joker {
    key = 'snake',
    config = { extra = { mult = 20, Xmult = 3, powmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return {
            key = snake_desc(),
            vars = { card.ability.extra.mult, card.ability.extra.Xmult, card.ability.extra.powmult}
        }
    end,
    rarity = 2,
    atlas = 'bs_jokers',
    pos = { x = 1, y = 1 },
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            -- ^1.5 Mult - Whole Deck (Cryptid)
            if next(SMODS.find_mod("Cryptid")) and context.poker_hands and next(context.poker_hands['cry_WholeDeck']) then
                return {
                    emult = card.ability.extra.powmult, -- cryptid requires talisman, so assume it's already present
                }
            end
            -- X3 Mult - Straight Flush, Straight Spectrum (Spectrum Framework, Bunco, Six Suits, Paperback)
            if context.poker_hands and next(context.poker_hands['Straight Flush']) then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                }
            end
            if next(SMODS.find_mod("SpectrumFramework")) and context.poker_hands and next(context.poker_hands['spectrum_Straight Spectrum']) then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                }
            end
            if next(SMODS.find_mod("Bunco")) and context.poker_hands and next(context.poker_hands['bunc_Straight Spectrum']) then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                }
            end
            if next(SMODS.find_mod("SixSuits")) and context.poker_hands and next(context.poker_hands['six_Straight Spectrum']) then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                }
            end
            if next(SMODS.find_mod("paperback")) and context.poker_hands and next(context.poker_hands['paperback_Straight Spectrum']) then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                }
            end
            -- +20 Mult - Straight
            if context.poker_hands and next(context.poker_hands['Straight']) then
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'bread',
    config = { extra = { chips = 160, mult = 8, chips_dec = -20, mult_dec = -1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.chips_dec, card.ability.extra.mult_dec } }
    end,
    rarity = 1,
    atlas = 'bs_jokers',
    pos = { x = 4, y = 2 },
    cost = 4,
    eternal_compat = false,
    blueprint_compat = true,
    pools = {
        Food = true
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
            }
        end
        if context.after and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_dec
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_dec
            if card.ability.extra.chips <= 0 then
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
    key = 'lava',
    config = { extra = { Xmult = 1, Xmult_inc = 0.1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_inc, card.ability.extra.Xmult } }
    end,
    rarity = 3,
    atlas = 'bs_jokers',
    pos = { x = 5, y = 2 },
    cost = 7,
    perishable_compat = false,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before then
            if (#G.hand.cards > 0) then
                local valid = {}
                for k,v in pairs(G.hand.cards) do
                    if not v.getting_dunked then
                        valid[#valid+1] = v
                    end
                end
                if (#valid > 0) then
                    local target = pseudorandom_element(valid, pseudoseed("lava_dunk"))
                    target.getting_dunked = true
                    SMODS.calculate_effect({
                        remove = true,
                        message = localize('bs_rc_notice_lava_dunk'),
                        colour = G.C.RED
                    }, target)
                    target:start_dissolve(nil, true)
                    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_inc
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                        focus = card
                    }
                end
            end
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end
    end,
}