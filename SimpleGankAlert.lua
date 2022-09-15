--Drawing a line from my Champ to Enemy targetselected one
local enemie = features.entity_list:get_enemies()
local e1 = enemie[1].champion_name.text
local e2 = enemie[2].champion_name.text
local e3 = enemie[3].champion_name.text
local e4 = enemie[4].champion_name.text
local e5 = enemie[5].champion_name.text
cheat.register_callback("render", function()
    local round = function(a, prec)
        return math.floor(a + 0.5*prec) -- where prec is 10^n, starting at 0
    end

    font = 'roboto-regular'
    red = color:new(255, 100, 0)
    string = "Ally below 10% hp: "
    position = g_local.position:to_screen()
    -- topdown y leftright x
    position.y = position.y - 50
    position.x = position.x + 50
    if(position == nil)then
        return false
    end


    local enemies = features.entity_list:get_enemies()
    print(e4)

    for i, enemy in ipairs(enemies) do
        if(enemy:dist_to_local() > 1400 and enemy:dist_to_local() < 2700)then
            distance = round(enemy:dist_to_local(), 1)
            string = enemy.champion_name.text .. " [" .. distance .. "]"
            g_render:line_3d(g_local.position, enemy.position, color:new(255,0,0), 5)
            if(enemy.champion_name.text == e1)then
                position.y = position.y + 25
            end
            if(enemy.champion_name.text == e2)then
                position.y = position.y + 50
            end
            if(enemy.champion_name.text == e3)then
                position.y = position.y + 75
            end
            if(enemy.champion_name.text == e4)then
                position.y = position.y + 100
            end
            if(enemy.champion_name.text == e5)then
                position.y = position.y + 125
            end
            g_render:text(position, red, string, font, 20)
            position = g_local.position:to_screen()
            -- topdown y leftright x
            position.y = position.y - 50
            position.x = position.x + 50
        end
    end


    


end)