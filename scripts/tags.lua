-- borrowed from Maximus (specifically https://github.com/the-Astra/Maximus/blob/main/main.lua#L7713C1-L7757C2 )
SMODS.Tag {
    key = 'item',
    atlas = 'bs_tags',
    pos = { x = 0, y = 0 },
    min_ante = 2,
    config = { type = 'new_blind_choice' },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { set = "Other", key = "p_bs_rc_item_mega_1", specific_vars = { 1, 2 } }
    end,
    apply = function(self, tag, context)
        if context.type == "new_blind_choice" then
            tag:yep("+", G.C.PURPLE, function()
                local key = "p_bs_rc_item_mega_1"
                local card = Card(
                    G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                    G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                    G.CARD_W * 1.27,
                    G.CARD_H * 1.27,
                    G.P_CARDS.empty,
                    G.P_CENTERS[key],
                    { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = card } })
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = 'prize',
    atlas = 'bs_tags',
    pos = { x = 1, y = 0 },
    min_ante = 2,
    config = { type = 'immediate' },
    loc_vars = function(self, info_queue)
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep("+", G.C.ORANGE, function()
                local count = 0
                local cap = math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards)
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
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = 'card',
    atlas = 'bs_tags',
    pos = { x = 2, y = 0 },
    min_ante = 1,
    config = { type = 'immediate' },
    loc_vars = function(self, info_queue)
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep("+", G.C.ORANGE, function()
                local has_enh = pseudorandom("cardtag_enh") < 0.4
                local has_ed = pseudorandom("cardtag_ed") < 0.4
                local has_seal = pseudorandom("cardtag_seal") < 0.3
                local has_align = pseudorandom("cardtag_align") < 0.5
                -- borrowed from the vanilla game (specifically card.lua, lines 1330~1335)
                local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if v.key ~= 'm_stone' then 
                                cen_pool[#cen_pool+1] = v
                            end
                        end
                local card = create_playing_card({center = has_enh and pseudorandom_element(cen_pool, pseudoseed("cardtag_enh")) or G.P_CENTERS.c_base}, G.deck)
                if has_ed then
                    local editions = {}
                    for _,v in pairs(G.P_CENTERS) do
                        if v.set == "Edition" and v.key ~= "e_negative" then -- get all editions (that aren't negative)
                            editions[#editions+1] = v.key
                        end
                    end
                    card:set_edition(pseudorandom_element(editions, pseudoseed("cardtag_ed")))
                end
                if has_seal then
                    local seal = {pseudorandom_element(SMODS.Seal.obj_table, pseudoseed("cardtag_seal"))}
                    card:set_seal(seal[2]) -- not sure why pseudorandom_element is returning two values here
                end
                if has_align then
                    BalatroSim:add_random_alignment(card, "cardtag_align")
                end
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

--[[SMODS.Tag {
    key = 'burnt',
    atlas = 'bs_tags',
    pos = { x = 0, y = 1 },
    min_ante = 3,
    config = { type = '' },
    loc_vars = function(self, info_queue)
    end,
    apply = function(self, tag, context)
    end
}--]]

SMODS.Tag {
    key = 'align',
    atlas = 'bs_tags',
    pos = { x = 1, y = 1 },
    min_ante = 3,
    config = { type = 'immediate' },
    loc_vars = function(self, info_queue)
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep("+", G.C.ORANGE, function()
                local unaligned_cards = {}
                for _,v in pairs(G.deck.cards) do
                    if not BalatroSim:has_alignment_sticker(v) then
                        unaligned_cards[#unaligned_cards+1] = v
                    end
                end
                for i = 1, math.min(3, #unaligned_cards) do
                    local card = table.remove(unaligned_cards, math.floor(pseudorandom("aligntag")*(#unaligned_cards)+1)) -- use table.remove to avoid duplicates
                    BalatroSim:add_random_alignment(card, "aligntag")
                end
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = 'gun',
    atlas = 'bs_tags',
    pos = { x = 2, y = 1 },
    min_ante = 4,
    config = { type = 'immediate' },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { set = "item", key = "c_bs_rc_gun", specific_vars = { 50 } }
        info_queue[#info_queue + 1] = { set = "item", key = "c_bs_rc_bullet", specific_vars = {  } }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep("+", G.C.ORANGE, function()
                if (G.consumeables.config.card_limit - #G.consumeables.cards) >= 2 then
                    -- spawn gun
                    play_sound('timpani')
                    local gc = SMODS.create_card({set = "item", area = G.consumeables, key = "c_bs_rc_gun", key_append = "guntag"})
                    gc:add_to_deck()
                    G.consumeables:emplace(gc)
                    -- spawn bullet
                    play_sound('timpani')
                    local bc = SMODS.create_card({set = "item", area = G.consumeables, key = "c_bs_rc_bullet", key_append = "guntag"})
                    bc:add_to_deck()
                    G.consumeables:emplace(bc)
                end
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}