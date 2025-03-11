-- ITEMS --
SMODS.Booster {
    key = 'item_normal_1',
    weight = 4,
    cost = 4,
    atlas = "bs_boosters",
    pos = {x = 0, y = 0},
    config = {extra = 3, choose = 1},
    group_key = "bs_rc_item_booster_group",
    select_card = "consumeables",
    create_card = function(self, card)
        return {
            set = "item",
            soulable = true
        }
    end,
    in_pool = function(self)
        return true, {allow_duplicates = false}
    end,
}

SMODS.Booster {
    key = 'item_normal_2',
    weight = 4,
    cost = 4,
    atlas = "bs_boosters",
    pos = {x = 1, y = 0},
    config = {extra = 3, choose = 1},
    group_key = "bs_rc_item_booster_group",
    select_card = "consumeables",
    create_card = function(self, card)
        return {
            set = "item",
            soulable = true
        }
    end,
    in_pool = function(self)
        return true, {allow_duplicates = false}
    end,
}

SMODS.Booster {
    key = 'item_jumbo_1',
    weight = 3,
    cost = 6,
    atlas = "bs_boosters",
    pos = {x = 2, y = 0},
    config = {extra = 5, choose = 1},
    group_key = "bs_rc_item_booster_group",
    select_card = "consumeables",
    create_card = function(self, card)
        return {
            set = "item",
            soulable = true
        }
    end,
    in_pool = function(self)
        return true, {allow_duplicates = false}
    end,
}

SMODS.Booster {
    key = 'item_mega_1',
    weight = 2,
    cost = 7,
    atlas = "bs_boosters",
    pos = {x = 3, y = 0},
    config = {extra = 5, choose = 2},
    group_key = "bs_rc_item_booster_group",
    select_card = "consumeables",
    create_card = function(self, card)
        return {
            set = "item",
            soulable = true
        }
    end,
    in_pool = function(self)
        return true, {allow_duplicates = false}
    end,
}