if not rrm.glossary then rrm.glossary = {} end

local prfx = rrm.prefix

local function icon_path(filename)
  return rrm_p_g_icons .. filename .. ".png"
end

local function entity_path(source, filename)
  return rrm_p_g_entity .. source .. "/" .. filename .. ".png"
end

local function tech_path(filename)
  return rrm_p_g_techs .. filename .. ".png"
end


rrm.glossary = {
  intermediate_1 = { name = "Module frame",   internal_name = prfx .. "intermediate-module-1", icon = icon_path("intermediate-module-1") },
  intermediate_2 = { name = "Module frame 2", internal_name = prfx .. "intermediate-module-2", icon = icon_path("intermediate-module-2") },
  intermediate_3 = { name = "Module frame 3", internal_name = prfx .. "intermediate-module-3", icon = icon_path("intermediate-module-3") },
  repair_pack_1 = { internal_name = prfx .. "wooden-repair-pack-1"},
  repair_pack_2 = { internal_name = prfx .. "wooden-repair-pack-2"},
}