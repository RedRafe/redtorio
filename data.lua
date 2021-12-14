rrm = {}
rrm.prefix = "rrm-"
rrm.base = "__redtorio__/"
rrm.internal_name = "redtorio"

local p_library = rrm.base .. "lib/"
local p_vanilla = rrm.base .. "vanilla/"

require(p_library .. "__init__")

---------------------------------------------------------------------------

require(p_vanilla .. "combat")
require(p_vanilla .. "intermediates")
require(p_vanilla .. "logistics")
require(p_vanilla .. "production")