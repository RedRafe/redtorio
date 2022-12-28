rrm = {}
rrm.prefix = "rrm-"
rrm.base = "__redtorio__/"
rrm.internal_name = "redtorio"
rrm.name = "Redtorio"

-- Init paths
rrm_path_mod      = rrm.base
rrm_path_library  = rrm_path_mod .. "lib/"
rrm_path_changes  = rrm_path_mod .. "changes/"
rrm_path_content  = rrm_path_mod .. "prototypes/"
rrm_path_graphic  = rrm_path_mod .. "images/"
rrm_path_g_icons  = rrm_path_graphic .. "icons/"
rrm_path_g_techs  = rrm_path_graphic .. "technology/"
rrm_path_g_entity = rrm_path_graphic .. "entity"

-- Import library
require(rrm_path_library .. "__init__")

---------------------------------------------------------------------------

-- Extend content
require(rrm_path_content .. "modules")
require(rrm_path_content .. "repair-packs")

---------------------------------------------------------------------------