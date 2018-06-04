local Renderer = {}

Renderer.rectangle = function(mode, posX, posY, width, height, radiusX, radiusY)
    love.graphics.rectangle(mode, posX, posY, width, height, radiusX, radiusY)
end

Renderer.setColor = function(color)
    love.graphics.setColor(color[1] / 255, color[2] / 255, color[3] / 255, color[4])
end

Renderer.getColor = function()
    local r, g, b, a = love.graphics.getColor()

    return { r * 255, g * 255, b * 255, a }
end

Renderer.setFont = function(font)
    if font == nil then return end

    love.graphics.setFont(font)
end

Renderer.print = function(text, posX, posY, angle, scaleX, scaleY, skewX, skewY, wrap, align)
    if wrap == nil and align == nil then
        love.graphics.print(text, posX, posY, angle, scaleX, scaleY, 0, 0, skewX, skewY)
    else
        love.graphics.print(text, posX, posY, wrap, align, angle, scaleX, scaleY, 0, 0, skewX, skewY)
    end
end

Renderer.translateMouseButton = function(button)
    return button
end

Renderer.translateTextAlign = function(align)
    return align
end

return Renderer