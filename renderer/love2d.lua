local Renderer = {}

Renderer.rectangle = function(mode, posX, posY, width, height, radiusX, radiusY)
    love.graphics.rectangle(mode, posX, posY, width, height, radiusX, radiusY)
end

Renderer.setColor = function(color)
    love.graphics.setColor(color[1] / 255, color[2] / 255, color[3] / 255, color[4])
end

Renderer.getColor = function()
    local r, g, b, a = love.graphics.getColor()

    return {r * 255, g * 255, b * 255, a}
end

return Renderer