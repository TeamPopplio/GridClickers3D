--Grid Clickers 3D is nothing more than a tech demo. Please disreguard any spaghetti code.
function love.load() 
    click1 = love.audio.newSource("gridclick1.ogg","static")
    click2 = love.audio.newSource("gridclick2.ogg","static")
    click3 = love.audio.newSource("gridclick3.ogg","static")
    clicksfx = {click1,click2,click3}
    click = love.audio.newSource("click.ogg","static")
    mouse = love.audio.newSource("mouse.ogg","static")
    milestone = love.audio.newSource("milestone.ogg","static")
    tensfx = love.audio.newSource("gridclick10.ogg","static")
    bebes = love.graphics.newFont("bebesneue.bcfnt", 30)
    bebesmedium = love.graphics.newFont("bebesneue.bcfnt", 23)
    bebessmall = love.graphics.newFont("bebesneue.bcfnt", 15)
    bebestiny = love.graphics.newFont("bebesneue.bcfnt", 8)
    music = love.audio.newSource("music.ogg","stream")
    altmusic1 = love.audio.newSource("altmusic1.ogg","stream")
    altmusic2 = love.audio.newSource("altmusic2.ogg","stream")
    music:setLooping(true)
    altmusic1:setLooping(true)
    altmusic2:setLooping(true)
    music:play()
    song = 1
    tasksbutton = love.graphics.newImage( "tasksbutton.png" )
    mutebutton = love.graphics.newImage( "mutebutton.png" )
    buttons = love.graphics.newImage( "buttons.png" )
    wallet = love.graphics.newImage( "wallet.png" )
    walletshrink = love.graphics.newImage( "walletshrink.png" )
    settingsbuttons = love.graphics.newImage( "settingsbuttons.png" )
    clicks = 0
    clicksreal = 0
    multiply = 1
    debug1 = 0
    debug2 = 0
    rotation = 0
    activescreen = "clicker"
    previouscreen = "clicker"
    clicking = false
    musicplaying = true
    love.graphics.set3D(true) 
    upgradeInterval = 5
    upgradeMultiplier = 5
end
function love.update()
    rotation = rotation+0.003
    if rotation == 360 then
        rotation = 0
    end
end
function love.quit()
    return true
end
function love.draw()
    love.graphics.setScreen("top")
    love.graphics.setDepth(0)
    love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)

    --shadows
    love.graphics.setColor(0.2, 0.2, 0.2)
    love.graphics.setFont(bebes)
    love.graphics.print("Total:\n$"..clicks, 6, 4)
    love.graphics.setFont(bebessmall)
    love.graphics.print("("..clicks.." Clicks)\nMultiplier: "..multiply, 6,132)

    --text
    love.graphics.setDepth(2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(bebes)
    love.graphics.print("Total:\n$"..clicks, 2, 0)
    love.graphics.setFont(bebessmall)
    love.graphics.print("("..clicksreal.." Clicks)\nMultiplier: "..multiply, 2,128)
    if activescreen == "clicker" or activescreen == nil then
        love.graphics.setScreen("bottom")
        love.graphics.setDepth(0)
        love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        if clicking == true then
            if rotation ~= 0 then
                love.graphics.draw(walletshrink,160,120,rotation)
            else
                love.graphics.draw(walletshrink,96,57,rotation)
            end
        else
            if rotation ~= 0 then
                love.graphics.draw(wallet,160,120,rotation)
            else
                love.graphics.draw(wallet,86,46,rotation)
            end
        end
    elseif activescreen == "tasks" then
        love.graphics.setScreen("bottom")
        love.graphics.setDepth(0)
        love.graphics.setBackgroundColor( 0.2196078431372549, 0.2196078431372549, 0.2196078431372549, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(buttons,0,0)
        if musicplaying == false then
            love.graphics.draw(mutebutton,0,156)
        end
        love.graphics.setFont(bebes)
        love.graphics.print("Click", 50, -10)
        love.graphics.print("Upgrade", 50, 42)
        love.graphics.print("Settings", 50, 94)
        love.graphics.print("Mute", 50, 146)
    elseif activescreen == "upgrades" then
        love.graphics.setScreen("bottom")
        love.graphics.setDepth(0)
        love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        love.graphics.setFont(bebes)
        love.graphics.print("Menu", 50, -10)
    elseif activescreen == "settings" then
        love.graphics.setScreen("bottom")
        love.graphics.setDepth(0)
        love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        love.graphics.draw(settingsbuttons,0,0)
        love.graphics.setFont(bebes)
        love.graphics.print("Menu", 50, -10)
        love.graphics.print("Music", 50, 42)
        love.graphics.print("Credits", 50, 94)
        love.graphics.print("Quit", 50, 146)
    elseif activescreen == "credits" then
        love.graphics.setScreen("bottom")
        love.graphics.setDepth(0)
        love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        love.graphics.setFont(bebestiny)
        love.graphics.print("\n\"Grid Clickers 3D\" was created by Carlos Brown of HoCS\nMusic was composed by Brett Hajdaj of HoCS\nUI design was created by Treycen Carr of HoCS\nExtra help was given by Coding Club of SVHS Las Vegas\n\nAll rights belong to House of Cards Studios\nSome icons were created by www.flaticon.com\n\nVersion 1.0; Built using Löve Potion", 0, 50)
    end
    love.graphics.setScreen("top")
    love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
end
function love.touchreleased(id,x,y,dx,dy,pressure)
    if activescreen == "clicker" or activescreen == nil then
        clicking = false
        if x > 2 and y > 2 and x < 50 and y < 50 then --tasks button
            activescreen = "tasks"
            click:play()
        elseif x > 85 and y > 45 and x < 236 and y < 196 then --click button
            clicksreal=clicksreal+1
            clicks = clicks+(1*multiply)
            local sfx = math.random( #clicksfx )
            clicksfx[sfx]:play()
            if clicksreal % 10 == 0 then
                tensfx:play()
            end
            if clicksreal % 500 == 0 then
                milestone:play()
                multiply=multiply+0.1
            end
        end
    elseif activescreen == "tasks" then
        if x > 2 and y > 2 and y < 50 then --clicker button
            activescreen = "clicker"
            previouscreen = "clicker"
            click:play()
        elseif x > 2 and y > 54 and y < 102 then --upgrades button
            activescreen = "upgrades"
            previouscreen = "upgrades"
            click:play()
        elseif x > 2 and y > 106 and y < 154 then --settings button
            activescreen = "settings"
            previouscreen = "settings"
            click:play()
        elseif x > 2 and y > 158 and  y < 206 then --mute button
            click:play()
            if musicplaying == true then
                if song == 1 then
                    music:stop()
                elseif song == 2 then
                    altmusic1:stop()
                elseif song == 3 then
                    altmusic2:stop()
                end
                musicplaying = false
            else
                if song == 1 then
                    music:play()
                elseif song == 2 then
                    altmusic1:play()
                elseif song == 3 then
                    altmusic2:play()
                end
                musicplaying = true
            end
        else
            mouse:play()
            activescreen = previouscreen
        end
    elseif activescreen == "upgrades" then
        if x > 2 and y > 2 and y < 50 then --tasks button
            activescreen = "tasks"
            click:play()
        end
    elseif activescreen == "settings" then
        if x > 2 and y > 2 and y < 50 then --tasks button
            activescreen = "tasks"
            click:play()
        elseif x > 2 and y > 54 and y < 102 then --music button
            click:play()
            if song == 1 then
                song = 2
                if musicplaying then
                    music:stop()
                    altmusic1:play()
                end
            elseif song == 2 then
                song = 3
                if musicplaying then
                    altmusic1:stop()
                    altmusic2:play()
                end
            elseif song == 3 then
                song = 1
                if musicplaying then
                    altmusic2:stop()
                    music:play()
                end
            end
        elseif x > 2 and y > 106 and y < 154 then --credits button
            activescreen = "credits"
            previouscreen = "credits"
            click:play()
        elseif  x > 2 and y > 158 and y < 206 then --quit button
            click:play()
            if song == 1 then
                music:stop()
            elseif song == 2 then
                altmusic1:stop()
            elseif song == 3 then
                altmusic2:stop()
            end
            musicplaying = false
            love.event.quit()
        end
    elseif activescreen == "credits" then
        if x > 2 and y > 2 and x < 50 and y < 50 then --tasks button
            activescreen = "tasks"
            click:play()
        end
    end
end
function love.touchpressed(id,x,y,dx,dy,pressure)
    if activescreen == "clicker" then
        if x > 85 and y > 45 and x < 236 and y < 196 then
            clicking = true
        end
    end
    debug1 = x
    debug2 = y
end