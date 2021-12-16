---------------------------------------------------------------------------
-- -- -- REPAIR PACKS
---------------------------------------------------------------------------
data:extend({
  -- Wood + copper + iron
  {
    type = "recipe",
    name = rrm.prefix .. "wooden-repair-pack-2",
    localised_name = "Wooden repair pack",
    energy_required = 0.5,
    ingredients =
    {
      {"wood", 2},
      {"copper-plate", 2},
      {"iron-plate", 2}
    },
    result = "repair-pack"
  }
})
---------------------------------------------------------------------------
