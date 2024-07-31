vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
    vec4 pixel = Texel(texture, texture_coords); // This gives you the current pixel colour

    return pixel * color; // Returns the pixel multiplied by the current colour from the current love.graphics.setColor()
}