local toggle = false
local rapidFire = false

-- 定义鼠标按键常量
local mouseButton6 = 6
local mouseLeft = 1
local mouseRight = 3

-- 启用鼠标事件报告
EnablePrimaryMouseButtonEvents(true)

-- 主循环
function OnEvent(event, arg)
    -- 检测鼠标6键按下
    if event == "MOUSE_BUTTON_PRESSED" and arg == mouseButton6 then
        toggle = not toggle  -- 切换模式
        OutputLogMessage("Toggle mode: %s\n", toggle and "ON" or "OFF")
    end

    -- 如果模式开启
    if toggle then
        -- 检测鼠标左键按下
        if event == "MOUSE_BUTTON_PRESSED" and arg == mouseLeft then
            rapidFire = true
            OutputLogMessage("Rapid fire started\n")
        end

        -- 检测鼠标左键释放
        if event == "MOUSE_BUTTON_RELEASED" and arg == mouseLeft then
            rapidFire = false
            OutputLogMessage("Rapid fire stopped\n")
        end

        -- 连点
        if rapidFire then
          repeat
            Sleep(50)  
            PressMouseButton(mouseRight)
            Sleep(5)  
            ReleaseMouseButton(mouseRight)
          until not IsMouseButtonPressed(1)
        end
    end
end
