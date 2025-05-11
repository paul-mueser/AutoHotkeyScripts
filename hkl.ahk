; This file contains all functions I use with HotkeylessAHK.
; It relies on the shared library file "lib.ahk" to work properly.
#Include "lib.ahk"

; This class is just here for demonstration purposes
class CustomFunctions {
    HelloWorld() {
        MsgBox("Hello World!")
    }
}

; This class contains all functions for normal desktop use
class DesktopFunctions {

    KillOrOpenDiscord() {
        if WinExist("ahk_exe Discord.exe") {
            ProcessClose("Discord.exe")
            CoordMode("Mouse", "Screen")
            BlockInput("MouseMove")
            MouseGetPos(&mouseX, &mouseY)
            MouseMove(2630, 1415, 0)
            MouseMove(3350, 1415, 30)
            MouseMove(mouseX, mouseY, 0)
            BlockInput("MouseMoveOff")
        } else {
            Run("C:\Users\Paul\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk")
        }
    }

    RunVSCodeInCurrentFolder() {
        openVSCodeInCurrentExplorerDirectory()
    }
}
