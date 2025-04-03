return {
    descriptions = {
        Back={
            b_bs_rc_aligned = {
                name = 'Aligned Deck',
                text = {
                    "Start with a deck",
                    "full of cards with",
                    "random {C:attention}Alignments{}"
                }
            }
        },
        Blind={
            bl_bs_rc_gana = {
                name = 'Gana',
                text = {
                    "+$1 each Hand"
                }
            },
            bl_bs_rc_sebu = {
                name = 'Sebu',
                text = {
                    "Base Chips divided by Money"
                }
            },
            bl_bs_rc_wepa = {
                name = 'Wepa',
                text = {
                    "1 in 4 chance for played cards",
                    "to become Marked-for-Death"
                }
            },
            bl_bs_rc_pano = {
                name = 'Pano',
                text = {
                    "Debuffs Plant-Aligned cards"
                }
            },
            bl_bs_rc_maca= {
                name = 'Maca',
                text = {
                    "Debuffs Stone, Steel, and Gold Cards"
                }
            },
            bl_bs_rc_lana = {
                name = 'Lana',
                text = {
                    "-$2 each Hand"
                }
            },
            bl_bs_rc_hata = {
                name = 'Hata',
                text = {
                    "(?)X1.2 Mult"
                }
            },
            bl_bs_rc_fodo = {
                name = 'Fodo',
                text = {
                    "(?)X0.5 Mult per Consumable"
                }
            },
            bl_bs_rc_firi = {
                name = 'Firi',
                text = {
                    "Debuffs Fire-Aligned cards"
                }
            },
            bl_bs_rc_ata = {
                name = 'Ata',
                text = {
                    "Debuffs Water-Aligned cards"
                }
            },
            bl_bs_rc_leko = {
                name = 'Leko',
                text = {
                    "Debuffs Electric-Aligned cards"
                }
            },
            bl_bs_rc_liti = {
                name = 'Liti',
                text = {
                    "Debuffs Light-Aligned cards"
                }
            },
            bl_bs_rc_diri = {
                name = 'Diri',
                text = {
                    "Debuffs Dark-Aligned cards"
                }
            },
            bl_bs_rc_saze = {
                name = 'Saze',
                text = {
                    "+3 Hands, +3 Discards"
                }
            },
            bl_bs_rc_piri = {
                name = 'Piri',
                text = {
                    "(X)Scored cards gain 5 Chips",
                    "per unscored card"
                }
            },
            bl_bs_rc_fica = {
                name = 'Fica',
                text = {
                    "Debuffs ranks below 6"
                }
            },
            bl_bs_rc_ere = {
                name = 'Ere',
                text = {
                    "-1 Hand"
                }
            },
            bl_bs_rc_bufu = {
                name = 'Bufu',
                text = {
                    "Played hands gain two levels"
                }
            },
            bl_bs_rc_fubu = {
                name = 'Fubu',
                text = {
                    "Played hands lose two levels"
                }
            },
            bl_bs_rc_citi = {
                name = 'Citi',
                text = {
                    "The first hand is not allowed"
                }
            },
            bl_bs_rc_mero = {
                name = 'Mero',
                text = {
                    "(~X)Debuffs Steel and Gold Cards;",
                    "the last card in each hand",
                    "becomes Steel or Gold"
                }
            },
            bl_bs_rc_zesa = {
                name = 'Zesa',
                text = {
                    "-1 Hand, -2 Discards"
                }
            },
            bl_bs_rc_kaba = {
                name = 'Kaba',
                text = {
                    "(X)If the first hand wins,",
                    "it is destroyed"
                }
            },
            bl_bs_rc_toko = {
                name = 'Toko',
                text = {
                    "Poisons one card each in",
                    "hand and played hand,",
                    "once per hand"
                }
            },
            bl_bs_rc_ifi = {
                name = 'Ifi',
                text = {
                    "Debuffs all Ice-Aligned cards"
                }
            },
            bl_bs_rc_esi = {
                name = 'Esi',
                text = {
                    "Flips Jokers in place"
                }
            },
            bl_bs_rc_unaligned = {
                name = 'Umber Unaligned',
                text = {
                    "Debuffs all Unaligned cards"
                }
            },
            bl_bs_rc_energy = {
                name = 'Eggplant Energy',
                text = {
                    "Debuffs all Aligned cards"
                }
            },
            bl_bs_rc_static_scarf = {
                name = 'Static Scarf',
                text = {
                    "Cannot play Normal-, Electric-, or Ice-aligned cards;",
                    "Debuffs Normal-, Electric-, or Ice-aligned Jokers"
                }
            },
            bl_bs_rc_electric_edge = {
                name = 'Electric Edge',
                text = {
                    "Destroys one card every hand and discard"
                }
            },
            bl_bs_rc_patient_parka = {
                name = 'Patient Parka',
                text = {
                    "+20 hands; score capped at",
                    "1/20th of requirement"
                }
            },
            bl_bs_rc_blue_blaster = {
                name = 'Blue Blaster',
                text = {
                    "?????"
                }
            },
            bl_bs_rc_shifty_scarf = {
                name = 'Shifty Scarf',
                text = {
                    "(i'll have to think about it)"
                }
            },
            bl_bs_rc_greedy_glasses = {
                name = 'Greedy Glasses',
                text = {
                    "(spoiler??)"
                }
            },
        },
        --Edition={},
        Enhanced={
            m_bs_rc_snow = {
                name = 'Snow-Covered',
                text = {
                    "{C:chips}+#1#{} Chips, {C:mult}#2#{} Mult"
                }
            },
            m_bs_rc_fire = {
                name = 'On Fire',
                text = {
                    "{X:mult,C:white} X#1# {} Mult, increases by",
                    "+{X:mult,C:white} X#2# {} when played",
                    "Destroyed after reaching {X:mult,C:white} X#3# {}"
                }
            },
            m_bs_rc_poison = {
                name = 'Poisoned',
                text = {
                    "{C:chips}+#1#{} Chips, {X:mult,C:white} X#2# {} Mult",
                    "{C:green}#3# in #4#{} chance to remove Poisoned",
                    "{C:green}#5# in #6#{} chance to self-destruct"
                }
            }
        },
        Joker={
            j_bs_rc_chest = {
                name = 'Chest',
                text = {
                    "{C:attention}+#1#{} Consumable Slots"
                }
            },
            j_bs_rc_tray_of_cookies = {
                name = 'Tray of Cookies',
                text = {
                    "For the next {C:attention}#5#{} hands, one of:",
                    "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,",
                    "{C:money}$#3#{}, or {X:mult,C:white}X#4#{} Mult"
                }
            },
            j_bs_rc_sticker_book = {
                name = 'Sticker Book',
                text = {
                    "For each sticker on a",
                    "Joker, {C:mult}+#1#{} Mult"
                }
            },
            j_bs_rc_phone = {
                name = '(X)Disposable Phone',
                text = {
                    "If played hand has {C:attention}five{} number",
                    "cards or Aces, call that number,",
                    "then {C:red}self-destruct{}"
                }
            },
            j_bs_rc_prize = {
                name = 'Prize',
                text = {
                    "Sell this card to get",
                    "#1# {C:attention}Consumables{}",
                    "{C:inactive,s:0.8}(Must have room){}"
                }
            },
            j_bs_rc_shield = {
                name = 'Blocking Shield',
                text = {
                    "Hand always scores at least",
                    "{C:attention}#1#%{} of the required score"
                }
            },
            j_bs_rc_joko = {
                name = 'Joko',
                text = {
                    "Held Tarot cards give {X:mult,C:white}X#1#{} Mult;",
                    "{X:mult,C:white}X#2#{} Mult against {C:attention}Glyph Blinds{}"
                }
            },
            j_bs_rc_snake = {
                name = 'Snake',
                text = {
                    "{C:mult}+#1#{} Mult if hand is a {C:attention}Straight{} or similar;",
                    "{X:mult,C:white}X#2#{} Mult if hand is a {C:attention}Straight Flush{} or similar"
                }
            },
            j_bs_rc_snake_cry = {
                name = 'Snake',
                text = {
                    "{C:mult}+#1#{} Mult if hand is a {C:attention}Straight{} or similar;",
                    "{X:mult,C:white}X#2#{} Mult if hand is a {C:attention}Straight Flush{} or similar;",
                    "{X:dark_edition,C:white}^#3#{} Mult if hand is a {C:attention}".. (((Cryptid_config and Cryptid_config.family_mode)) and "The Entire Deck" or "The Entire Fucking Deck") .. "{}"
                }
            },
            j_bs_rc_fireproof_joker = {
                name = 'Fireproof Joker',
                text = {
                    "{C:red}On Fire{} no longer",
                    "destroys cards"
                }
            },
            j_bs_rc_extinguisher = {
                name = 'Extinguisher',
                text = {
                    "Removes {C:attention}On Fire{} from scored cards",
                    "and gains {X:mult,C:white}X#1#{} Mult",
                    "(Currently at {X:mult,C:white}X#2#{})"
                }
            },
            j_bs_rc_heatwave = {
                name = 'Heatwave',
                text = {
                    "Converts one scored card to {C:attention}On Fire{}",
                    "{C:inactive,s:0.8}(Only converts unenhanced cards){}"
                }
            },
            j_bs_rc_snow_shovel = {
                name = 'Snow Shovel',
                text = {
                    "Removes {C:attention}Snow-Covered from scored cards",
                    "and gains {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
                    "(Currently at {C:chips}+#3#{} and {C:mult}+#4#{})"
                }
            },
            j_bs_rc_snow_storm = {
                name = 'Snow Storm',
                text = {
                    "{C:attention}Snow-Covered{} now gives",
                    "{C:chips}+#1#{} Chips {C:attention}per Ante{}",
                    "{C:inactive,s:0.8}(Currently {C:chips,s:0.8}+#2#{C:inactive,s:0.8} Chips){}"
                }
            },
            j_bs_rc_poison_berries = {
                name = 'Poison Berries',
                text = {
                    "For the next {C:attention}#1#{} hands, convert",
                    "one scored card to {C:attention}Poisoned{}",
                    "{C:inactive,s:0.8}(Only converts unenhanced cards){}"
                }
            },
            j_bs_rc_poisoned_joker = {
                name = 'Poisoned Joker',
                text = {
                    "{C:attention}Poisoned{} gives an extra",
                    "{C:chips}+50{} Chips"
                }
            },
            j_bs_rc_bread = {
                name = 'Loaf of Bread',
                text = {
                    "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
                    "Decreases by {C:chips}#3#{} and {C:mult}#4#{} each hand"
                }
            },
            j_bs_rc_lava = {
                name = 'Lava Bucket',
                text = {
                    "Each hand, {C:red}destroys{} an unplayed card",
                    "and gains {X:mult,C:white}+X#1#{} Mult",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult){}"
                }
            },
            j_bs_rc_hank = {
                unlock = {
					"Find this Joker from",
					"the {C:spectral}Soul{} card",
				},
                name = 'Hank',
                text = {
                    "Create a {C:attention}Food{} Joker",
                    "when {C:attention}Blind{} is selected",
                    "{C:inactive,s:0.8}(Must have room){}"
                }
            },

            -- compat --
            -- cryptid
            j_bs_rc_cry_code_egg = {
                name = 'Code Egg',
                text = {
                    "Gains {C:money}$#1#{} of sell value",
                    "every time a {C:cry_code}Code Card{} is used",
                }
            },
        },
        Other={
            -- booster packs
            p_bs_rc_item_normal_1 = {
                name = "Item Pack",
                text = {
                    "Choose {C:attention}1{} of up to",
                    "{C:attention}3 Item{} cards to hold"
                },
            },
            p_bs_rc_item_normal_2 = {
                name = "Item Pack",
                text = {
                    "Choose {C:attention}1{} of up to",
                    "{C:attention}3 Item{} cards to hold"
                },
            },
            p_bs_rc_item_jumbo_1 = {
                name = "Jumbo Item Pack",
                text = {
                    "Choose {C:attention}1{} of up to",
                    "{C:attention}5 Item{} cards to hold"
                },
            },
            p_bs_rc_item_mega_1 = {
                name = "Mega Item Pack",
                text = {
                    "Choose {C:attention}2{} of up to",
                    "{C:attention}5 Item{} cards to hold"
                },
            },

            -- alignment stickers
            bs_rc_align_none = {
                name = "Unaligned",
                text = {
                    "Card is considered {X:align_normal,C:white}Unaligned"
                }
            },
            bs_rc_align_normal = {
                name = "Normal-Aligned",
                text = {
                    "Card is considered {X:align_normal,C:white}Normal-Aligned"
                }
            },
            bs_rc_align_fire = {
                name = "Fire-Aligned",
                text = {
                    "Card is considered {X:align_fire,C:white}Fire-Aligned"
                }
            },
            bs_rc_align_water = {
                name = "Water-Aligned",
                text = {
                    "Card is considered {X:align_water,C:white}Water-Aligned"
                }
            },
            bs_rc_align_electric = {
                name = "Electric-Aligned",
                text = {
                    "Card is considered {X:align_electric}Electric-Aligned"
                }
            },
            bs_rc_align_plant = {
                name = "Plant-Aligned",
                text = {
                    "Card is considered {X:align_plant,C:white}Plant-Aligned"
                }
            },
            bs_rc_align_ice = {
                name = "Ice-Aligned",
                text = {
                    "Card is considered {X:align_ice,C:white}Ice-Aligned"
                }
            },
            bs_rc_align_light = {
                name = "Light-Aligned",
                text = {
                    "Card is considered {X:align_light,C:white}Light-Aligned"
                }
            },
            bs_rc_align_dark = {
                name = "Dark-Aligned",
                text = {
                    "Card is considered {X:align_dark,C:white}Dark-Aligned"
                }
            },
            bs_rc_align_energy = {
                name = "Energy-Aligned",
                text = {
                    "Card is considered {X:align_energy,C:white}Energy-Aligned"
                }
            },

            -- actual stickers
            bs_rc_markedfordeath = {
                name = "Marked-for-Death",
                text = {
                    "Card will be destroyed after",
                    "being played {C:attention}#1#{} times"
                }
            },
            bs_rc_markedfordeath_joker = {
                name = "Marked-for-Death",
                text = {
                    "Card will be destroyed",
                    "after {C:attention}#1#{} rounds"
                }
            },
            bs_rc_markedfordeath_consumeable = {
                name = "Marked-for-Death",
                text = {
                    "Card will be destroyed",
                    "after {C:attention}#1#{} rounds"
                }
            },
            bs_rc_markedfordeath_voucher = {
                name = "Marked-for-Death",
                text = {
                    "Voucher will be unredeemed",
                    "after {C:attention}#1#{} rounds"
                }
            },
            bs_rc_markedfordeath_booster = {
				name = "Marked-for-Death",
				text = {
					"All cards in pack",
					"are {C:attention}Marked-for-Death{}",
				},
			},

            -- undiscovered item
            undiscovered_item = {
                name = 'Not Discovered',
                text = {
                   'Purchase or use',
                   'this card in an',
                   'unseeded run to',
                   'learn what it does'
               },
            }
        },
        --Planet={},
        Spectral={
            c_bs_rc_time_candy = {
                name = "Time Candy",
                text = {
                    "-1 {C:attention}Ante{}"
                }
            },
            c_bs_rc_snowgrave = {
                name = "SnowGrave",
                text = {
                    "Converts {C:attention}all{} cards in hand",
                    "to {C:attention}Snow-Covered{}"
                }
            },
            c_bs_rc_revert = {
                name = "Revert",
                text = {
                    "Resets {C:attention}#1#{} card to",
                    "it's initial state"
                }
            },
        },
        --Stake={},
        Tag={
            tag_bs_rc_item = {
                name = 'Item Tag',
                text = {
                    "Gives a free",
                    "{C:attention}Mega Item Pack",
                },
            },
            tag_bs_rc_prize = {
                name = 'Prize Tag',
                text = {
                    "Obtain two random {C:attention}Consumables",
                    "{C:inactive}(Must have room)",
                },
            },
            tag_bs_rc_card = {
                name = 'Card Tag',
                text = {
                    "Creats a random playing card",
                    "and adds it to your deck",
                },
            },
            tag_bs_rc_burnt = {
                name = 'Burnt Tag',
                text = {
                    "Converts up to three unenhanced",
                    "cards into {C:attention}On-Fire",
                },
            },
            tag_bs_rc_align = {
                name = 'Align Tag',
                text = {
                    "Gives three randomly chosen cards",
                    "from your deck random {C:attention}Alignments",
                },
            },
            tag_bs_rc_gun = {
                name = 'Gun Tag',
                text = {
                    "Gives a free {C:attention}Gun{} and {C:attention}Bullet",
                    "{C:inactive,s:0.8}(Must have room {C:attention,s:0.8}for both{C:inactive,s:0.8})",
                },
            },
        },
        --Tarot={},
        --Voucher={},


        item={
            c_bs_rc_glove = {
                name = "Glove",
                text = {
                    "+#1# {C:blue}Hands{}"
                }
            },
            c_bs_rc_trash_can = {
                name = "Trash Can",
                text = {
                    "+#1# {C:red}Discards{}"
                }
            },
            c_bs_rc_chip = {
                name = "Chip",
                text = {
                    "+#1# {C:blue}Chip{}",
                    "{C:inactive,s:0.8}(That's it?){}"
                }
            },
            c_bs_rc_killbind = {
                name = "Kill-bind",
                text = {
                    "Makes you instantly {C:attention}lose{}.",
                    "{C:inactive,s:0.8}(Why would you use this?){}"
                }
            },
            c_bs_rc_lamp_oil = {
                name = "Lamp Oil",
                text = {
                    "Converts {C:attention}#1#{} cards to {C:attention}On Fire{}"
                }
            },
            c_bs_rc_snowball = {
                name = "Snowball",
                text = {
                    "Converts {C:attention}#1#{} cards to {C:attention}Snow-Covered{}"
                }
            },
            c_bs_rc_exp_bottle = {
                name = "Bottle o' Enchanting",
                text = {
                    "Levels up {C:attention}#1#{} randomly choosen hands.",
                    "{C:inactive,s:0.8}Will only choose discovered hands{}"
                }
            },
            c_bs_rc_poison_vial = {
                name = "Vial of Poison",
                text = {
                    "Converts {C:attention}#1#{} cards to {C:attention}Poisoned{}"
                }
            },
            c_bs_rc_heal_potion = {
                name = "Potion of Healing",
                text = {
                    "Removes {C:attention}negative Enhancements{}",
                    "from up to {C:attention}#1#{} cards"
                }
            },
            c_bs_rc_wallet = {
                name = "Wallet",
                text = {
                    "Gain between {C:money}$#1#{} and {C:money}$#2#{}"
                }
            },
            c_bs_rc_sword = {
                name = "Iron Sword",
                text = {
                    "Deals {C:attention}#1#%{} damage to the current {C:attention}Blind"
                }
            },
            c_bs_rc_gun = {
                name = "Gun",
                text = {
                    "Shoots the blind and deals {C:attention}#1#%{} damage",
                    "{C:inactive}Requires a {C:attention}Bullet{C:inactive}"
                }
            },
            c_bs_rc_gun_debug = {
                name = "Gun",
                text = {
                    "Debug mode active;",
                    "{X:mult,C:white}Fire{}{X:mult,C:white} {}{X:mult,C:white}at{}{X:mult,C:white} {}{X:mult,C:white}will.{}"
                }
            },
            c_bs_rc_bullet = {
                name = "Bullet",
                text = {
                    "Used with a {C:attention}Gun{}",
                    "{C:inactive,s:0.7}I have yet to meet someone",
                    "{C:inactive,s:0.7}who can outsmart {C:inactive,s:0.8}boolet{C:inactive,s:0.7}."
                }
            },
        },
        alt_texture = {
            bs_rc_items = {
                name = "April Fools Items",
                text = {
                    ""
                }
            },
            bs_rc_spectrals = {
                name = "April Fools Spectrals",
                text = {
                    ""
                }
            },
            bs_rc_enhancements = {
                name = "April Fools Enhancements",
                text = {
                    ""
                }
            },
            bs_rc_jokers = {
                name = "April Fools Jokers",
                text = {
                    ""
                }
            },
        },
        texture_packs = {
            bs_rc_aprilfools = {
                name = "April Fools Textures",
                text = {
                    "Textures used in the Aprill Fools update"
                }
            }
        },
    },
    misc = {
        --achievement_descriptions={},
        --achievement_names={},
        --blind_states={},
        --challenge_names={},
        --collabs={},
        dictionary={
            bs_rc_item_booster_group = "Item Pack",
            k_item = "Item",
            b_item_cards = "Items",

            bs_rc_notice_extinguish = "Extinguished!",
            bs_rc_notice_heatwave = "Enflamed!",
            bs_rc_notice_snow_shovel = "Shoveled!",
            bs_rc_notice_poisoned = "Poisoned!",
            bs_rc_notice_poison_cure = "Cured!",
            bs_rc_notice_lava_dunk = "Dunked!",
            bs_rc_notice_mfd_expire = "Doomed!",

            bs_rc_luigi_arrow = "[Arrow]!",
            bs_rc_luigi_avicii = "[Avicii]!",
            bs_rc_luigi_lonely = "[Lonely Together]!",
            bs_rc_luigi_silhouettes = "[Silhouettes]!",
            bs_rc_luigi_heaven = "[Heaven]!",
            bs_rc_luigi_fades = "[Fades Away]!",
            bs_rc_luigi_broken = "[Broken Arrows]!",
            bs_rc_luigi_wake = "[Wake Me Up]!",
            bs_rc_luigi_without = "[Without You]!",
        },
        --high_scores={},
        labels={
            bs_rc_align_none = "Unaligned",
            bs_rc_align_normal = "Normal-Aligned",
            bs_rc_align_fire = "Fire-Aligned",
            bs_rc_align_water = "Water-Aligned",
            bs_rc_align_electric = "Electric-Aligned",
            bs_rc_align_plant = "Plant-Aligned",
            bs_rc_align_ice = "Ice-Aligned",
            bs_rc_align_light = "Light-Aligned",
            bs_rc_align_dark = "Dark-Aligned",
            bs_rc_align_energy = "Energy-Aligned",
            bs_rc_markedfordeath = "Marked-for-Death",
        },
        --poker_hand_descriptions={},
        --poker_hands={},
        --quips={},
        --ranks={},
        --suits_plural={},
        --suits_singular={},
        --tutorial={},
        --v_dictionary={},
        --v_text={},
    },
}