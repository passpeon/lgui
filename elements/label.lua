local Label = LGUI.class(LGUI.Element, function(self, parent)
    self.super.init(self, parent)

    self.text = "Label"
    self.font = nil
    self.color = nil

    self.angle = 0

    self.scaleX = 1
    self.scaleY = 1

    self.skewX = 0
    self.skewY = 0

    self.wrap = nil
    self.align = nil

    self:applySkin(LGUI.skin.Label)
end)

function Label:applySkin(skin)
    self.font = skin.font
    self.color = skin.color
    self.angle = skin.angle
    self.scaleX = skin.scaleX
    self.scaleY = skin.scaleY
    self.skewX = skin.skewX
    self.skewY = skin.skewY
    self.wrap = skin.wrap
    self.align = skin.align
end

-- ToDo: width and height property required for some events
function Label:setText(text)
    self.text = text
end

function Label:getText()
    return self.text
end

function Label:setColor(color)
    self.color = color
end

function Label:getColor()
    return self.color
end

function Label:setAngle(angle)
    self.angle = angle
end

function Label:getAngle()
    return self.angle
end

function Label:setScale(scaleX, scaleY)
    self.scaleX = scaleX
    self.scaleY = scaleY or scaleX
end

function Label:getScale()
    return self.scaleX, self.scaleY
end

function Label:setSkew(skewX, skewY)
    self.skewX = skewX
    self.skewY = skewY
end

function Label:getSkew()
    return self.skewX, self.skewY
end

function Label:setWrapping(wrap, align)
    self.wrap = wrap
    self.align = align
end

function Label:getWrapping()
    return self.wrap, self.align
end

function Label:paint()
    local posX, posY = self:getAbsolutePosition()

    LGUI.renderer.setColor(self.color)
    LGUI.renderer.setFont(self.font)
    LGUI.renderer.print(self.text, posX, posY, self.angle, self.scaleX, self.scaleY, self.skewX, self.skewY, self.wrap, self.aligh)
end

LGUI.Label = Label
