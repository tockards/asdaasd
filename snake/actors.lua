
-- Two different models for doing OO


snake = {}
snake.x  = 10
snake.y = 10
snake.w = 40
snake.h = 40
snake.speed = 500
snake.health = 20
snake.damage = 2




function snake_update(dt)
    snake.x = snake.x + 1
    snake.y = snake.y + 1
end

function snake_draw()
  -- body...
  love.graphics.setColor(255 , 255, 255)

  love.graphics.rectangle("fill", snake.x, snake.y, snake.w, snake.h)
end


function snake_move(object, up, down, left, right, dt)
   if love.keyboard.isDown(up) then
      object.y = object.y - object.speed * dt
   end

   if love.keyboard.isDown(down) then
      object.y = object.y + object.speed * dt
   end

   if love.keyboard.isDown(left) then
      object.x = object.x - object.speed * dt
   end

   if love.keyboard.isDown(right) then
      object.x = object.x + object.speed * dt
   end
end





-- One way
Rat = {}
Rat.__index = Rat

function Rat.create(x, y, width, height, speed)
    local _rat = {} -- our new object
    setmetatable(_rat, Rat) -- make Rat handle lookup
    _rat.x = x
    _rat.y = y
    _rat.w = width
    _rat.h = height
    _rat.speed = speed
    return _rat
end

function Rat:draw(color, mode)
    love.graphics.setColor(color[1], color[2], color[3])


    love.graphics.rectangle(mode, self.x, self.y, self.w, self.h)
end

function Rat:return_coords()
    return self.x, self.y, self.w, self.h
end

function Rat:collide(object)


end


-- Simpler way
OnScreenText = {}
OnScreenText.__index = OnScreenText

function OnScreenText.create(text, x, y)
    local _onscreentext = {}
    setmetatable(_onscreentext, OnScreenText)
    _onscreentext.textstring = text
    _onscreentext.x = x
    _onscreentext.y = y
    return _onscreentext
end

function OnScreenText:draw(color)
    love.graphics.setColor(color[1], color[2], color[3])
    love.graphics.setFont(medium)
    love.graphics.print(self.textstring, self.x, self.y);
end
