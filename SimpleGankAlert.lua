--Drawing a line from my Champ to Enemy targetselected one
cheat.register_callback("render", function()
    local round = function(a, prec)
        return math.floor(a + 0.5*prec) -- where prec is 10^n, starting at 0
    end
    local count = 0

    function text_pos(count)
        return count * 25
    end

    font = 'roboto-regular'
    red = color:new(255, 100, 0)
    string = ""
    position = g_local.position:to_screen()
    -- topdown y leftright x
    position.y = position.y - 50
    position.x = position.x + 50
    if(position == nil)then
        return false
    end


    local enemies = features.entity_list:get_enemies()
    for i, enemy in ipairs(enemies) do
        if(enemy:dist_to_local() > 1400 and enemy:dist_to_local() < 2700)then
            count = count + 1
            distance = round(enemy:dist_to_local(), 1)
            string = enemy.champion_name.text .. " [" .. distance .. "]"
            g_render:line(g_local.position, enemy.position, color:new(255,0,0), 5)
        
            position.y = position.y + text_pos(count)


            g_render:text(position, red, string, font, 20)
            position = g_local.position:to_screen()
            -- topdown y leftright x
            position.y = position.y - 50
            position.x = position.x + 50
        end
    end


    


end)
