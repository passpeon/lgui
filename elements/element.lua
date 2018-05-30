local class = require(... .. "libs/class")

local Element = class(function(self, gui)
    self.gui = gui

    self.parent = nil
    self.children = {}

    self.visible = true

    self.posX = 0
    self.posY = 0

    self.width = 0
    self.height = 0

    table.insert(self.gui._elements, self)
end)

function Element:hasParent()
    return self.parent ~= nil
end

function Element:setVisible(state)
    self.visible = state
end

function Element:isVisible()
    return self.visible
end

function Element:setPosition(posX, posY)
    self.posX = posX
    self.posY = posY
end

function Element:getPosition(absolute)
    if absolute and self:hasParent() then
        local parentX, parentY = self.parent.getPosition(true)

        return self.posX + parentX, self.posY + parentY
    end

    return self.posX, self.posY
end

function Element:setDimensions(width, height)
    self.width = width
    self.height = height
end

function Element:getDimensions()
    return self.width, self.height
end

function Element:draw()
    error("Every element needs to implement draw()")
end

return Element