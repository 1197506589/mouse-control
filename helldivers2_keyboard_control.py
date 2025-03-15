import sys
import ctypes
from pynput import keyboard
import win32gui
import win32con
import win32process
import os
import winsound  # 添加声音模块

# 检查是否以管理员权限运行
def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

def set_num_lock(state):
    """设置数字键盘锁定状态"""
    hllDll = ctypes.WinDLL("User32.dll")
    # 0x90 是 NumLock 的虚拟键码
    if (hllDll.GetKeyState(0x90) & 1) != state:
        keyboard.Controller().press(keyboard.Key.num_lock)
        keyboard.Controller().release(keyboard.Key.num_lock)

def on_press(key):
    try:
        # 使用虚拟键码检测按键
        if hasattr(key, 'vk'):  # 检查是否有虚拟键码属性
            if key.vk == 49:  # 数字键1的虚拟键码
                print("开启数字键盘锁定")
                set_num_lock(True)
            elif key.vk in [50, 51]:  # 数字键2和3的虚拟键码
                print("关闭数字键盘锁定")
                set_num_lock(False)
            elif key.vk == 48:  # 数字键0的虚拟键码
                print("程序退出")
                winsound.Beep(1000, 200)
                winsound.Beep(800, 300)
                return False  # 停止监听
        elif hasattr(key, 'char'):  # 如果没有虚拟键码，尝试使用char属性
            if key.char == '1':
                print("开启数字键盘锁定")
                set_num_lock(True)
            elif key.char in ['2', '3']:
                print("关闭数字键盘锁定")
                set_num_lock(False)
            elif key.char == '0':
                print("程序退出")
                winsound.Beep(1000, 200)
                winsound.Beep(800, 300)
                return False
    except Exception as e:
        print(f"Error: {e}")
        pass

def main():
    # 设置控制台窗口属性
    kernel32 = ctypes.WinDLL('kernel32')
    user32 = ctypes.WinDLL('user32')
    hwnd = kernel32.GetConsoleWindow()
    if hwnd:
        # 隐藏控制台窗口
        user32.ShowWindow(hwnd, 0)

    print("程序已启动")
    print("按1开启数字键盘锁定")
    print("按2或3关闭数字键盘锁定")
    print("按0退出程序")

    # 创建键盘监听器
    with keyboard.Listener(on_press=on_press) as listener:
        listener.join()

if __name__ == "__main__":
    # 如果不是管理员权限，则以管理员权限重新运行
    if not is_admin():
        # 请求管理员权限重新运行
        ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)
    else:
        main()
