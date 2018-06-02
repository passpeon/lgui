local Window = LGUI.class(LGUI.Element, function(self, parent)
    self.super.init(self, parent)

    self.title = LGUI.Panel(self)
    self.body = LGUI.Panel(self)
    self.skin = nil

    self.title.onMouseDrag = function(selfTitle, x, y, dx, dy, button)
        self:setPosition(self.posX + dx, self.posY + dy)
    end

    self.height = 100
    self.width = 100

    self.childrenContainer = self.body
    self:applySkin(LGUI.skin.Window)
end)

function Window:setDimensions(width, height)
    self.title:setDimensions(width, self.skin.title.height)
    self.body:setDimensions(width, height - self.skin.title.height)
end

function Window:applySkin(skin)
    self.skin = skin

    -- Colors
    self.title:applySkin(skin.title)
    self.body:applySkin(skin.body)

    -- Dimensions of titlebar
    local width, height = self:getDimensions()
    self:setDimensions(width, height)

    -- Position body below titlebar
    self.body:setPosition(0, self.title.height)
end

LGUI.Window = Window