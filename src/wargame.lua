--- a short description
-- @classmod wargame
local beam_battery = require('src.wargame.beam_battery')
local program = require('src.game.program')
local ship = require('src.wargame.ship')

local wargame = {}

-- class table
local WarGame = program.new{
  width = 256,
  height = 256,
  ships = {},
  test_weapon = beam_battery.new()
}

function WarGame:draw(x, y)
  for _, ship in ipairs(self.ships) do
    ship:draw(x, y)
    ship:paint(x, y)
  end
end

function WarGame:mouse_down()
  self.test_weapon:fire(self.ships[ 2 ])
end

function WarGame:setup()
  table.insert(self.ships, ship.new{
    x = 100,
    y = 100,
    width = 56,
    height = 56,
    arc = math.pi / 18,
  })
  self.ships[1]:set_texture(self.texture0)
  self.ships[1]:set_angle(math.rad( 30 ))
  table.insert(self.ships, ship.new{
    x = 200,
    y = 100,
    width = 56,
    height = 56,
    arc = math.pi / 18,
  })
  self.ships[2]:set_texture(self.texture0)
  self.ships[2]:set_angle(math.rad( 30 ))
end

function wargame.new(o)
  local self = o or {}
  setmetatable(self, { __index = WarGame })
  return self
end

return wargame
