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

    -- State
    self.hover = false
    self.pressed = {
        [1] = false,
        -- ToDo: Enums, all relevant mouse buttons
    }

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

function Element:onMouseEnter()
    -- User implementation
end

function Element:onMouseLeave()
    -- User implementation
end

function Element:onMouseDown(button)
    -- User implementation
end

function Element:onMouseUp(button)
    -- User implementation
end

function Element:onMouseDrag(x, y, dx, dy, button)
end

function Element:handleMousePressed(x, y, button)
    -- Mouse move (= sets hover) always happens before press
    if not self.hover then return false end

    -- First, see if any child handles the event
    local childHandled = false

    for idx = #self.children, 1, -1 do
        if self.children[idx]:handleMousePressed(x, y, button) then
            childHandled = true
            break
        end
    end

    -- If not, we handle it
    if not childHandled then
        self:onMouseDown(button)
        self.pressed[button] = true

        return true
    end

    return false
end

function Element:handleMouseReleased(button)
    -- Check self
    if self.pressed[button] then
        self.pressed[button] = false
        self:onMouseUp(button)

        return true
    end

    -- Check children
    for idx = #self.children, 1, -1 do
        if self.children[idx]:handleMouseReleased(button) then
            return true
        end
    end

    return false
end

function Element:handleMouseMoved(x, y, dx, dy)
    local absoluteX, absoluteY = self:getAbsolutePosition()

    local wasHover = self.hover
    self.hover = false

    -- Check self
    if x >= absoluteX and x <= absoluteX + self.width then
        if y >= absoluteY and y <= absoluteY + self.height then
            self.hover = true
        end
    end

    -- Check children
    for idx = #self.children, 1, -1 do
        if self.children[idx]:handleMouseMoved(x, y, dx, dy) then
            self.hover = true
        end
    end

    -- Handle enter / leave event
    if self.hover and not wasHover then
        self:onMouseEnter()
    elseif not self.hover and wasHover then
        self:onMouseLeave()
    end

    -- Handle drag event
    if self.hover and wasHover then
        for button, state in ipairs(self.pressed) do
            if state then
                self:onMouseDrag(x, y, dx, dy, button)
            end
        end
    end

    -- Used to determine whether this event was handled
    return self.hover
end


function Element:applySkin(skin)
    error("Every element needs to implement applySkin")
end

LGUI.Element = Element