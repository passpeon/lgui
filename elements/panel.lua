local Panel = LGUI.class(LGUI.Element, function(self, parent)
    self.super.init(self, parent)

    self.width = 100
    self.height = 100

    self.color = nil

    self:applySkin(LGUI.skin.Panel)
end)

function Panel:applySkin(skin)
    self.color = skin.color
end

function Panel:setColor(color)
    self.color = color
end

function Panel:getColor()
    return self.color
end

function Panel:draw()
    local posX, posY = self:getAbsolutePosition()

    LGUI.renderer.setColor(self.color)
    LGUI.renderer.rectangle("fill", posX, posY, self.width, self.height, 0, 0)
end

LGUI.Panel = Panel
