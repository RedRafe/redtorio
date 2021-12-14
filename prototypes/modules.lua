---------------------------------------------------------------------------
-- -- -- INTERMEDIATE MODULES
---------------------------------------------------------------------------
local intermediate_1 = rrm.glossary.intermediate_1.internal_name
local intermediate_2 = rrm.glossary.intermediate_2.internal_name
local intermediate_3 = rrm.glossary.intermediate_3.internal_name

data:extend({
  -- -- Item
  {
    type = "item",
    name = intermediate_1,
    localised_name = rrm.glossary.intermediate_1.name,
    icon = rrm.glossary.intermediate_1.icon,
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "h[alternative-recipe]-" .. intermediate_1 .. "]",
    stack_size = 50
  },
  {
    type = "item",
    name = intermediate_2,
    localised_name = rrm.glossary.intermediate_2.name,
    icon = rrm.glossary.intermediate_2.icon,
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "h[alternative-recipe]-" .. intermediate_2 .. "]",
    stack_size = 50
  },
  {
    type = "item",
    name = intermediate_3,
    localised_name = rrm.glossary.intermediate_3.name,
    icon = rrm.glossary.intermediate_3.icon,
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "h[alternative-recipe]-" .. intermediate_3 .. "]",
    stack_size = 50
  },
  -- -- Direct recipe
  {
    type = "recipe",
    name = intermediate_1,
    energy_required = 15,
    ingredients =
    {
      {"electronic-circuit", 5},
      {"advanced-circuit", 5}
    },
    result = intermediate_1,
    enabled = false
  },
  {
    type = "recipe",
    name = intermediate_2,
    energy_required = 30,
    ingredients =
    {
      {intermediate_1, 4},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    result = intermediate_2,
    enabled = false
  },
  {
    type = "recipe",
    name = intermediate_3,
    energy_required = 60,
    ingredients =
    {
      {intermediate_1, 5},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    result = intermediate_3,
    enabled = false
  }
})

---------------------------------------------------------------------------

-- -- PRODCTIVITY LIMITATIONS
-- item productivity is whitelisted
for _, tier in pairs({"productivity-module", "productivity-module-2", "productivity-module-3"}) do
  for _, module_name in pairs({intermediate_1, intermediate_2, intermediate_3}) do
    table.insert(data.raw.module[tier].limitation, module_name)
  end
end

-- -- RECIPES
for _, module_name in pairs({"effectivity-module", "productivity-module", "speed-module"}) do
  rrm.recipe.SetIngredients(module_name        , {{intermediate_1, 1}})
  rrm.recipe.SetIngredients(module_name .. "-2", {{intermediate_2, 1}})
  rrm.recipe.SetIngredients(module_name .. "-3", {{intermediate_3, 1}})
  rrm.recipe.SetTimeRequired(module_name        , 10)
  rrm.recipe.SetTimeRequired(module_name .. "-2", 12)
  rrm.recipe.SetTimeRequired(module_name .. "-2", 15)
end

-- -- TECHNOLOGY
-- module frames are unlocked by "Modules" tech which is the common ancestor
data.raw.technology["modules"].effects =
{
  {
    type = "unlock-recipe",
    recipe = intermediate_1
  },
  {
    type = "unlock-recipe",
    recipe = intermediate_2
  },
  {
    type = "unlock-recipe",
    recipe = intermediate_3
  }
}

---------------------------------------------------------------------------