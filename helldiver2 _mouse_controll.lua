local skills = {
    [100] = {"增援", {"up", "down", "right", "left", "up"}},
    [101] = {"重新补给", {"down", "down", "up", "right"}},

    [1] = {"飞鹰机枪", {"up", "right", "right"}},
    [2] = {"飞鹰集束", {"up", "right", "down", "down", "right"}},
    [3] = {"飞鹰凝固汽油弹", {"up", "right", "down", "up"}},
    [4] = {"飞鹰空袭", {"up", "right", "down", "right"}},
    [5] = {"飞鹰500kg", {"up", "right", "down", "down", "down"}},
    [6] = {"飞鹰110mm", {"up", "right", "up", "left"}},

    [10] = {"轨道精准打击", {"right", "right", "up"}},
    [11] = {"轨道加特林", {"right", "down", "left", "up", "up"}},
    [12] = {"轨道空爆打击", {"right", "right", "right"}},
    [13] = {"轨道毒气", {"right", "right", "down", "right"}},
    [14] = {"轨道120mm高爆弹弹幕", {"right", "right", "down", "left", "right", "down"}},
    [15] = {"轨道380mm高爆弹弹幕", {"right","down", "up", "up", "left", "down", "down"}},
    [16] = {"轨道步行者弹幕", {"right","down", "right", "down", "right", "down"}},
    [17] = {"轨道雷射", {"right","down", "up", "right", "down"}},
    [18] = {"轨道电磁炮攻击", {"right","up", "down", "down", "right"}},
    [19] = {"轨道汽油弹弹幕", {"right", "right", "down", "left", "right", "up"}},

    [20] = {"哨戒机枪", {"down", "up", "right", "right", "up"}},
    [21] = {"哨戒加特林", {"down", "up", "right", "left"}},
    [22] = {"火焰哨戒炮", {"down", "up", "right", "down", "up", "up"}},
    [23] = {"哨戒机炮", {"down", "up", "right", "up", "left", "up"}},
    [24] = {"哨戒火箭炮", {"down", "up", "right", "right", "left"}},
    [25] = {"哨戒迫击炮", {"down", "up", "right", "right", "down"}},
    [26] = {"电磁哨戒迫击炮", {"down", "up", "right", "down","right", }},
    [27] = {"特斯拉电塔", {"down", "up", "right", "up", "left", "right"}},
    [28] = {"毒气地雷", {"down", "left", "left", "right"}},
    [29] = {"燃烧地雷", {"down", "left", "left", "down"}},
    [30] = {"反步兵地雷", {"down", "left", "up", "right"}},
    [31] = {"反坦克地雷", {"down", "left", "up", "up"}},
    [32] = {"反坦克炮塔", {"down", "up", "left", "right", "right","right"}},
    [33] = {"重机枪炮塔", {"down", "up", "left", "right", "right","left"}},

    [40] = {"次抛筒子", {"down", "down", "left", "up", "right"}},
    [41] = {"突击兵", {"down", "left", "up", "down", "right"}},
    [42] = {"无后座", {"down", "left", "right", "right", "left"}},
    [43] = {"类星体", {"down", "down", "up", "left", "right"}},
    [44] = {"空爆筒子", {"down", "up", "up", "left", "right"}},
    [45] = {"机炮", {"down", "left", "down", "up", "up", "right"}},
    [46] = {"激光大炮", {"down", "left", "down", "up", "left"}},
    [47] = {"磁轨炮", {"down", "right", "down", "up", "left", "right"}},
    [48] = {"反器材", {"down", "left", "right", "up", "down"}},
    [49] = {"盟友", {"down", "left", "down", "up", "up", "left"}},
    [50] = {"重机枪", {"down", "left", "up", "down", "down"}},
    [51] = {"榴弹发射器", {"down", "left", "up", "left", "down"}},
    [52] = {"喷火器", {"down", "left", "up", "down", "up"}},
    [53] = {"灭菌器", {"down", "left", "up", "down", "left"}},

    [60] = {"机枪狗", {"down", "up", "left", "up", "right", "down"}},
    [61] = {"毒气狗", {"down", "up", "left", "up", "right", "up"}},
    [62] = {"蛋盾", {"down", "up", "left", "right", "left", "right"}},
    [63] = {"补给背包", {"down", "left", "down", "up", "up", "down"}},
    [64] = {"便携式地狱火", {"down", "right", "up", "up", "up"}},

    [70] = {"侦察车", {"left", "down", "right", "down", "right", "down", "up"}},
    [71] = {"爱国者机甲", {"left", "down", "right", "up", "left", "down", "down"}},
    [72] = {"解放者机甲", {"left", "down", "right", "up", "left", "down", "up"}},


}

--setting--
local top = 100
local G6 = 101

local on1 = 2
local on2 = 28
local lf1 = 20
local lf2 = 44
--1-净化者  2-爆裂铳  3-全自动左键
local WPFiremod = 3
--define--
local Firemod = false
local mod = 0
local running = false
EnablePrimaryMouseButtonEvents(true)


-- 执行技能的函数
function executeSkill(skillId)
    local skill = skills[skillId]
    if skill then
        local skillName = skill[1]
        local sequence = skill[2]
        OutputLogMessage("run: " .. skillId .. "\n")
        PressKey("lctrl")
        Sleep(40)
        for _, key in ipairs(sequence) do
            PressKey(key)
            Sleep(40)
            ReleaseKey(key)
            Sleep(40)
        end
        ReleaseKey("lctrl")
        Sleep(40)
    else
        OutputLogMessage("error: " .. skillId .. "\n")
    end
end


-- 主函数
function OnEvent(event, arg)

    -- 检测大写键锁定 打开火力模式
    if  IsKeyLockOn("numlock" ) then 
        if not Firemod then
            Firemod = true
            OutputLogMessage("Firemod mode: on\n")
        end
    end

     -- 大写键解锁 关闭火力模式
    if  not IsKeyLockOn("numlock" ) then 
        if Firemod then
            Firemod = false
            OutputLogMessage("Firemod mode: off\n")
        end
    end

    -- 如果模式1开启（净化者）
    if WPFiremod == 1 and Firemod then
        if event == "MOUSE_BUTTON_PRESSED" and arg == 1 then
            if not running then
                running = true
                OutputLogMessage("Loop started\n")
                SetMKeyState(1) -- 触发循环
            end
        elseif event == "MOUSE_BUTTON_RELEASED" and arg == 1 then
            running = false
        end

        if event == "M_PRESSED" and running then
            OutputLogMessage("Pressed MB1\n")

            -- 按住 1050ms，分割成 105 次循环，每次 10ms
            for i = 1, 105 do
                Sleep(10)
                if not IsMouseButtonPressed(1) then
                    running = false
                    ReleaseMouseButton(1)
				  OutputLogMessage("Released MB1\n")
                    break
                end
            end

            if running then
                ReleaseMouseButton(1)
                OutputLogMessage("Released MB1\n")
                Sleep(50)
                PressMouseButton(1)
                SetMKeyState(1) -- 继续循环
            else
                OutputLogMessage("Loop ended\n")
            end
        end
    end
    -- 如果模式2开启（爆裂铳）
    if WPFiremod == 2 then
        if  Firemod then
            if IsMouseButtonPressed(1) then
                repeat
                    PressMouseButton(1)
                    Sleep(50)
                    Firemod = true
                    PressKey("2")
                    Sleep(150)
                    Firemod = true
                    ReleaseKey("2")
                    Firemod = true
                    Sleep(300) 
                    PressKey("1")  --爆裂铳
                    Sleep(150)
                    ReleaseKey("1")
                    PressMouseButton(1)
                    Sleep(50)
                    ReleaseMouseButton(1)
                    Sleep(150)
                until not IsMouseButtonPressed(1)    
            end
        end
    end

    -- 如果模式3开启（全自动左键）
    if WPFiremod == 3 then
        if Firemod then
            if event == "MOUSE_BUTTON_PRESSED" and arg == 1 then
                leftClicking = true
                SetMKeyState(1)  -- 触发事件循环
            elseif event == "MOUSE_BUTTON_RELEASED" and arg == 1 then
                leftClicking = false
            end
        
            if event == "M_PRESSED" and leftClicking then
                PressAndReleaseMouseButton(1)  -- 触发左键点击
                SetMKeyState(1)  -- 继续触发 M_PRESSED 事件，保持循环
            end
        end
    end



    if event == "MOUSE_BUTTON_PRESSED" then
        if arg == 9 then
            executeSkill(top)
        elseif arg == 5 then
            executeSkill(lf1)
        elseif arg == 4 then
            executeSkill(lf2) 
        elseif arg == 8 then
            executeSkill(on1)
        elseif arg == 7 then
            executeSkill(on2) 
        elseif arg == 6 then
            executeSkill(G6) 
        end
    end

end
