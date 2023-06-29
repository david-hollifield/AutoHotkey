#SingleInstance force

SetTitleMatchMode 2

;; ===========================
;; Center Active Window
;; ===========================
#c::CenterWindow()

CenterWindow()
{
    ; Get the window handle from the active window.
    winHandle := WinExist("A")

    VarSetCapacity(monitorInfo, 40)
    NumPut(40, monitorInfo)

    ; Get the current monitor from the active window handle.
    monitorHandle := DllCall("MonitorFromWindow", "uint", winHandle, "uint", 0x2)
    DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) 

    ; Get WorkArea bounding coordinates of the current monitor.
    workLeft   := NumGet(monitorInfo, 20, "Int")
    workTop    := NumGet(monitorInfo, 24, "Int")
    workRight  := NumGet(monitorInfo, 28, "Int")
    workBottom := NumGet(monitorInfo, 32, "Int")

    WinGetPos,,, sizeX, sizeY

    ; Calculate window coordinates.
    winW := workRight - workLeft
    winH := workBottom
    winX := (winW/2)-(sizeX/2)
    winY := (winH/2)-(sizeY/2)

    WinGet, Style, Style, A
    If (Style & 0x20000) ; WS_MINIMIZEBOX
    {
        WinMove, A,, winX, winY
    }
}
