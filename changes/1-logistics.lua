---------------------------------------------------------------------------
-- -- -- LOGISTICS
---------------------------------------------------------------------------
---- CHESTS
---- LOGISTIC CHESTS
---- STORAGE TANK
---- BELTS
-- Transport belts
rrm.recipe.SetIngredients("fast-transport-belt", {{"transport-belt", 2}, {"iron-gear-wheel", 1}})
rrm.recipe.SetIngredients("express-transport-belt", {{"fast-transport-belt", 2}, {"iron-gear-wheel", 2}})

-- Underground belts
rrm.entity.GetEntity("underground-belt", "underground-belt").max_distance = 9
rrm.entity.GetEntity("underground-belt", "fast-underground-belt").max_distance = 9
rrm.recipe.SetIngredients("underground-belt", {{"transport-belt", 10}, {"iron-plate", 5}})
rrm.recipe.SetIngredients("fast-underground-belt", {{"underground-belt", 2}, {"iron-plate", 15}})
rrm.recipe.SetIngredients("express-underground-belt", {{"fast-underground-belt", 2}, {"iron-plate", 35}})

-- Splitters
rrm.recipe.SetIngredients("splitter", {{"transport-belt", 2}, {"iron-plate", 5}, {"electronic-circuit", 3}})
rrm.recipe.SetIngredients("fast-splitter", {{"splitter", 1}, {"iron-plate", 10}, {"electronic-circuit", 5}})
rrm.recipe.SetIngredients("express-splitter", {{"fast-splitter", 1}, {"iron-plate", 10}, {"advanced-circuit", 5}})

---- INSERTERS
---- POWER POLES
---- PIPES
---- PUMP
---- RAILS
---- TRAINS
---- VEICHLES
---- ROBOTS
---- ROBOPORT
---- LAMP
---- COMBINATORS
---- CONCRETE

---------------------------------------------------------------------------
