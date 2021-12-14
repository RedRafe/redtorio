---------------------------------------------------------------------------
-- Barrels recipes
local barrels = {
  "crude-oil-barrel",
  "heavy-oil-barrel",
  "light-oil-barrel",
  "lubricant-barrel",
  "petroleum-gas-barrel",
  "sulfuric-acid-barrel",
  "water-barrel"
}

for _, barrel in pairs(barrels) do
  rrm.item.SetStackSize(barrel, 10)
  rrm.recipe.SetBarrelingMultiplier(barrel, 20)
end
---------------------------------------------------------------------------