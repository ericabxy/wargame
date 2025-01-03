--- texture with circular physics
-- @classmod game.circle_sprite
local sprite = require('src.game.sprite')

local circle_sprite = {}

-- class table
local CircleSprite = sprite.new{
  radius = 8,
  angle = 0,
  arc = math.pi / 8,  -- 16 rotations in texture
  offset = math.pi / 2,  -- sprite starts facing up
}

--- draw shape for debugging purposes.
-- @param[opt] x point of origin
-- @param[opt] y point of origin
function CircleSprite:paint(x, y)
  local x1, y1 = x and x + self.x or self.x, y and y + self.y or self.y
  local x2 = x1 + math.cos(self.angle) * self.radius
  local y2 = y1 + math.sin(self.angle) * self.radius
  love.graphics.setColor(self.color)
  love.graphics.circle('line', x1, y1, self.radius)
  love.graphics.line(x1, y1, x2, y2)
end

function CircleSprite:is_intersecting(circle)
  return (self.x - circle.x) ^ 2 +
         (self.y - circle.y) ^ 2 <=
         (self.radius + circle.radius) ^ 2
end

function CircleSprite:set_angle(angle)
  self.angle = angle % (2 * math.pi)
  local offset = (angle + self.offset) % (2 * math.pi)
  local x = math.floor(offset / self.arc) * self.width
  self.quad:setViewport(x, 0, self.width, self.height)
end

-- @param texture LÖVE Texture object
function CircleSprite:set_texture(texture)
  local width, height = texture:getDimensions()
  self.texture = texture
  self.quad = love.graphics.newQuad(0, 0, self.width, self.height, width, height)
  self.arc = math.pi / math.floor(width / self.width / 2)
  self.ox = -self.width / 2
  self.oy = -self.height / 2
  return self
end

function circle_sprite.new(o)
  local self = o or {}
  setmetatable(self, { __index = CircleSprite })
  return self
end

return circle_sprite
