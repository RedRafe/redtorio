local rrm_path_mod = "__redtorio__/"
local rrm_path_scripts = rrm_path_mod .. "runtime/"
require(rrm_path_mod .. "lib/debugger")

script.on_event(defines.events.on_player_created, rrm.debug.setup)