--Grid Clickers Switch is nothing more than a tech demo. Please disreguard any spaghetti code.
function love.load() 
    click1 = love.audio.newSource("gridclick1.ogg","static")
    click2 = love.audio.newSource("gridclick2.ogg","static")
    click3 = love.audio.newSource("gridclick3.ogg","static")
    clicksfx = {click1,click2,click3}
    click = love.audio.newSource("click.ogg","static")
    mouse = love.audio.newSource("mouse.ogg","static")
    milestone = love.audio.newSource("milestone.ogg","static")
    tensfx = love.audio.newSource("gridclick10.ogg","static")
    bebes = love.graphics.newFont("bebasneue.ttf", 30)
    bebesmedium = love.graphics.newFont("bebasneue.ttf", 23)
    bebessmall = love.graphics.newFont("bebasneue.ttf", 15)
    bebestiny = love.graphics.newFont("bebasneue.ttf", 8)
    music = love.audio.newSource("music.ogg","stream")
    altmusic1 = love.audio.newSource("altmusic1.ogg","stream")
    altmusic2 = love.audio.newSource("altmusic2.ogg","stream")
    music:setLooping(true)
    altmusic1:setLooping(true)
    altmusic2:setLooping(true)
    love.audio.play(music)
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
    --love.graphics.set3D(true) 
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
	love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
    if activescreen == nil or activescreen == "clicker" then
		--love.graphics.setScreen("top")
		--love.graphics.setDepth(0)
		--love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)

		--shadows
		love.graphics.setColor(0.2, 0.2, 0.2)
		love.graphics.setFont(bebes)
		love.graphics.print("Total:\n$"..clicks, 6, 52)
		love.graphics.setFont(bebessmall)
		love.graphics.print("("..clicks.." Clicks)\nMultiplier: "..multiply, 6,132)

		--text
		--love.graphics.setDepth(2)
		love.graphics.setColor(1, 1, 1)
		love.graphics.setFont(bebes)
		love.graphics.print("Total:\n$"..clicks, 2, 52)
		love.graphics.setFont(bebessmall)
		love.graphics.print("("..clicksreal.." Clicks)\nMultiplier: "..multiply, 2,128)
		
		--bottom
        --love.graphics.setScreen("bottom")
        --love.graphics.setDepth(0)
        --love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        if clicking == true then
            love.graphics.draw(walletshrink, 640, 360, rotation, 1, 1, walletshrink:getWidth()/2, walletshrink:getHeight()/2)
        else
			love.graphics.draw(wallet, 640, 360, rotation, 1, 1, wallet:getWidth()/2, wallet:getHeight()/2)
        end
    elseif activescreen == "tasks" then
        --love.graphics.setScreen("bottom")
        --love.graphics.setDepth(0)
        --love.graphics.setBackgroundColor( 0.2196078431372549, 0.2196078431372549, 0.2196078431372549, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(buttons,0,0)
        if musicplaying == false then
            love.graphics.draw(mutebutton,0,156)
        end
        love.graphics.setFont(bebes)
        love.graphics.print("Click", 55, 10)
        love.graphics.print("Upgrade", 55, 62)
        love.graphics.print("Settings", 55, 114)
        love.graphics.print("Mute", 55, 166)
    elseif activescreen == "upgrades" then
       -- love.graphics.setScreen("bottom")
        --love.graphics.setDepth(0)
        --love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        love.graphics.setFont(bebes)
        love.graphics.print("Menu", 55, 10)
    elseif activescreen == "settings" then
        --love.graphics.setScreen("bottom")
        --love.graphics.setScreen("bottom")
        --love.graphics.setDepth(0)
        --love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        love.graphics.draw(settingsbuttons,0,0)
        love.graphics.setFont(bebes)
	    love.graphics.print("Menu", 55, 10)
        love.graphics.print("Music", 55, 62)
        love.graphics.print("Credits", 55, 114)
        love.graphics.print("Quit", 55, 166)
    elseif activescreen == "credits" then
        --love.graphics.setScreen("bottom")
        --love.graphics.setDepth(0)
        --love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(tasksbutton,0,0)
        love.graphics.setFont(bebes)
        love.graphics.print("\n\"Grid Clickers Switch\" was created by Carlos Brown of HoCS\n\nMusic was composed by Brett Hajdaj of HoCS\n\nUI design was created by Treycen Carr of HoCS\n\nExtra help was given by Coding Club of SVHS Las Vegas\n\n\nAll rights belong to House of Cards Studios\n\nSome icons were created by www.flaticon.com\n\n\nVersion 1.0; Built using Löve Potion", 0, 22)
    end
    --love.graphics.setScreen("top")
	--love.graphics.setBackgroundColor( 0.2784313725490196, 0.2784313725490196, 0.2784313725490196, 1)
end
function love.touchreleased(id,x,y,dx,dy,pressure)
    if activescreen == "clicker" or activescreen == nil then
        clicking = false
        if x > 2 and y > 2 and x < 50 and y < 50 then --tasks button
            activescreen = "tasks"
            love.audio.play(click)
        elseif x > 430 and y > 151 and x < 849 and y < 569 then --click button
            clicksreal=clicksreal+1
            clicks = clicks+(1*multiply)
            local sfx = math.random( #clicksfx )
            love.audio.play(clicksfx[sfx])
            if clicksreal % 10 == 0 then
                love.audio.play(tensfx)
            end
            if clicksreal % 500 == 0 then
                love.audio.play(milestone)
                multiply=multiply+0.1
            end
        end
    elseif activescreen == "tasks" then
        if x > 2 and y > 2 and y < 50 then --clicker button
            activescreen = "clicker"
            previouscreen = "clicker"
            love.audio.play(click)
        elseif x > 2 and y > 54 and y < 102 then --upgrades button
            activescreen = "upgrades"
            previouscreen = "upgrades"
            love.audio.play(click)
        elseif x > 2 and y > 106 and y < 154 then --settings button
            activescreen = "settings"
            previouscreen = "settings"
            love.audio.play(click)
        elseif x > 2 and y > 158 and  y < 206 then --mute button
            love.audio.play(click)
            if musicplaying == true then
                if song == 1 then
                    love.audio.stop(music)
                elseif song == 2 then
                    love.audio.stop(altmusic1)
                elseif song == 3 then
                    love.audio.stop(altmusic2)
                end
                musicplaying = false
            else
                if song == 1 then
                    love.audio.play(music)
                elseif song == 2 then
                    love.audio.play(altmusic1)
                elseif song == 3 then
                    love.audio.play(altmusic2)
                end
                musicplaying = true
            end
        else
            love.audio.play(mouse)
            activescreen = previouscreen
        end
    elseif activescreen == "upgrades" then
        if x > 2 and y > 2 and y < 50 then --tasks button
            activescreen = "tasks"
            love.audio.play(click)
        end
    elseif activescreen == "settings" then
        if x > 2 and y > 2 and y < 50 then --tasks button
            activescreen = "tasks"
            love.audio.play(click)
        elseif x > 2 and y > 54 and y < 102 then --music button
            love.audio.play(click)
            if song == 1 then
                song = 2
                if musicplaying then
                    love.audio.stop(music)
                    love.audio.play(altmusic1)
                end
            elseif song == 2 then
                song = 3
                if musicplaying then
                    love.audio.stop(altmusic1)
                    love.audio.play(altmusic2)
                end
            elseif song == 3 then
                song = 1
                if musicplaying then
                    love.audio.stop(altmusic2)
                    love.audio.play(music)
                end
            end
        elseif x > 2 and y > 106 and y < 154 then --credits button
            activescreen = "credits"
            previouscreen = "credits"
            love.audio.play(click)
        elseif  x > 2 and y > 158 and y < 206 then --quit button
            love.audio.play(click)
            if song == 1 then
            love.audio.stop(music)
            elseif song == 2 then
                love.audio.stop(altmusic1)
            elseif song == 3 then
                love.audio.stop(altmusic2)
            end
            musicplaying = false
            love.event.quit()
        end
    elseif activescreen == "credits" then
        if x > 2 and y > 2 and x < 50 and y < 50 then --tasks button
            activescreen = "tasks"
            love.audio.play(click)
        end
    end
end
function love.touchpressed(id,x,y,dx,dy,pressure)
    if activescreen == "clicker" then
        if x > 430 and y > 151 and x < 849 and y < 569 then
            clicking = true
        end
    end
    debug1 = x
    debug2 = y
end