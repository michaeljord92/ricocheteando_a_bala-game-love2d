-- Programa: Aula 0 - Ricocheteando a bala
-- Autor: Michael Jordan S Chagas
-- Curso: Ciência da Computação - UFMT-CUA
-- Disclina: Design e Programação de Games (Opt)
-- Docente: Maxwell Silva Carmo
-- Data: 2021-06-22
--
-- Este programa ricocheteia uma imagem(bullet) no limete interno
-- da janela grafica, no sentido do eixo horizontal x.
-------------------------------------------------------
function love.load()
    bullet = love.graphics.newImage("bullet.png")
    x = 0
    y = 100
    dx = 400
    dy = 200
    w = love.graphics.getWidth()
    h = love.graphics.getHeight()
    xscale = 0.05

    direction = 1
end

function love.update(dt)

    if direction <= -1 then
        if x <= 0 - bullet:getWidth() then
            -- x = 0
            -- if xscale > 0.0 then
            --     xscale = xscale - 0.05 * dt
            -- else
            --     direction = -direction
            --     xscale = 0.05
            -- end
        else
            x = x + dx * dt * direction
        end
    elseif direction >= 1 then
        if x >= w then
            x = w
            if xscale > 0.0 then
                xscale = xscale - 0.05 * dt
            else
                direction = -direction
                xscale = 0.05
            end
        else
            x = x + dx * dt * direction
            print(x)
        end
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0, 138 / 255, 197 / 255)
    love.graphics.draw(bullet, x, h / 2, 0, -xscale * direction, 0.05, 0, bullet:getHeight() / 2)

    love.graphics.print('FPS: ' .. love.timer.getFPS(), 10, 12)
    -- love.graphics.print('dt: ' .. love.timer.getDelta(), 10, 12*2)
    -- love.graphics.print('step: ' .. love.timer.step(), 10, 12*3)
    -- love.graphics.print('dt medio: ' .. love.timer.getAverageDelta(), 10, 12*4)
end

