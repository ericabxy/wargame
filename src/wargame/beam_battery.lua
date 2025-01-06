--- an array of particle accelerator beam projectors
-- @classmod wargame.beam_battery
local weapon_system = require('src.wargame.weapon_system')

local beam_battery = {}

-- class table
local BeamBattery = weapon_system.new{
  class = 1
}

function BeamBattery:fire_antiship(ship)
  local number_of_dice = self.class --TODO: subtract dice due to range
  local results = self:roll_d6(number_of_dice)
  local screens = math.min(ship.screens, 2)
  local hits_t = self.beam_level[screens]
  local hits = 0
  for _, result in ipairs(results) do
    hits = hits + hits_t[result]
  end
  ship:take_damage(hits)
  print(hits .. ' hits!', ship.hull_remain .. ' hull remaining')
end

function beam_battery.new(o)
  local self = o or {}
  setmetatable(self, { __index = BeamBattery })
  return self
end

return beam_battery
