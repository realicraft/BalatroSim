-- borrowed from Gemstones (specifically https://github.com/0fficialHalo/Gemstones/blob/main/Gemstones.lua#L21C1-L35C2 )
BalatroSim.Alignment = SMODS.Sticker:extend{
	rate = 0.01,
	order = 100,
    prefix_config = { key = true },
    default_compat = true,
    joker_compat = true,
    card_compat = true,
    needs_enable_flag = true,
	draw = function(self, card) --don't draw shine
		G.shared_stickers[self.key].role.draw_major = card
		G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, nil, card.children.center)
	end,
    added = function(self, card) end,
    removed = function(self, card) end,
}

-- defining alignments --
BalatroSim.Alignment{
    key = "align_none",
    badge_colour = HEX("ababab"),
    atlas = "alignments",
    pos = { x = 0, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_normal",
    badge_colour = HEX("ababab"),
    atlas = "alignments",
    pos = { x = 1, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_fire",
    badge_colour = HEX("e67f17"),
    atlas = "alignments",
    pos = { x = 2, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_water",
    badge_colour = HEX("1717e6"),
    atlas = "alignments",
    pos = { x = 3, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_electric",
    badge_colour = HEX("e6e617"),
    atlas = "alignments",
    pos = { x = 4, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_plant",
    badge_colour = HEX("17e617"),
    atlas = "alignments",
    pos = { x = 5, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_ice",
    badge_colour = HEX("17e6e6"),
    atlas = "alignments",
    pos = { x = 6, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_light",
    badge_colour = HEX("b4b4b4"),
    atlas = "alignments",
    pos = { x = 7, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_dark",
    badge_colour = HEX("474747"),
    atlas = "alignments",
    pos = { x = 8, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_energy",
    badge_colour = HEX("d517e6"),
    atlas = "alignments",
    pos = { x = 9, y = 0 },
    config = { extra = { align_is_also = {
        "bs_rc_align_fire", "bs_rc_align_water", "bs_rc_align_electric",
        "bs_rc_align_plant", "bs_rc_align_ice",
        "bs_rc_align_light", "bs_rc_align_dark"
    } } },
}

BalatroSim.AllAlignments = {
    "bs_rc_align_normal",
    "bs_rc_align_fire",
    "bs_rc_align_water",
    "bs_rc_align_electric",
    "bs_rc_align_plant",
    "bs_rc_align_ice",
    "bs_rc_align_light",
    "bs_rc_align_dark",
    "bs_rc_align_energy"
}

-- assigning alignments to enhancements --
BalatroSim.EnhanceAlignments = {
    -- vanilla --
    {enhance = "m_bonus", align = "bs_rc_align_water"},
    {enhance = "m_mult", align = "bs_rc_align_fire"},
    {enhance = "m_wild", align = "bs_rc_align_none"},
    {enhance = "m_glass", align = "bs_rc_align_ice"},
    {enhance = "m_steel", align = "bs_rc_align_normal"},
    {enhance = "m_stone", align = "bs_rc_align_normal"},
    {enhance = "m_gold", align = "bs_rc_align_electric"},
    {enhance = "m_lucky", align = "bs_rc_align_plant"},
    -- balatrosim --
    {enhance = "m_bs_rc_snow", align = "bs_rc_align_ice"},
    {enhance = "m_bs_rc_fire", align = "bs_rc_align_fire"},
    -- cryptid --
    {enhance = "m_cry_echo", align = "bs_rc_align_dark"},
    {enhance = "m_cry_light", align = "bs_rc_align_light"},
    -- showdown --
    {enhance = "m_showdown_holy", align = "bs_rc_align_light"},
    {enhance = "m_showdown_ghost", align = "bs_rc_align_dark"},
    -- baladrone --
    {enhance = "m_cs_fake", align = "bs_rc_align_none"},
    -- buffonery --
    {enhance = "m_buf_porcelain", align = "bs_rc_align_ice"},
    {enhance = "m_buf_porcelain_g", align = "bs_rc_align_ice"},
    -- bunco --
    {enhance = "m_bunc_cracker", align = "bs_rc_align_plant"},
    {enhance = "m_bunc_copper", align = "bs_rc_align_electric"},
    -- familiar --
    {enhance = "m_fam_charmed", align = "bs_rc_align_fire"},
    {enhance = "m_fam_div", align = "bs_rc_align_ice"},
    {enhance = "m_fam_gilded", align = "bs_rc_align_electric"},
    {enhance = "m_fam_penalty", align = "bs_rc_align_fire"},
    -- grim --
    {enhance = "m_grm_rpg", align = "bs_rc_align_none"},
    {enhance = "m_grm_lead", align = "bs_rc_align_dark"},
    {enhance = "m_grm_iron", align = "bs_rc_align_normal"},
    {enhance = "m_grm_platinum", align = "bs_rc_align_light"},
    {enhance = "m_grm_silver", align = "bs_rc_align_normal"},
    {enhance = "m_grm_radium", align = "bs_rc_align_energy"},
    -- ortalab --
    {enhance = "m_ortalab_post", align = "bs_rc_align_water"},
    {enhance = "m_ortalab_bent", align = "bs_rc_align_normal"},
    {enhance = "m_ortalab_index", align = "bs_rc_align_plant"},
    {enhance = "m_ortalab_sand", align = "bs_rc_align_normal"},
    {enhance = "m_ortalab_rusty", align = "bs_rc_align_electric"},
    {enhance = "m_ortalab_ore", align = "bs_rc_align_normal"},
    {enhance = "m_ortalab_iou", align = "bs_rc_align_energy"},
    {enhance = "m_ortalab_recycled", align = "bs_rc_align_plant"},
    -- strange pencil --
    {enhance = "m_pencil_diseased", align = "bs_rc_align_plant"},
    {enhance = "m_pencil_flagged", align = "bs_rc_align_none"},
    -- unstable --
    {enhance = "m_unstb_acorn", align = "bs_rc_align_normal"},
    {enhance = "m_unstb_vintage", align = "bs_rc_align_plant"},
    {enhance = "m_unstb_promo", align = "bs_rc_align_normal"},
    {enhance = "m_unstb_slop", align = "bs_rc_align_electric"},
    {enhance = "m_unstb_resource", align = "bs_rc_align_none"},
    {enhance = "m_unstb_radioactive", align = "bs_rc_align_electric"},
    {enhance = "m_unstb_biohazard", align = "bs_rc_align_fire"},
    {enhance = "m_unstb_poison", align = "bs_rc_align_dark"},
    -- paperback --
    {enhance = "m_paperback_soaked", align = "bs_rc_align_water"},
    {enhance = "m_paperback_ceramic", align = "bs_rc_align_normal"},
    {enhance = "m_paperback_wrapped", align = "bs_rc_align_normal"},
    {enhance = "m_paperback_bandaged", align = "bs_rc_align_plant"},
}

-- based off of FusionJokers' FusionJokers.fusions:add_fusion
function BalatroSim.EnhanceAlignments:add_enhance(enhance, align)
    table.insert(self, {enhance = enhance, align = align})
end

-- assigning alignments to jokers --
BalatroSim.JokerAlignments = {
    -- vanilla --
    {joker = "j_joker", align = "bs_rc_align_normal"},
    {joker = "j_dusk", align = "bs_rc_align_dark"},
    {joker = "j_steel_joker", align = "bs_rc_align_normal"},
    {joker = "j_even_steven", align = "bs_rc_align_fire"},
    {joker = "j_odd_todd", align = "bs_rc_align_water"},
    {joker = "j_supernova", align = "bs_rc_align_light"},
    {joker = "j_blackboard", align = "bs_rc_align_dark"},
    {joker = "j_ice_cream", align = "bs_rc_align_ice"},
    {joker = "j_splash", align = "bs_rc_align_water"},
    {joker = "j_blue_joker", align = "bs_rc_align_water"},
    {joker = "j_constellation", align = "bs_rc_align_dark"},
    {joker = "j_green_joker", align = "bs_rc_align_plant"},
    {joker = "j_todo_list", align = "bs_rc_align_plant"},
    {joker = "j_hologram", align = "bs_rc_align_electric"},
    {joker = "j_midas_mask", align = "bs_rc_align_electric"},
    {joker = "j_turtle_bean", align = "bs_rc_align_plant"},
    {joker = "j_stone_joker", align = "bs_rc_align_normal"},
    {joker = "j_golden", align = "bs_rc_align_electric"},
    {joker = "j_baseball", align = "bs_rc_align_plant"},
    {joker = "j_diet_cola", align = "bs_rc_align_water"},
    {joker = "j_trading", align = "bs_rc_align_plant"},
    {joker = "j_popcorn", align = "bs_rc_align_fire"},
    {joker = "j_seltzer", align = "bs_rc_align_water"},
    {joker = "j_campfire", align = "bs_rc_align_fire"},
    {joker = "j_ticker", align = "bs_rc_align_electric"},
    {joker = "j_swashbuckler", align = "bs_rc_align_water"},
    {joker = "j_glass", align = "bs_rc_align_ice"},
    {joker = "j_flower_pot", align = "bs_rc_align_plant"},
    {joker = "j_satellite", align = "bs_rc_align_dark"},
    {joker = "j_burnt", align = "bs_rc_align_fire"},
    {joker = "j_canio", align = "bs_rc_align_normal"},
    {joker = "j_triboulet", align = "bs_rc_align_water"},
    {joker = "j_yorick", align = "bs_rc_align_electric"},
    {joker = "j_chicot", align = "bs_rc_align_fire"},
    {joker = "j_perkeo", align = "bs_rc_align_plant"},
    -- balatrosim --
    {joker = "j_bs_rc_chest", align = "bs_rc_align_plant"},
    {joker = "j_bs_rc_fireproof_joker", align = "bs_rc_align_fire"},
}

-- based off of FusionJokers' FusionJokers.fusions:add_fusion
function BalatroSim.JokerAlignments:add_joker(joker, align)
    table.insert(self, {joker = joker, align = align})
end

function BalatroSim:get_alignment(card)
    -- check stickers before determining the type of the card, as all cards can have stickers
    for l, v in pairs(BalatroSim.AllAlignments) do
        if card.ability[v] then
            return v
        end
    end
    if card.playing_card then -- card is a playing card
        for _,v in pairs(BalatroSim.EnhanceAlignments) do -- check enhancement
            if type(v) == "table" and v.enhance == card.config.center.key then -- make sure not to index add_enhance
                return v.align
            end
        end
    else
        if card.config.center.set == "Joker" then -- card is a joker
            for _,v in pairs(BalatroSim.JokerAlignments) do -- check enhancement
                if type(v) == "table" and v.joker == card.config.center.key then -- make sure not to index add_joker
                    return v.align
                end
            end
        else -- card is not a playing card
        end
    end
    return "bs_rc_align_none"
end

-- loosely based off of Pokermon's apply_type_sticker ( https://github.com/InertSteak/Pokermon/blob/main/functions/pokefunctions.lua#L770 )
function BalatroSim:add_alignment(card, align)
    if not card.ability then -- if card.ability doesn't exist yet, make it
        card.ability = {}
    end
    for l, v in pairs(BalatroSim.AllAlignments) do -- remove existing alignment stickers
        card.ability[v] = false
    end
    card.ability[align] = true -- add the given alignment sticker
end