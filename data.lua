rrm = {}
rrm.prefix = "rrm-"
rrm.base = "__redtorio__/"
rrm.internal_name = "redtorio"

-- Init paths
rrm_p_library  = rrm.base .. "lib/"
rrm_p_vanilla  = rrm.base .. "vanilla/"
rrm_p_content  = rrm.base .. "prototypes/"
rrm_p_graphic  = rrm.base .. "images/"
rrm_p_g_icons  = rrm_p_graphic .. "icons/"
rrm_p_g_techs  = rrm_p_graphic .. "technology/"
rrm_p_g_entity = rrm_p_graphic .. "entity"

-- Import library
require(rrm_p_library .. "__init__")

---------------------------------------------------------------------------

-- Include vanilla balancing
require(rrm_p_vanilla .. "combat")
require(rrm_p_vanilla .. "intermediates")
require(rrm_p_vanilla .. "logistics")
require(rrm_p_vanilla .. "production")

-- Extend content
require(rrm_p_content .. "modules")
require(rrm_p_content .. "repair-packs")

---------------------------------------------------------------------------