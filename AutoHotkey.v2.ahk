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
;; Fix some hard to reach keys
;; ===========================
Insert::`
+Insert::~
Home::!
Delete::$
End::+5
!Backspace::Send("^z")

;; Switching virtual desktops
^PgUp::#^Left
^PgDn::#^Right

;; For Alt + key (with NumLock OFF)
NumpadIns::Ins
NumpadEnd::End
NumpadDown::Down
NumpadPgDn::PgDn
NumpadLeft::Left
NumpadClear::Escape
NumpadRight::Right
NumpadHome::Home
NumpadUp::Up
NumpadPgUp::PgUp
NumpadDel::Del

;; ===========================
;; Visual Studio
;; ===========================
NumpadSub::^Tab	; 'Next Document Window'
NumpadAdd::^.	; 'Refactor'

;; ===========================
;; Login
;; ===========================
^F11::SendInput("jeo+glethorpe85")		; signin to zookmax
^F12::SendInput("*+l1ttl3+m@rt+h@*")	; signin to APMNET
