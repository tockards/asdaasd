function love.load()
    -- body...

    world = love.physics.newWorld(0, 200, true)
        --These callback function names can be almost any you want:
        world:setCallbacks(beginContact, endContact, preSolve, postSolve)

    text       = ""   -- we'll use this to put info text on the screen later
    persisting = 0    -- we'll use this to store the state of repeated callback calls

    ball = {}
    ball.b = love.physics.newBody(world, 400,200, "dynamic")  -- set x,y position (400,200) and let it move and hit other objects ("dynamic")
    ball.b:setMass(10)                                        -- make it pretty light
    ball.s = love.physics.newCircleShape(50)                  -- give it a radius of 50
    ball.f = love.physics.newFixture(ball.b, ball.s)          -- connect body to shape
    ball.f:setRestitution(1)                                -- make it bouncy
    ball.f:setUserData("Ball")                                -- give it a name, which we'll access later

    ball2 = {}
    ball2.b = love.physics.newBody(world, 400,0, "dynamic")  -- set x,y position (400,200) and let it move and hit other objects ("dynamic")
    ball2.b:setMass(10)                                        -- make it pretty light
    ball2.s = love.physics.newCircleShape(50)                  -- give it a radius of 50
    ball2.f = love.physics.newFixture(ball.b, ball.s)          -- connect body to shape
    ball2.f:setRestitution(1)                                -- make it bouncy
    ball2.f:setUserData("Ball")                                -- give it a name, which we'll access later


static = {}
    static.b = love.physics.newBody(world, 400,400, "static") -- "static" makes it not move
    static.s = love.physics.newRectangleShape(200,50)         -- set size to 200,50 (x,y)
    static.f = love.physics.newFixture(static.b, static.s)
    static.f:setUserData("Block")


end

function love.update(dt)
    -- body...
    world:update(dt)

    if love.keyboard.isDown("right") then
        ball.b:applyForce(1000, 0)
    elseif love.keyboard.isDown("left") then
        ball.b:applyForce(-1000, 0)
    end
    if love.keyboard.isDown("up") then
        ball.b:applyForce(0, -5000)
    elseif love.keyboard.isDown("down") then
        ball.b:applyForce(0, 1000)
    end

    if string.len(text) > 768 then    -- cleanup when 'text' gets too long
        text = ""
    end
end

function love.draw()
    -- body...
    love.graphics.circle("line", ball.b:getX(),ball.b:getY(), ball.s:getRadius(), 20)
    love.graphics.circle("line", ball2.b:getX(),ball2.b:getY(), ball2.s:getRadius(), 20)
    love.graphics.polygon("line", static.b:getWorldPoints(static.s:getPoints()))
    love.graphics.print(text, 10, 10)

end


function beginContact(a, b, coll)
    x,y = coll:getNormal()
   text = text.."\n"..a:getUserData().." colliding with "..b:getUserData().." with a vector normal of: "..x..", "..y
end

function endContact(a, b, coll)
persisting = 0    -- reset since they're no longer touching
text = text.."\n"..a:getUserData().." uncolliding with "..b:getUserData()
end

function preSolve(a, b, coll)
    if persisting == 0 then    -- only say when they first start touching
       text = text.."\n"..a:getUserData().." touching "..b:getUserData()
   elseif persisting < 20 then    -- then just start counting
       text = text.." "..persisting
   end
   persisting = persisting + 1    -- keep track of how many updates they've been touching for
end

function postSolve(a, b, coll, normalimpulse1, tangentimpulse1, normalimpulse2, tangentimpulse2)

end
