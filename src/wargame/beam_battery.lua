--- a short description
-- @classmod wargame.beam_battery

local beam_battery = {}

-- class table
local BeamBattery = {
  class = 1
}

function BeamBattery:fire(ship)
  local tab = {0, 0, 0, 1, 1, 2}
  local damage = 0
  for x = 1, self.class do
    local roll = love.math.random(1, 6)
    damage = damage + tab[roll]
  end
  ship.hull = ship.hull - damage
end

function beam_battery.new(o)
  local self = o or {}
  setmetatable(self, { __index = BeamBattery })
  return self
end

return beam_battery
