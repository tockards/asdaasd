button = {}

function button_spawn(x, y, text, id)
  table.insert(button, {x=x, y=y, text=text, id=id})
end

function button_draw()
  -- body...
  for i,v in ipairs(button) do
    love.graphics.setColor(255, 0, 0)
    love.graphics.setFont(medium)
    love.graphics.print(v.text, v.x, v.y)
  end
end

function button_click (x, y)
  -- body...
  for i,v in ipairs(button) do
    if x > v.x and
    x < v.x + medium:getWidth(v.text) and
    y > v.y and
    y < v.y + medium:getHeight() then
      print "in button click"
      print (v.id)
      if v.id == "quit" then
        love.event.quit()
      end
      if v.id == "start" then
        gamestate = "playing"
      end
    end
  end

end
