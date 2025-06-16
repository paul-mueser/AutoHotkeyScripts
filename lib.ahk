; This file contains shared library files used both in my main scripts and HotkeylessAHK scripts.
#Requires AutoHotkey v2.0

isExplorerActive() {
    return !!WinActive("ahk_class CabinetWClass")
}

getTrimmedExplorerWindowTitleDepr() {
    if (isExplorerActive()) {
        title := WinGetTitle("ahk_class CabinetWClass")
        if (InStr(title, "weitere Registerkarten")) {
            return SubStr(title, 1, -1 * (40)) ; Remove "und n weitere Registerkarten"
        } else if (InStr(title, "weitere Registerkarte")) {
            return SubStr(title, 1, -1 * (39)) ; Remove "und 1 weitere Registerkarte"
        } else if (InStr(title, "Datei-Explorer")) {
            return SubStr(title, 1, -1 * (17)) ; Remove "- Datei-Explorer"
        } else {
            return title
        }
    } else {
        return ""
    }
}

getTrimmedExplorerWindowTitle() {
	if (isExplorerActive) {
		for window in ComObject("Shell.Application").Windows {
			if (window.hwnd = WinActive("A")) {
				return window.Document.Folder.Self.Path
			}
		}
	}
}

openTerminalInCurrentExplorerDirectory() {
    if (isExplorerActive()) {
        windowTitle := getTrimmedExplorerWindowTitle()
        Run("wt --startingDirectory `"" windowTitle "`"")
    } else {
        Run("wt")
    }
}

openVSCodeInCurrentExplorerDirectory() {
    vsCodePath := varVSCodePath() . "Microsoft VS Code\Code.exe"
    if (isExplorerActive()) {
        windowTitle := getTrimmedExplorerWindowTitle()
        Run("`"" vsCodePath "`" `"" windowTitle "`"")
    } else {
        Run("`"" vsCodePath "`"")
    }
}

callExplorer() {
    if !WinExist("ahk_class CabinetWClass") {
        Run("explorer.exe")
    }

    GroupAdd("explorersgroup", "ahk_class CabinetWClass")
    try {
        if WinActive("ahk_exe explorer.exe")
            GroupActivate("explorersgroup", "r")
        else
            WinActivate("ahk_class CabinetWClass")
    }
    catch {
        ; ignore error
    }

}

callVSCode() {
    if !WinExist("ahk_exe Code.exe")
        vsCodePath := varVSCodePath() . "Microsoft VS Code\Code.exe"
        Run("`"" vsCodePath "`"")
    if WinActive("ahk_exe Code.exe")
        Send("^{PgDn}")
    else
        WinActivate("ahk_exe Code.exe")
}

callFirefox() {
    if !WinExist("ahk_exe firefox.exe")
        Run("firefox.exe")
    if WinActive("ahk_exe firefox.exe")
        Send("^{tab}")
    else
        WinActivate("ahk_exe firefox.exe")
}

switchActiveStreamDeckConfig() {
    if (!WinActive("ahk_exe StreamDeck.exe")) {
        return
    }

    ; Color of the "XL" in the Stream Deck name
    coordX := 172
    coordY := 48
    color := PixelGetColor(coordX, coordY)

    BlockInput("MouseMove")
    MouseGetPos(&mouseX, &mouseY)

    MouseClick("left", coordX, coordY, , 0)
    Sleep(100)

    if (color = "0xFFFFFF") {
        ; Switch from + to Normal
        MouseClick("left", coordX, coordY + 40, , 0)
    } else {
        ; Switch from Normal to +
        MouseClick("left", coordX, coordY + 60, , 0)
    }

    MouseMove(mouseX, mouseY, 0)
    BlockInput("MouseMoveOff")
}
