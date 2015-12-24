require "player"
require "map"
require "menu"

function love.load()
    medium = love.graphics.newFont(45)
    TileSet = love.graphics.newImage('assets/ANGEL.png')
    local tilesetW, tilesetH = TileSet:getWidth(), TileSet:getHeight()
    man = love.graphics.newQuad(0, 0, 32, 32, tilesetH, tilesetH)
    text = "Hi"
    gamestate = "menu"
    button_spawn(5, 200, "Start", "start")
    button_spawn(550, 550, "Quit", "quit")


    man_x = 300
    man_y = 300
    -- buttons!!

end


function love.mousepressed(x, y, button)
  -- body...

  if gamestate == "menu" then
    print "asdasd"
    button_click(x,y)
  end
end

function love.update(dt)
  if gamestate == "playing" then
     player_move("up", "down", "left", "right", dt)
     map_collide()
  end

end

function love.draw()
  if gamestate == "playing" then
    love.graphics.setColor(200, 200,200)
    love.graphics.setFont(medium)
    player_draw()
  end

  if gamestate == "menu" then
    button_draw()
  end
end
