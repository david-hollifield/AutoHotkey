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

#^!+W::
Send ^!+W
return

#^!+T::
Send ^!+T
return

#^!+Y::
Send ^!+Y
return

#^!+O::
Send ^!+O
return

#^!+P::
Send ^!+P
return

#^!+D::
Send ^!+D
return

#^!+L::
Send ^!+L
return

#^!+X::
Send ^!+X
return

#^!+N::
Send ^!+N
return

#^!+Space::
Send ^!+Space
return