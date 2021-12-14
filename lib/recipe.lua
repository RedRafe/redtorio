if not rrm.recipe then rrm.recipe = {} end

local str  = tostring
local prfx = rrm.prefix
local push = table.insert
local copy = table.deepcopy

---------------------------------------------------------------------------

local function GetRecipe(name)
  local recipe = data.raw.recipe[name]
  if not recipe then
    log("Error with recipe: " .. name)
    return {}
  end
  return recipe
end

local function GetIngredients(name)
  local recipe = GetRecipe(name)
  if recipe.ingredients then
    return recipe.ingredients
  end
  if recipe.normal and recipe.normal.ingredients then
    return recipe.normal.ingredients
  end
end

local function SetIngredients(name, ingredients)
  local recipe = GetRecipe(name)
  if recipe.ingredients then
    recipe.ingredients = ingredients
  end
  if recipe.normal and recipe.normal.ingredients then
    recipe.normal.ingredients = ingredients
  end
end

local function AddIngredients(name, ingredients)
  local recipe = GetRecipe(name)
  for _, ingredient in pairs(ingredients) do
    if recipe then
      if recipe.ingredients then
        push(recipe.ingredients, ingredient)
      end
      if recipe.normal and recipe.normal.ingredients then
        push(recipe.normal.ingredients, ingredient)
      end
    end
  end
end

local function SetResultsMultiplier(name, multiplier)
  local recipe = GetRecipe(name)
  if recipe.normal then 
    if recipe.normal.result then
      local count = recipe.normal.result_count or 1
      recipe.normal.results = {{ name = recipe.normal.result, amount = count * multiplier }}
      recipe.normal.result = nil
      recipe.normal.result_count = nil
    else
      for i, result in pairs(recipe.normal.results) do
        if result.normal.amount then
          recipe.normal.results[i].amount = result[i].amount * multiplier
        else
          recipe.normal.results[i][2] = result[i][2].amount * multiplier
        end
      end
    end
  else
    if recipe.result then
      local count = recipe.result_count or 1
      recipe.results = {{ name = recipe.result, amount = count * multiplier }}
      recipe.result = nil
      recipe.result_count = nil
    else
      for i, result in pairs(recipe.results) do
        if result.amount then
          recipe.results[i].amount = result[i].amount * multiplier
        else
          recipe.results[i][2] = result[i][2] * multiplier
        end
      end
    end
  end
end

local function SetIngredientsMultiplier(name, multiplier)
  local ingredients = GetIngredients(name)
  for i, ingredient in pairs(ingredients) do
    if ingredient.amount then
      ingredients[i].amount = ingredient.amount * multiplier
    else
      ingredients[i][2] = ingredient[2] * multiplier
    end
  end
end

local function SetRecipeMultiplier(name, multiplier)
  SetResultsMultiplier(name, multiplier)
  SetIngredientsMultiplier(name, multiplier)
end

local function CreateStackedRecipe(name, multiplier)
  local recipe = copy(GetRecipe(name))
  recipe.name = prfx .. recipe.name .. "-" .. str(multiplier)
  recipe.energy_required = recipe.energy_required * multiplier
  data:extend({ recipe })
  SetResultsMultiplier(recipe.name, multiplier)
  SetIngredientsMultiplier(recipe.name, multiplier)
end

local function SetTimeMultiplier(name, multiplier)
  local recipe = GetRecipe(name)
  recipe.energy_required = recipe.energy_required * multiplier
end

local function SetBarrelingMultiplier(name, multiplier)
  local fill_recipe = GetRecipe("fill-" .. name)
  local empty_recipe = GetRecipe("empty-" .. name)
  for i, ingredient in pairs(fill_recipe.ingredients) do
    if ingredient.name ~= "empty-barrel" then
      fill_recipe.ingredients[i].amount = ingredient.amount * multiplier
    end
  end
  fill_recipe.energy_required = fill_recipe.energy_required * multiplier
  for i, ingredient in pairs(empty_recipe.results) do
    if ingredient.name ~= "empty-barrel" then
      empty_recipe.results[i].amount = ingredient.amount * multiplier
    end
  end
  --empty_recipe.result_count = (empty_recipe.result_count or 1) * multiplier
  empty_recipe.energy_required = fill_recipe.energy_required * multiplier
end

---------------------------------------------------------------------------

rrm.recipe.GetRecipe = GetRecipe
rrm.recipe.GetIngredients = rrm.recipe.GetIngredients
rrm.recipe.SetTimeMultiplier = SetTimeMultiplier
rrm.recipe.SetIngredients = SetIngredients
rrm.recipe.AddIngredients = AddIngredients
rrm.recipe.CreateStackedRecipe = CreateStackedRecipe
rrm.recipe.SetRecipeMultiplier = SetRecipeMultiplier
rrm.recipe.SetResultsMultiplier = SetResultsMultiplier
rrm.recipe.SetIngredientsMultiplier = SetIngredientsMultiplier
rrm.recipe.SetBarrelingMultiplier = SetBarrelingMultiplier
