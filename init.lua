LGUI = {}
LGUI.BASE_PATH = ...
LGUI.renderer = nil
LGUI.skin = nil

-- Libs
LGUI.class = require(LGUI.BASE_PATH .. ".libs.class")

-- Load elements
require(LGUI.BASE_PATH .. ".elements.element")
require(LGUI.BASE_PATH .. ".elements.window")
require(LGUI.BASE_PATH .. ".elements.panel")

-- Holds all top-level elements (eg. windows)
LGUI._elements = {}

LGUI.init = function(renderer, skin)
    LGUI.renderer = renderer
    LGUI.skin = skin
end

LGUI.draw = function()
    local color = LGUI.renderer.getColor()

    for _, element in ipairs(LGUI._elements) do
        element:draw()
    end

    LGUI.renderer.setColor(color)
end

LGUI.setSkin = function(skin)
    LGUI.skin = skin
end

-- Events are handled backwards, as LGUI._elements acts as z-index
LGUI.onMousePressed = function(x, y, button)
    for idx = #LGUI._elements, 1, -1 do
        if LGUI._elements[idx]:handleMousePressed(x, y, button) then
            return
        end
    end
end

LGUI.onMouseReleased = function(button)
    for idx = #LGUI._elements, 1, -1 do
        if LGUI._elements[idx]:handleMouseReleased(button) then
            return
        end
    end
end

LGUI.onMouseMoved = function(x, y, dx, dy)
    for idx = #LGUI._elements, 1, -1 do
        if LGUI._elements[idx]:handleMouseMoved(x, y, dx, dy) then
            return
        end
    end
end