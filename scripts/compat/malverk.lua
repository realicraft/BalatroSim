AltTextures_Utils.default_atlas.item = 'bs_rc_bs_consumables'
AltTextures_Utils.loc_keys.item = "b_item_cards"

AltTexture({
    key = 'items',
    set = 'item',
    path = 'consumables_af.png',
    display_pos = 'c_bs_rc_snowball',
    original_sheet = true,
    keys = {
        "c_bs_rc_snowball",
        --"c_bs_rc_crate",
        "c_bs_rc_lamp_oil",
        --"c_bs_rc_rope",
        --"c_bs_rc_bomb",
        "c_bs_rc_glove",
        "c_bs_rc_trash_can",
        "c_bs_rc_chip",
        "c_bs_rc_sword",
        "c_bs_rc_killbind",
        "c_bs_rc_exp_bottle",
        "c_bs_rc_poison_vial",
        --"c_bs_rc_battery",
        "c_bs_rc_heal_potion",
        "c_bs_rc_wallet",
        "c_bs_rc_gun",
        "c_bs_rc_bullet",
    },
    loc_txt = {
        name = "April Fools Items",
        text = {
            ""
        }
    }
})

AltTexture({
    key = 'spectrals',
    set = 'Spectral',
    path = 'consumables_af.png',
    display_pos = 'c_bs_rc_snowgrave',
    original_sheet = true,
    keys = {
        --"c_bs_rc_gild",
        "c_bs_rc_snowgrave",
        "c_bs_rc_revert",
    },
    loc_txt = {
        name = "April Fools Spectrals",
        text = {
            ""
        }
    }
})

AltTexture({
    key = 'jokers',
    set = 'Joker',
    path = 'jokers_af.png',
    display_pos = 'j_bs_rc_sticker_book',
    original_sheet = true,
    keys = {
        "j_bs_rc_tray_of_cookies",
        "j_bs_rc_sticker_book",
        --"j_bs_rc_disposable_phone",
        "j_bs_rc_chest",
        "j_bs_rc_prize",
        "j_bs_rc_shield",
        "j_bs_rc_joko",
        "j_bs_rc_snake",
        "j_bs_rc_snow_shovel",
        "j_bs_rc_snow_storm",
        "j_bs_rc_fireproof_joker",
        "j_bs_rc_extinguisher",
        "j_bs_rc_heatwave",
        "j_bs_rc_poison_berries",
        "j_bs_rc_poisoned_joker",
        --"j_bs_rc_filled_chocolate",
        "j_bs_rc_bread",
        "j_bs_rc_lava",
        --"j_bs_rc_spider",
    },
    loc_txt = {
        name = "April Fools Jokers",
        text = {
            ""
        }
    }
})

AltTexture({
    key = 'enhancements',
    set = 'Enhanced',
    path = 'enhancements_af.png',
    display_pos = 'm_bs_rc_snow',
    original_sheet = true,
    keys = {
        "m_bs_rc_snow",
        "m_bs_rc_poison",
        "m_bs_rc_fire"
    },
    loc_txt = {
        name = "April Fools Enhancements",
        text = {
            ""
        }
    }
})

TexturePack{
    key = 'aprilfools',
    textures = {
        'bs_rc_jokers',
        'bs_rc_enhancements',
        'bs_rc_spectrals',
        'bs_rc_items',
    },
    loc_txt = {
        name = "April Fools Textures",
        text = {
            "Textures used in the April Fools update"
        }
    }
}