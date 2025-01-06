--- a short description
-- @classmod wargame
local beam_battery = require('src.wargame.beam_battery')
local color = require('src.game.color')
local dialog_box = require('src.wargame.dialog_box')
local program = require('src.game.program')
local ship = require('src.wargame.ship')
local ship_system_display = require('src.wargame.ship_system_display')
local window = require('src.wargame.window')

local wargame = {}

-- class table
local WarGame = program.new{
  width = 256,
  height = 256,
  control_panel = false,
  display = false,
  ship_select = false,
  ships = {},
  test_weapon = beam_battery.new(),
  window = window.new()
}

function WarGame:draw(x, y)
  for _, ship in ipairs(self.ships) do
    if self.ship_select == ship then
      ship:draw_outline(self.texture1, x, y)
    end
    ship:draw(x, y)
  end
  if self.ship_select then
    local x1 = 160 - self.font1:getWidth(self.ship_select.class .. ' class') / 2
    local x2 = 160 - self.font1:getWidth(self.ship_select.role) / 2
    love.graphics.setFont(self.font1)
    love.graphics.print(self.ship_select.class .. ' class', x1, 0)
    love.graphics.print(self.ship_select.role, x2, 8)
    self.display:draw(self.ship_select)
    if self.ship_select.hull_remain < 1 then
      love.graphics.setFont(self.font1)
      love.graphics.printf('out of action', 6, 6, 60)
    end
  end
  self.control_panel:draw()
  love.graphics.setFont(self.font1)
  love.graphics.print('(1) select ship', 0, 200)
  love.graphics.print('(2) test beam battery', 0, 208)
  love.graphics.print('(3) test pulse torpedo', 0, 216)
  self.window:paint()
end

function WarGame:mouse_down(x, y, button)
  if button == 1 then
    local ship2 = ship
    for _, ship in ipairs(self.ships) do
      if ship:is_intersecting{x = x, y = y, radius = 5} then
        self.ship_select = ship
        self.display = ship_system_display.new{font = self.font0}
        self.display:set_ship(ship)
      end
    end
  else
    if self.ship_select then
      self.test_weapon:fire_antiship(self.ship_select)    
      self.display:set_ship(self.ship_select)
    end
  end
end

function WarGame:setup()
  self.control_panel = dialog_box.new{font = self.font2}
  table.insert(self.ships, ship.new{
    class = 'centauri',
    role = 'battleship',
    x = 100,
    y = 100,
    width = 56,
    height = 56,
    arc = math.pi / 18,
    radius = 30
  })
  self.ships[1]:set_texture(self.texture0)
  self.ships[1]:set_angle(math.rad( 30 ))
  table.insert(self.ships, ship.new{
    class = 'centauri',
    role = 'battleship',
    x = 200,
    y = 100,
    width = 56,
    height = 56,
    arc = math.pi / 18,
    radius = 30
  })
  self.ships[2]:set_texture(self.texture0)
  self.ships[2]:set_angle(math.rad( 30 ))
end

function wargame.new(o)
  local self = o or {}
  setmetatable(self, { __index = WarGame })
  return self
end

return wargame
