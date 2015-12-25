require "actors"
require "map"
require "utils"

medium = love.graphics.newFont(45)
function love.load ()
    -- body...
    rat_1 = Rat.create(100, 100,  50, 50,100)
    rat_2 = Rat.create(100, 100,  150, 150, 200)
    text_1 = OnScreenText.create("Hello", 400, 400)

end




function love.update(dt)
    --snake_update(dt)
    map_collide(snake)
    snake_move(snake, "up", "down", "left", "right", dt)
    snake_move(rat_1, "up", "down", "left", "right", dt)
    snake_move(rat_2, "up", "down", "left", "right", dt)
    if CheckCollision(rat_1, rat_2) then
        text_1.textstring = "hello world"
    else
        text_1.textstring = "bye world"
    end

end

function love.draw()
    snake_draw()
    text_1:draw({255, 0, 0})
    rat_1:draw({255, 0, 0}, "line")
    rat_2:draw({255, 0, 255}, "line")
end
