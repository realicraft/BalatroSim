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
    atlas = 'bs_alignments',
    pos = { x = 0, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_normal",
    badge_colour = HEX("ababab"),
    atlas = 'bs_alignments',
    pos = { x = 1, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_fire",
    badge_colour = HEX("e67f17"),
    atlas = 'bs_alignments',
    pos = { x = 2, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_water",
    badge_colour = HEX("1717e6"),
    atlas = 'bs_alignments',
    pos = { x = 3, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_electric",
    badge_colour = HEX("e6e617"),
    atlas = 'bs_alignments',
    pos = { x = 4, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_plant",
    badge_colour = HEX("17e617"),
    atlas = 'bs_alignments',
    pos = { x = 5, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_ice",
    badge_colour = HEX("17e6e6"),
    atlas = 'bs_alignments',
    pos = { x = 6, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_light",
    badge_colour = HEX("b4b4b4"),
    atlas = 'bs_alignments',
    pos = { x = 7, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_dark",
    badge_colour = HEX("474747"),
    atlas = 'bs_alignments',
    pos = { x = 8, y = 0 },
    config = { extra = { align_is_also = {} } },
}

BalatroSim.Alignment{
    key = "align_energy",
    badge_colour = HEX("d517e6"),
    atlas = 'bs_alignments',
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
    {enhance = "m_bs_rc_poison", align = "bs_rc_align_dark"},
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
    -- prism --
    {enhance = "m_prism_crystal", align = "bs_rc_align_normal"},
    {enhance = "m_prism_burnt", align = "bs_rc_align_fire"},
    {enhance = "m_prism_double", align = "bs_rc_align_none"},
    {enhance = "m_prism_echo", align = "bs_rc_align_light"},
    -- balatro goes kino --
    {enhance = "m_kino_demonic", align = "bs_rc_align_fire"},
    {enhance = "m_kino_sci_fi", align = "bs_rc_align_electric"},
    {enhance = "m_kino_romance", align = "bs_rc_align_normal"},
    {enhance = "m_kino_horror", align = "bs_rc_align_dark"},
    {enhance = "m_kino_monster", align = "bs_rc_align_dark"},
    {enhance = "m_kino_fantasy", align = "bs_rc_align_plant"},
    -- balatro+ --
    {enhance = "m_bplus_premium", align = "bs_rc_align_electric"},
    {enhance = "m_bplus_framed", align = "bs_rc_align_plant"},
    {enhance = "m_bplus_balanced", align = "bs_rc_align_light"},
    {enhance = "m_bplus_burned", align = "bs_rc_align_fire"},
    -- warpzone --
    {enhance = "m_Wzon_poisonous", align = "bs_rc_align_dark"},
    -- the autumn circus --
    {enhance = "m_thac_loop", align = "bs_rc_align_normal"},
    {enhance = "m_thac_grass", align = "bs_rc_align_plant"},
    {enhance = "m_thac_dirt", align = "bs_rc_align_normal"},
    {enhance = "m_thac_star", align = "bs_rc_align_energy"},
    {enhance = "m_thac_bone", align = "bs_rc_align_dark"},
    {enhance = "m_thac_jewel", align = "bs_rc_align_normal"},
    {enhance = "m_thac_soulbound", align = "bs_rc_align_light"},
    -- aikoyori's shenanigans --
    {enhance = "m_akyrs_brick_card", align = "bs_rc_align_normal"},
    {enhance = "m_akyrs_scoreless", align = "bs_rc_align_none"},
}

--- based off of FusionJokers' FusionJokers.fusions:add_fusion
--- @param enhance string
--- @param align string
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
    {joker = "j_constellation", align = "bs_rc_align_light"},
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
    {joker = "j_walkie_talkie", align = "bs_rc_align_electric"},
    {joker = "j_selzer", align = "bs_rc_align_water"}, -- yes, that is actually the id for seltzer
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
    {joker = "j_bs_rc_snake", align = "bs_rc_align_plant"},
    {joker = "j_bs_rc_hank", align = "bs_rc_align_fire"},
    {joker = "j_bs_rc_fireproof_joker", align = "bs_rc_align_fire"},
    {joker = "j_bs_rc_extinguisher", align = "bs_rc_align_water"},
    {joker = "j_bs_rc_heatwave", align = "bs_rc_align_fire"},
    {joker = "j_bs_rc_snow_shovel", align = "bs_rc_align_ice"},
    {joker = "j_bs_rc_snow_storm", align = "bs_rc_align_ice"},
    {joker = "j_bs_rc_poison_berries", align = "bs_rc_align_dark"},
    {joker = "j_bs_rc_poisoned_joker", align = "bs_rc_align_dark"},
    {joker = "j_bs_rc_bread", align = "bs_rc_align_plant"},
    {joker = "j_bs_rc_lava", align = "bs_rc_align_fire"},
    -- kcvanilla --
    {joker = "j_kcvanilla_fortunecookie", align = "bs_rc_align_plant"},
    {joker = "j_kcvanilla_robo", align = "bs_rc_align_electric"},
    {joker = "j_kcvanilla_squid", align = "bs_rc_align_water"},
    {joker = "j_kcvanilla_swiss", align = "bs_rc_align_plant"},
    {joker = "j_kcvanilla_powergrid", align = "bs_rc_align_electric"},
    {joker = "j_kcvanilla_collapse", align = "bs_rc_align_dark"},
    -- famailiar ==
    {joker = "j_fam_dry-erase_board", align = "bs_rc_align_light"},
    {joker = "j_fam_neopolitan", align = "bs_rc_align_ice"},
    {joker = "j_fam_perfect_ballot", align = "bs_rc_align_plant"},
    {joker = "j_fam_sploosh", align = "bs_rc_align_water"},
    {joker = "j_fam_taromancer", align = "bs_rc_align_plant"},
    {joker = "j_fam_ham_radio", align = "bs_rc_align_electric"},
    -- redux arcanum --
    {joker = "j_ReduxArcanum_bottled_buffoon", align = "bs_rc_align_water"},
    {joker = "j_ReduxArcanum_shock_humor", align = "bs_rc_align_electric"},
    -- the autumn circus --
    {joker = "j_thac_gift_from_the_void", align = "bs_rc_align_dark"},
    {joker = "j_thac_mirage_joker", align = "bs_rc_align_water"},
    {joker = "j_thac_knight_of_heart", align = "bs_rc_align_fire"},
    {joker = "j_thac_witch_of_mind", align = "bs_rc_align_light"},
    {joker = "j_thac_lord_of_void", align = "bs_rc_align_dark"},
    {joker = "j_thac_funny_fertilizer", align = "bs_rc_align_plant"},
    {joker = "j_thac_highest_number", align = "bs_rc_align_dark"},
    {joker = "j_thac_exorcist", align = "bs_rc_align_light"},
    {joker = "j_thac_gallows_humor", align = "bs_rc_align_dark"},
    {joker = "j_thac_common_ground", align = "bs_rc_align_normal"},
    {joker = "j_thac_jokermancer", align = "bs_rc_align_dark"},
    {joker = "j_thac_joke_book_of_the_dead", align = "bs_rc_align_plant"},
    {joker = "j_thac_matchbook", align = "bs_rc_align_fire"},
    {joker = "j_thac_dark_hallway", align = "bs_rc_align_dark"},
    {joker = "j_thac_celestial_awe", align = "bs_rc_align_light"},
    {joker = "j_thac_somber_snowfall", align = "bs_rc_align_ice"},
    {joker = "j_thac_twin_stella", align = "bs_rc_align_light"},
    {joker = "j_thac_lunar_grave", align = "bs_rc_align_dark"},
    -- handsome devils --
    {joker = "j_hnds_coffee_break", align = "bs_rc_align_plant"},
    {joker = "j_hnds_banana_split", align = "bs_rc_align_plant"},
    {joker = "j_hnds_head_of_medusa", align = "bs_rc_align_plant"},
    {joker = "j_hnds_occultist", align = "bs_rc_align_dark"},
    {joker = "j_hnds_stone_mask", align = "bs_rc_align_normal"},
    {joker = "j_hnds_meme", align = "bs_rc_align_electric"},
    {joker = "j_hnds_digital_circus", align = "bs_rc_align_electric"},
    -- aikoyori's shenanigans --
    {joker = "j_akyrs_redstone_repeater", align = "bs_rc_align_electric"},
    {joker = "j_akyrs_observer", align = "bs_rc_align_electric"},
    {joker = "j_akyrs_quasi_connectivity", align = "bs_rc_align_electric"},
    {joker = "j_akyrs_netherite_pickaxe", align = "bs_rc_align_fire"},
    {joker = "j_akyrs_utage_charts", align = "bs_rc_align_light"},
    {joker = "j_akyrs_eat_pant", align = "bs_rc_align_plant"},
    {joker = "j_akyrs_tldr_joker", align = "bs_rc_align_energy"},
    {joker = "j_akyrs_2fa", align = "bs_rc_align_electric"},
    {joker = "j_akyrs_gaslighting", align = "bs_rc_align_fire"},
    {joker = "j_akyrs_maxwells_notebook", align = "bs_rc_align_plant"},
    -- cryptid --
    {joker = "j_cry_cursor", align = "bs_rc_align_electric"},
    {joker = "j_cry_googol_play", align = "bs_rc_align_energy"},
    {joker = "j_cry_boredom", align = "bs_rc_align_plant"},
    {joker = "j_cry_lucky_joker", align = "bs_rc_align_plant"},
    {joker = "j_cry_meteor", align = "bs_rc_align_light"},
    {joker = "j_cry_exoplanet", align = "bs_rc_align_dark"},
    {joker = "j_cry_stardust", align = "bs_rc_align_light"},
    {joker = "j_cry_night", align = "bs_rc_align_dark"},
    {joker = "j_cry_sapling", align = "bs_rc_align_plant"},
    {joker = "j_cry_pickle", align = "bs_rc_align_plant"},
    {joker = "j_cry_chili_pepper", align = "bs_rc_align_plant"},
    {joker = "j_cry_sync_catalyst", align = "bs_rc_align_energy"},
    {joker = "j_cry_altgoogol", align = "bs_rc_align_electric"},
    {joker = "j_cry_jtron", align = "bs_rc_align_electric"},
    {joker = "j_cry_spaceglobe", align = "bs_rc_align_light"},
    {joker = "j_cry_bonusjoker", align = "bs_rc_align_water"},
    {joker = "j_cry_goldjoker", align = "bs_rc_align_electric"},
    {joker = "j_cry_curse_sob", align = "bs_rc_align_water"},
    {joker = "j_cry_oldblueprint", align = "bs_rc_align_plant"},
    {joker = "j_cry_multjoker", align = "bs_rc_align_fire"},
    {joker = "j_cry_eternalflame", align = "bs_rc_align_fire"},
    {joker = "j_cry_caramel", align = "bs_rc_align_fire"},
    {joker = "j_cry_flip_side", align = "bs_rc_align_water"},
    {joker = "j_cry_cut", align = "bs_rc_align_electric"},
    {joker = "j_cry_CodeJoker", align = "bs_rc_align_electric"},
    {joker = "j_cry_copypaste", align = "bs_rc_align_electric"},
    {joker = "j_cry_blender", align = "bs_rc_align_electric"},
    {joker = "j_cry_python", align = "bs_rc_align_electric"},
    {joker = "j_cry_universe", align = "bs_rc_align_energy"},
    {joker = "j_cry_astral_bottle", align = "bs_rc_align_energy"},
    {joker = "j_cry_tropical_smoothie", align = "bs_rc_align_water"},
    {joker = "j_cry_necromancer", align = "bs_rc_align_dark"},
    {joker = "j_cry_oil_lamp", align = "bs_rc_align_fire"},
    {joker = "j_cry_tax_fraud", align = "bs_rc_align_plant"},
    {joker = "j_cry_digitalhallucinations", align = "bs_rc_align_electric"},
    {joker = "j_cry_pumpkin", align = "bs_rc_align_plant"},
    {joker = "j_cry_carved_pumpkin", align = "bs_rc_align_plant"},
    {joker = "j_cry_arsonist", align = "bs_rc_align_fire"},
    {joker = "j_cry_spectrogram", align = "bs_rc_align_electric"},
    {joker = "j_cry_ghost", align = "bs_rc_align_dark"},
    {joker = "j_cry_monopoly_money", align = "bs_rc_align_plant"},
    {joker = "j_cry_mneon", align = "bs_rc_align_electric"},
    {joker = "j_cry_notebook", align = "bs_rc_align_plant"},
    {joker = "j_cry_macabre", align = "bs_rc_align_dark"},
    {joker = "j_cry_virgo", align = "bs_rc_align_light"},
    {joker = "j_cry_universum", align = "bs_rc_align_light"},
    {joker = "j_cry_stella_mortis", align = "bs_rc_align_dark"},
    {joker = "j_cry_crustulum", align = "bs_rc_align_plant"},
    {joker = "j_cry_circulus_pistoris", align = "bs_rc_align_plant"},
    {joker = "j_cry_primus", align = "bs_rc_align_electric"},
    {joker = "j_cry_equilib", align = "bs_rc_align_energy"},
    {joker = "j_cry_energia", align = "bs_rc_align_energy"},
    {joker = "j_cry_formidiulosus", align = "bs_rc_align_dark"},
    {joker = "j_cry_scrabble", align = "bs_rc_align_plant"}, -- in case it returns
}

--- based off of FusionJokers' FusionJokers.fusions:add_fusion
--- @param joker string
--- @param align string
function BalatroSim.JokerAlignments:add_joker(joker, align)
    table.insert(self, {joker = joker, align = align})
end

--- @param card table
function BalatroSim:get_alignment(card)
    -- check stickers before determining the type of the card, as all cards can have stickers
    for _, v in pairs(BalatroSim.AllAlignments) do
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

--- @param card table
--- @param align string
function BalatroSim:has_alignment(card, align)
    local check = BalatroSim:get_alignment(card) ---@type string
    if (check == align) then
        return true
    else
        local alignO = SMODS.Sticker.obj_table[align]
        for _,v in ipairs(alignO.config.extra.align_is_also) do
            if (check == v) then
                return true
            end
        end
    end
    return false
end

--- loosely based off of Pokermon's apply_type_sticker ( https://github.com/InertSteak/Pokermon/blob/main/functions/pokefunctions.lua#L770 )
--- @param card table
--- @param align string
function BalatroSim:add_alignment(card, align)
    if not card.ability then -- if card.ability doesn't exist yet, make it
        card.ability = {}
    end
    for l, v in pairs(BalatroSim.AllAlignments) do -- remove existing alignment stickers
        card.ability[v] = false
    end
    card.ability[align] = true -- add the given alignment sticker
end

--- @param card table
--- @param seed string
function BalatroSim:add_random_alignment(card, seed)
    BalatroSim:add_alignment(card, pseudorandom_element(BalatroSim.AllAlignments, pseudoseed(seed)))
end

--- @param card table
function BalatroSim:has_alignment_sticker(card)
    for _, v in pairs(BalatroSim.AllAlignments) do
        if card.ability[v] then
            return true
        end
    end
    return false
end