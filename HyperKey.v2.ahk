#Requires AutoHotkey v2.0

;; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#SingleInstance force
InstallKeybdHook()
SendMode "Input"
SetTitleMatchMode(2)

;; ! Alt
;; ^ Control
;; + Shift
;; # Windows key

;; deactivate capslock completely
SetCapslockState("AlwaysOff")

global CapslockIsDown := false

SetTimer(HandleCapslock, 50)

HandleCapslock() {
    global CapslockIsDown

    if (!CapslockIsDown && GetKeyState("Capslock", "P")) {
        CapslockIsDown := true
        Send("{Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}")
        ;;Send("{Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}")
    } else if (CapslockIsDown && !GetKeyState("Capslock", "P")) {
        CapslockIsDown := false
        Send("{Ctrl Up}{Shift Up}{Alt Up}{LWin Up}")
        ;;Send("{Ctrl Up}{Shift Up}{Alt Up}")
        if (A_PriorKey == "Capslock") {
            Send("{Esc}")
        }
    }
}

;; vim navigation with hyper
Hotkey "~Capslock & h", SendLeft
Hotkey "~Capslock & l", SendRight
Hotkey "~Capslock & k", SendUp
Hotkey "~Capslock & j", SendDown

;; popular hotkeys with hyper
Hotkey "~Capslock & c", SendCtrlC
Hotkey "~Capslock & v", SendCtrlV

SendLeft(ThisHotkey) {
    Send("{Left}")
}

SendRight(ThisHotkey) {
    Send("{Right}")
}

SendUp(ThisHotkey) {
    Send("{Up}")
}

SendDown(ThisHotkey) {
    Send("{Down}")
}

SendCtrlC(ThisHotkey) {
    Send("^c")
}

SendCtrlV(ThisHotkey) {
    Send("^v")
}
