-- aligned deck --

BalatroSim.vars.deck_has_aligned = false
BalatroSim.vars.deck_has_no_unaligned = false

local common_alignments = {
    "bs_rc_align_none",
    "bs_rc_align_normal",
    "bs_rc_align_fire",
    "bs_rc_align_water",
    "bs_rc_align_electric",
    "bs_rc_align_plant",
    "bs_rc_align_ice",
    "bs_rc_align_light",
    "bs_rc_align_dark"
}

local rare_alignments = {
    "bs_rc_align_energy"
}

SMODS.Back {
    key = "aligned",
    atlas = "decks",
    pos = {x = 0, y = 0},
    apply = function(self)
        BalatroSim.vars.deck_has_aligned = true
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    local align = nil
                    local rand = pseudorandom('align_deck')
                    if rand < 0.08 then
                        align = pseudorandom_element(rare_alignments, pseudoseed("align_deck"))
                    else
                        align = pseudorandom_element(common_alignments, pseudoseed("align_deck"))
                    end
                    BalatroSim.add_alignment("", G.playing_cards[i], align)
                end
                return true
            end
        }))
    end
}