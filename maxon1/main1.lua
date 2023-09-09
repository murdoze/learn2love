io.stdout:setvbuf("no")

local x = 10


function love.update()
  if x >= 500 then 
    x = 1
  else
    x = x + 1
  end
end

function love.draw()
    love.graphics.print("Hello World!", 100, 100)
    love.graphics.rectangle("fill", x, 300, 100, 10)
    love.graphics.polygon('line', x, 0, 0, x+50, 200, 300)


end

--[[

INPUTS:

Alpha  -- Angle
F      -- Force

Vv0 = 0
Vh0 = 0

INTERMEDIATES:

Fh = F * cos(Alpha)
Fv = F * sin(Alpha)




Av = Fv / m  -- vertical Acc
Ah = Fh / m  -- horizontal Acc

Vv = Vv0 + Av * dt
Vh = Vh0 + Ah * dt

X = X0 + Vh * dt
Y = Y0 + Vv * dt

]]--

