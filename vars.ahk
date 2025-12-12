; This file introduces system-specific variables to enable using the same scripts on multiple systems.
#Requires AutoHotkey v2.0

AHK_TARGET := A_ComputerName ; "XMG" or "S14"

varDefaultExplorerCall() {
    if (AHK_TARGET == "PAUL-DESKTOP") {
        return "explorer.exe"
    } else if (AHK_TARGET == "PAULUNILAPTOP") {
        return "explorer.exe"
    }
}

varHotkeylessAHKPath() {
    if (AHK_TARGET == "PAUL-DESKTOP") {
        return "D:\Coding\HotkeylessAHK\"
    } else if (AHK_TARGET == "PAULUNILAPTOP") {
        return "C:\Users\paul2\Desktop\AutoHotkey\HotkeylessAHK\"
    }
}

varAutoHotkeyScriptsPath() {
    if (AHK_TARGET == "PAUL-DESKTOP") {
        return "D:\Coding\AutoHotkeyScripts\"
    } else if (AHK_TARGET == "PAULUNILAPTOP") {
        return "C:\Users\paul2\Desktop\AutoHotkey\AutoHotkeyScripts\"
    }
}

varVSCodePath() {
    if (AHK_TARGET == "PAUL-DESKTOP") {
        return "F:\Programme\"
    } else if (AHK_TARGET == "PAULUNILAPTOP") {
        return "C:\Users\paul2\AppData\Local\Programs\"
    }
}
