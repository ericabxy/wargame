--- a short description
-- @classmod {modname}

local {modname} = {{}}

-- class table
local {classname} = {{}}

function {modname}.new(o)
  local self = o or {{}}
  setmetatable(self, {{ __index = {classname} }})
  return self
end

return {modname}
