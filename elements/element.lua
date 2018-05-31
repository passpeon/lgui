local Element = LGUI.class(function(self, parent)
    self.parent = nil
    self.children = {}
    self.childrenContainer = nil

    -- Position
    self.posX = 0
    self.posY = 0

    -- Dimension
    self.width = 0
    self.height = 0

    self:setParent(parent)
end)

function Element:setParent(parent)
    -- Unregister from current parent
    if self.parent ~= nil then
        local childContainer = self.parent.childrenContainer or self.parent.children

        for idx, child in ipairs(childContainer) do
            if child == self then
                table.remove(childContainer, idx)
                break
            end
        end
    end

    self.parent = parent

    -- Register with top-level elements or new parent
    if parent == nil then
        table.insert(LGUI._elements, self)
    else
        table.insert(self.parent.childrenContainer or self.parent.children, self)
    end
end

function Element:hasParent()
    return self.parent ~= nil
end

function Element:setPosition(posX, posY)
    self.posX = posX
    self.posY = posY
end

function Element:getPosition()
    return self.posX, self.posY
end

function Element:getAbsolutePosition()
    if not self:hasParent() then
        return self:getPosition()
    end

    local parentX, parentY = self.parent:getAbsolutePosition()

    return self.posX + parentX, self.posY + parentY
end

function Element:setDimensions(width, height)
    self.width = width
    self.height = height
end

function Element:getDimensions()
    return self.width, self.height
end

function Element:draw()
    for _, child in ipairs(self.children) do
        child:draw()
    end
end

function Element:applySkin(skin)
    error("Every element needs to implement applySkin")
end

LGUI.Element = Element