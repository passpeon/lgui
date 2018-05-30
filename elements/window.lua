local class = require(LGUI_BASE_PATH .. ".libs.class")

local Element = require(LGUI_BASE_PATH .. ".elements.element")

local Window = class(Element, function(self, gui)
    Element.init(self, gui)
end)

function Window:draw()
    local posX, posY = self:getPosition(true)
    self.gui.renderer.rectangle("fill", posX, posY, self.width, self.height, 0, 0)
end

return Window