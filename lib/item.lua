if not rrm.item then rrm.item = {} end

local str  = tostring
local prfx = rrm.prefix
local push = table.insert
local copy = table.deepcopy

---------------------------------------------------------------------------

local function GetItem(name)
  local item = data.raw.item[name]
  if not item then
    log("Error with item: " .. name)
    return {}
  end
  return item
end

local function SetStackSize(name, size)
  GetItem(name).stack_size = size
end

local function SetOrder(name, order)
  GetItem(name).order = order
end

---------------------------------------------------------------------------

rrm.item.SetStackSize = SetStackSize
rrm.item.SetOrder = SetOrder