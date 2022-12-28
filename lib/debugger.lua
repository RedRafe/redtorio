if not rrm then rrm = {} end
if not rrm.debug then rrm.debug = {} end
rrm.debug.state = true

local function print_debug_message(message)
  if rrm.debug.state == true then
    log(message)
  end
end

local function print_game_message(message)
  if rrm.debug.state == true then
    game.print(message)
  end
end

local function setup_new_game(e)
  game.print("Debug mode enabled")
  game.forces.player.research_all_technologies()
  game.forces.player[e.player_index].cheat_mode = true
  --game.forces.player.cheat_mode = true
end

rrm.debug.log = print_debug_message
rrm.debug.print = print_game_message
rrm.debug.setup = setup_new_game