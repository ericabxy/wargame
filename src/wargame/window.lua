--- rectangle representing visible area on screen
-- @classmod window
local color = require('src.game.color')

local window = {}

-- class table
local Window = {
  x = 0,
  y = 0,
  width = 320,
  height = 200
}

function Window:paint()
  love.graphics.setColor(color.yellow)
  love.graphics.rectangle('line', 0, 0, self.width, self.height)
end

function window.new(o)
  local self = o or {}
  setmetatable(self, { __index = Window })
  return self
end

return window
