-- GENERAL --

-- the mod
BalatroSim = SMODS.current_mod

BalatroSim.vars = {}

-- ATLASES --

-- logo
SMODS.Atlas {
    key = "modicon",
	path = "logo.png",
	px = 32,
	py = 32
}

-- joker atlas
SMODS.Atlas {
    key = "bs_jokers",
    path = "jokers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "bs_cjokers",
    path = "jokers_compat.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "bs_legendaries",
    path = "legendaries.png",
    px = 71,
    py = 95
}

-- blind atlas
SMODS.Atlas {
    key = "bs_blinds",
    path = "blinds.png",
    px = 34,
    py = 34,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21
}

-- enhancement atlas
SMODS.Atlas {
    key = "bs_enhancements",
    path = "enhancements.png",
    px = 71,
    py = 95
}

-- consumable atlas
SMODS.Atlas {
    key = "bs_consumables",
    path = "consumables.png",
    px = 71,
    py = 95
}

-- booster atlas
SMODS.Atlas {
    key = "bs_boosters",
    path = "boosters.png",
    px = 71,
    py = 95
}

-- alignment atlas
SMODS.Atlas {
    key = "bs_alignments",
    path = "alignments.png",
    px = 71,
    py = 95
}

-- sticker atlas
SMODS.Atlas {
    key = "bs_stickers",
    path = "stickers.png",
    px = 71,
    py = 95
}

-- tag atlas
SMODS.Atlas {
    key = "bs_tags",
    path = "tags.png",
    px = 34,
    py = 34
}

-- deck atlas
SMODS.Atlas {
    key = "bs_decks",
    path = "decks.png",
    px = 71,
    py = 95
}

-- good ol' talisman
if not to_big then
    to_big = function(num)
        return num
    end
end

-- COLORS --
-- borrowed from Pokermon (specifically https://github.com/InertSteak/Pokermon/blob/main/pokesprites.lua#L268C1-L290C4 )
local old_colors = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        old_colors()
    end
    G.ARGS.LOC_COLOURS["align_none"] = HEX("ABABAB");
    G.ARGS.LOC_COLOURS["align_normal"] = HEX("ABABAB");
    G.ARGS.LOC_COLOURS["align_fire"] = HEX("E67F17");
    G.ARGS.LOC_COLOURS["align_water"] = HEX("1717E6");
    G.ARGS.LOC_COLOURS["align_electric"] = HEX("E6E617");
    G.ARGS.LOC_COLOURS["align_plant"] = HEX("17E617");
    G.ARGS.LOC_COLOURS["align_ice"] = HEX("17E6E6");
    G.ARGS.LOC_COLOURS["align_light"] = HEX("B4B4B4");
    G.ARGS.LOC_COLOURS["align_dark"] = HEX("474747");
    G.ARGS.LOC_COLOURS["align_energy"] = HEX("D517E6");
    return old_colors(_c, _default)
end

-- FUNCTIONS --

-- SOUNDS --
SMODS.Sound {
    key = "gun_shoot",
    path = "pistol_shoot.wav"
}

-- ALIGNMENTS --
NFS.load(SMODS.current_mod.path .. 'scripts/alignments.lua')()

-- BLINDS --
NFS.load(SMODS.current_mod.path .. 'scripts/blinds.lua')()

-- CONSUMABLES --
NFS.load(SMODS.current_mod.path .. 'scripts/consumables/items.lua')()
NFS.load(SMODS.current_mod.path .. 'scripts/consumables/spectrals.lua')()

-- ENHANCEMENTS --
NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/snow.lua')()
--NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/hardite.lua')()
--NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/soaked.lua')()
NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/fire.lua')()
NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/poison.lua')()

-- STICKERS --
NFS.load(SMODS.current_mod.path .. 'scripts/stickers.lua')()

-- JOKERS --
NFS.load(SMODS.current_mod.path .. 'scripts/jokers.lua')()
NFS.load(SMODS.current_mod.path .. 'scripts/legendaries.lua')()

-- BOOSTERS --
NFS.load(SMODS.current_mod.path .. 'scripts/boosters.lua')()

-- TAGS --
NFS.load(SMODS.current_mod.path .. 'scripts/tags.lua')()

-- DECKS --
NFS.load(SMODS.current_mod.path .. 'scripts/decks.lua')()

-- COMPAT --
if (SMODS.Mods["Cryptid"] or {}).can_load then
    NFS.load(SMODS.current_mod.path .. 'scripts/compat/cryptid.lua')()
end