--- a short description
-- @classmod dialog_box
local charmap = require('src.game.charmap')

local dialog_box = {}

-- class table
local DialogBox = charmap.new{
  y = 200,
  map =
    '9111111111111111111111111111111111111113'..
    '8000000000000000000000000000000000000002'..
    '8000000000000000000000000000000000000002'..
    '8000000000000000000000000000000000000002'..
    'C444444444444444444444444444444444444446',
  charwidth = 8,
  padding = 1,
  width = 40
}

function dialog_box.new(o)
  local self = o or {}
  setmetatable(self, { __index = DialogBox })
  return self
end

return dialog_box
