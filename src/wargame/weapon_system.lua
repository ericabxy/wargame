--- a short description
-- @classmod weapon_system

local weapon_system = {}

-- class table
local WeaponSystem = {
  beam_level = {
    [0] =
    {0, 0, 0, 1, 1, 2},
    {0, 0, 0, 0, 1, 2},
    {0, 0, 0, 0, 1, 1},
  },
  measurement_unit = 16,
  medium_range_band = {12, 24, 36, 48, 60}
}

function WeaponSystem:distance(x1, y1, x2, y2)
end

function WeaponSystem:roll_d6(n)
  local results = {}
  for x = 1, n do
    table.insert(results, love.math.random( 1, 6 ))
  end
  return results
end

function weapon_system.new(o)
  local self = o or {}
  setmetatable(self, { __index = WeaponSystem })
  return self
end

return weapon_system
