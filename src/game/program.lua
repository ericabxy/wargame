--- a short description
-- @classmod program

local program = {}

-- class table
local Program = {}

function Program:mouse_down()
end

function Program:mouse_move()
end

function Program:mouse_up()
end

function Program:setup()
end

function program.new(o)
  local self = o or {}
  setmetatable(self, { __index = Program })
  return self
end

return program
