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

;; ===========================
;; Center Window
;; ===========================
!^+#c::CenterWindow("A")

CenterWindow(winTitle*) {
    hwnd := WinExist(winTitle*)
    WinGetPos ,, &W, &H, hwnd
    mon := GetNearestMonitorInfo(hwnd)
    WinMove mon.WALeft + mon.WAWidth // 2 - W // 2, mon.WATop + mon.WAHeight // 2 - H // 2,,, hwnd
}

GetNearestMonitorInfo(winTitle*) {
    static MONITOR_DEFAULTTONEAREST := 0x00000002
    hwnd := WinExist(winTitle*)
    hMonitor := DllCall("MonitorFromWindow", "ptr", hwnd, "uint", MONITOR_DEFAULTTONEAREST, "ptr")
    NumPut("uint", 104, MONITORINFOEX := Buffer(104))
    if (DllCall("user32\GetMonitorInfo", "ptr", hMonitor, "ptr", MONITORINFOEX)) {
        Return  { Handle   : hMonitor
                , Name     : Name := StrGet(MONITORINFOEX.ptr + 40, 32)
                , Number   : RegExReplace(Name, ".*(\d+)$", "$1")
                , Left     : L  := NumGet(MONITORINFOEX,  4, "int")
                , Top      : T  := NumGet(MONITORINFOEX,  8, "int")
                , Right    : R  := NumGet(MONITORINFOEX, 12, "int")
                , Bottom   : B  := NumGet(MONITORINFOEX, 16, "int")
                , WALeft   : WL := NumGet(MONITORINFOEX, 20, "int")
                , WATop    : WT := NumGet(MONITORINFOEX, 24, "int")
                , WARight  : WR := NumGet(MONITORINFOEX, 28, "int")
                , WABottom : WB := NumGet(MONITORINFOEX, 32, "int")
                , Width    : Width  := R - L
                , Height   : Height := B - T
                , WAWidth  : WR - WL
                , WAHeight : WB - WT
                , Primary  : NumGet(MONITORINFOEX, 36, "uint")
            }
    }
    throw Error("GetMonitorInfo: " A_LastError, -1)
}
