local class = require(... .. "libs/class")
local Element = require(... .. "elements/element")

local Window = class(Element, function(self, gui)
    self.init(gui)
end)

function Window:draw()
    local posX, posY = self.getPosition(true)
    self.gui.renderer.rectangle("fill", posX, posY, self.width, self.height, 0, 0)
end

return Window