-- DECK SPRITES --
Cryptid.edeck_sprites.enhancement["m_bs_rc_snow"] = {atlas = "bs_rc_bs_decks", pos = {x = 4, y = 0}} -- snow-covered
Cryptid.edeck_sprites.enhancement["m_bs_rc_fire"] = {atlas = "bs_rc_bs_decks", pos = {x = 4, y = 1}} -- on-fire
Cryptid.edeck_sprites.enhancement["m_bs_rc_poison"] = {atlas = "bs_rc_bs_decks", pos = {x = 4, y = 2}} -- poisoned
Cryptid.edeck_sprites.sticker["bs_rc_markedfordeath"] = {atlas = "bs_rc_bs_decks", pos = {x = 5, y = 0}} -- marked for death

-- decks got removed :)

-- JOKERS --
SMODS.Joker {
    key = 'cry_code_egg',
    config = { extra = { value = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { math.floor(card.ability.extra.value) } }
    end,
    rarity = 2,
    atlas = 'bs_cjokers',
    pos = { x = 0, y = 0 },
    cost = 4,
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Code" and not context.consumeable.beginning_end then
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.value
            card:set_cost()
            return {message = localize("k_val_up"), colour = G.C.MONEY}
        end
    end,
}