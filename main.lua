-- GENERAL --

-- the mod
BalatroSim = SMODS.current_mod

BalatroSim.vars = {}

-- ATLASES --
-- joker atlas
SMODS.Atlas {
    key = "jokers",
    path = "jokers.png",
    px = 71,
    py = 95
}

-- blind atlas
SMODS.Atlas {
    key = "blinds",
    path = "blinds.png",
    px = 34,
    py = 34,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21
}

-- enhancement atlas
SMODS.Atlas {
    key = "enhancements",
    path = "enhancements.png",
    px = 71,
    py = 95
}

-- consumeable atlas
SMODS.Atlas {
    key = "consumeables",
    path = "consumeables.png",
    px = 71,
    py = 95
}

-- booster atlas
SMODS.Atlas {
    key = "boosters",
    path = "boosters.png",
    px = 71,
    py = 95
}

-- alignment atlas
SMODS.Atlas {
    key = "alignments",
    path = "alignments.png",
    px = 71,
    py = 95
}

-- tag atlas
SMODS.Atlas {
    key = "tags",
    path = "tags.png",
    px = 34,
    py = 34
}

-- deck atlas
SMODS.Atlas {
    key = "decks",
    path = "decks.png",
    px = 71,
    py = 95
}

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

-- ALIGNMENTS --
NFS.load(SMODS.current_mod.path .. 'scripts/alignments.lua')()

-- BLINDS --
NFS.load(SMODS.current_mod.path .. 'scripts/blinds.lua')()

-- JOKERS --
NFS.load(SMODS.current_mod.path .. 'scripts/jokers.lua')()

-- CONSUMEABLES --
NFS.load(SMODS.current_mod.path .. 'scripts/consumeables/items.lua')()

-- ENHANCEMENTS --
NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/snow.lua')()
NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/hardite.lua')()
NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/soaked.lua')()
NFS.load(SMODS.current_mod.path .. 'scripts/enhancements/fire.lua')()

-- BOOSTERS --
NFS.load(SMODS.current_mod.path .. 'scripts/boosters.lua')()

-- TAGS --
NFS.load(SMODS.current_mod.path .. 'scripts/tags.lua')()

-- DECKS --
NFS.load(SMODS.current_mod.path .. 'scripts/decks.lua')()