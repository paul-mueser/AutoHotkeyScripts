; This file contains all overwrites and hotkeys I use on a daily basis.
#Requires AutoHotkey v2.0

SendMode("Input")
SetWorkingDir(A_ScriptDir)
TraySetIcon("shell32.dll", "16")
#SingleInstance force
#Include "lib.ahk"

SetCapsLockState("AlwaysOff") ; Disable Capslock
SetTitleMatchMode(2) ; Title matches anything that contains the specified string

; Overwrites the apostrophe key to be actually useful without dumb extra key presses
SC00D:: Send("{Raw}" "`` ")

; CAPSLOCK Overwrites
#HotIf GetKeyState("Capslock", "P")
{
    L:: {
        Run("D:\Coding\HotkeylessAHK\reload.ahk")    
        Reload
    }

    E:: Send("[")
    R:: Send("]")
    D:: Send("{{}")
    F:: Send("{}}")
    T:: Send("\")
    SC00D:: Send("{Raw}" "´")
    Q::
    {
        Send("``")
        Send("``")
        Send("{Left}")
    }

    X:: callExplorer()
    W:: callFirefox()
    C:: openTerminalInCurrentExplorerDirectory()
    V::
    {
        openVSCodeInCurrentExplorerDirectory()
    }
    Y:: callVSCode()
    S:: switchActiveStreamDeckConfig()

    0:: Send("[0]")
    1:: Send("[1]")
    2:: Send("[2]")
    3:: Send("[3]")
    4:: Send("[4]")
    5:: Send("[5]")
    6:: Send("[6]")
    7:: Send("[7]")
    8:: Send("[8]")
    9:: Send("[9]")
}
#HotIf
