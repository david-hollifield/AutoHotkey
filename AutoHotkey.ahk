;; # Windows logo key
;; ! Alt
;; ^ Control
;; + Shift

#SingleInstance force

SetTitleMatchMode 2

;; ===========================
;; Fix some hard to reach keys
;; ===========================
Insert::`
+Insert::~
Home::!
Delete::$
End::+5
!Backspace::Send ^z

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
;; Convert CapsLock to Shift-Alt
;; ===========================
*CapsLock::
    SetKeyDelay -1
    Send {Blind}{Shift DownTemp}{Alt DownTemp}
return

*CapsLock up::
    SetKeyDelay -1
    Send {Blind}{Shift Up}{Alt Up}
return

;; ===========================
;; Visual Studio
;; ===========================
;; 'Next Document Window'
NumpadSub::^Tab

;; 'Refactor'
NumpadAdd::^.

;; ===========================
;; Login
;; ===========================
;; signin to zookmax
^F11::SendInput jeo+glethorpe85

;; signin to APMNET
^F12::SendInput *+l1ttl3+m@rt+h@*
