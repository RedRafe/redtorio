---------------------------------------------------------------------------
-- -- -- REPAIR PACKS
---------------------------------------------------------------------------
data:extend({
  -- Wood + iron
  {
    type = "recipe",
    name = rrm.prefix .. "wooden-repair-pack-1",
    energy_required = 0.5,
    localised_name = "Wooden repair pack",
    ingredients =
    {
      {"wood", 5},
      {"iron-plate", 4}
    },
    result = "repair-pack"
  },
  -- Wood + copper
  {
    type = "recipe",
    name = rrm.prefix .. "wooden-repair-pack-2",
    localised_name = "Wooden repair pack",
    energy_required = 0.5,
    ingredients =
    {
      {"wood", 5},
      {"copper-plate", 4}
    },
    result = "repair-pack"
  }
})
---------------------------------------------------------------------------
