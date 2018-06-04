local Skin = {}

Skin.Window = {
    title = {
        height = 25,
        color = { 128, 128, 128, 0.5 }
    },
    body = {
        color = { 128, 128, 128, 0.3 }
    }
}

Skin.Panel = {
    color = { 128, 128, 128, 1 }
}

Skin.Label = {
    font = nil, -- Expect default font
    color = { 0, 0, 0, 1 },
    angle = 0,
    scaleX = 1,
    scaleY = 1,
    skewX = 0,
    skewY = 0,
    wrap = nil,
    align = nil
}

return Skin