--- a short description
-- @classmod person
local sprite = require('src.game.sprite')

local person = {}

-- class table
local Person = sprite.new{
  accuracy = 0,
  evasion = 0,
  fate = 0,
  hit_points = 100,
  movement = 5,
  strength = 0,
}

function person.new(o)
  local self = o or {}
  setmetatable(self, { __index = Person })
  return self
end

return person
