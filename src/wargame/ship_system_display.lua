--- dialog window showing ship status
-- @classmod wargame.ship_system_display
local charmap = require('src.game.charmap')

local ship_system_display = {}

-- class table
local ShipSystemDisplay = charmap.new{
  map =
    '9111111113'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    '8000000002'..
    'C444444446',
  charwidth = 6,
  padding = 1,
  width = 10,
}

function ShipSystemDisplay:set_ship(ship)
  local damage_track = ''
  for x = 1, ship.hull_points do
    local box = ship.hull_points - ship.hull_remain >= x and 'x' or 'o'
    damage_track = damage_track .. box
  end
  for n = 1, #damage_track do
    local begin = self.width * 9
    local right = self.width - self.padding
    local x = (n % right) + math.floor(n / right) * (self.width + self.padding)
    self.map =
      string.sub(self.map, 1, x + begin) ..
      string.sub(damage_track, n, n) ..
      string.sub(self.map, x + begin + 2)
  end
end

function ShipSystemDisplay:set_texture()
end

function ship_system_display.new(o)
  local self = o or {}
  setmetatable(self, { __index = ShipSystemDisplay })
  return self
end

return ship_system_display
