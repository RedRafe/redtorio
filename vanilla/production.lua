---------------------------------------------------------------------------
-- -- -- PRODUCTION
---------------------------------------------------------------------------
---- REPAIR PACKS

---- STEAM POWER
-- Boiler
-- Steam engine
rrm.item.SetStackSize("steam-engine", 50)

---- SOLAR POWER
-- Solar panel
rrm.entity.GetEntity("solar-panel", "solar-panel").production = "540kW"
rrm.recipe.SetIngredientsMultiplier("solar-panel", 9)
-- Accumulator
rrm.entity.GetEntity("accumulator", "accumulator").energy_source =
  {
    type = "electric",
    buffer_capacity = "45MJ",
    usage_priority = "tertiary",
    input_flow_limit = "2700kW",
    output_flow_limit = "2700kW"
  }
rrm.recipe.SetIngredientsMultiplier("accumulator", 9)

---- NUCLEAR POWER
-- Steam turbine
rrm.item.SetStackSize("steam-turbine", 50)
if not mods["nuclear-overhaul"] then
  -- Heat pipe
  heat_pipe = rrm.entity.GetEntity("heat-pipe", "heat-pipe")
  heat_pipe.max_health = 100
  heat_pipe.heat_buffer.specific_heat = "6MJ"
  heat_pipe.heat_buffer.max_transfer = "6GW"
  -- Heat exchanger
  heat_exchange = rrm.entity.GetEntity("boiler", "heat-exchanger")
  heat_exchange.max_health = 250
  heat_exchange.target_temperature = 415
  heat_exchange.energy_consumption = "50MW"
  heat_exchange.energy_source.specific_heat = "5MJ"
  heat_exchange.energy_source.max_transfer = "10GW"
  heat_exchange.energy_source.min_working_temperature = 415
end

---- MINING DRILLS
-- Oil pumpjack
rrm.entity.GetEntity("mining-drill", "pumpjack").energy_source =
  {
    type = "electric",
    emissions_per_minute = 50,
    usage_priority = "secondary-input"
  }

---- OFFSHORE PUMP

---- FURNACES
rrm.entity.GetEntity("furnace", "electric-furnace").module_specification = { module_slots = 1 }

---- ASSEMBLING MACHINES
-- ASM
local asm1 = rrm.entity.GetEntity("assembling-machine", "assembling-machine")
local asm2 = rrm.entity.GetEntity("assembling-machine", "assembling-machine-2")
local asm3 = rrm.entity.GetEntity("assembling-machine", "assembling-machine-3")
asm2.module_specification = { module_slots = 1 }
asm2.module_specification = { module_slots = 2 }
asm2.energy_source = { type = "electric", usage_priority = "secondary-input", emissions_per_minute = 6 }
asm3.energy_source = { type = "electric", usage_priority = "secondary-input", emissions_per_minute = 10 }
-- Oil refinery
rrm.entity.GetEntity("assembling-machine", "oil-refinery").module_specification = { module_slots = 2 }
rrm.item.SetStackSize("oil-refinery", 50)
-- Chemical plant
rrm.entity.GetEntity("assembling-machine", "chemical-plant").module_specification = { module_slots = 2 }
rrm.item.SetStackSize("chemical-plant", 50)

---- CENTRIFUGES
rrm.entity.GetEntity("assembling-machine", "centrifuge").module_specification = { module_slots = 1 }

---- LABS
rrm.entity.GetEntity("lab", "lab").module_specification = { module_slots = 2 }

---- BEACON
rrm.item.SetStackSize("beacon", 50)
rrm.entity.GetEntity("beacon", "beacon").module_specification =
{
  module_slots = 1,
  module_info_icon_shift = {0, 0},
  module_info_multi_row_initial_height_modifier = -0.3,
  module_info_max_icons_per_row = 2
}

---- MODULES
-- Effectivity
eff1 = { consumption = {bonus = -0.6} }
eff2 = { consumption = {bonus = -0.8} }
eff3 = { consumption = {bonus = -1.0} }
rrm.entity.GetEntity("module", "effectivity-module").effect = eff1
rrm.entity.GetEntity("module", "effectivity-module-2").effect = eff2
rrm.entity.GetEntity("module", "effectivity-module-3").effect = eff3
-- Productivity
prod1 = { productivity = {bonus = 0.08}, consumption = {bonus = 0.8}, pollution = {bonus = 0.10}, speed = {bonus = -0.10} }
prod2 = { productivity = {bonus = 0.12}, consumption = {bonus = 1.2}, pollution = {bonus = 0.14}, speed = {bonus = -0.20} }
prod3 = { productivity = {bonus = 0.20}, consumption = {bonus = 1.6}, pollution = {bonus = 0.20}, speed = {bonus = -0.30} }
rrm.entity.GetEntity("module", "productivity-module").effect = prod1
rrm.entity.GetEntity("module", "productivity-module-2").effect = prod2
rrm.entity.GetEntity("module", "productivity-module-3").effect = prod3
-- Speed
speed1 = { speed = {bonus = 0.4}, consumption = {bonus = 1.0} }
speed2 = { speed = {bonus = 0.6}, consumption = {bonus = 1.2} }
speed3 = { speed = {bonus = 1.0}, consumption = {bonus = 1.4} }
rrm.entity.GetEntity("module", "speed-module").effect = speed1
rrm.entity.GetEntity("module", "speed-module-2").effect = speed2
rrm.entity.GetEntity("module", "speed-module-3").effect = speed3

---- ROCKET SILO
rrm.entity.GetEntity("rocket-silo", "rocket-silo").rocket_result_inventory_size = 5
rrm.entity.GetEntity("rocket-silo", "rocket-silo").module_specification = { module_slots = 2 }
