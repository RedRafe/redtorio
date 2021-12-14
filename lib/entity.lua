if not rrm.entity then rrm.entity = {} end

local str  = tostring
local prfx = rrm.prefix
local push = table.insert
local copy = table.deepcopy

---------------------------------------------------------------------------

local function GetEntity(source, name)
  local entity = data.raw[source][name]
  if not entity then
    log("Error with entity: " .. source .. "/" .. name)
    return {}
  end
  return entity
end

local function SetStackSize(source, name, size)
  GetEntity(source, name).stack_size = size
end

---------------------------------------------------------------------------

rrm.entity.GetEntity = GetEntity
rrm.entity.SetStackSize = SetStackSize
