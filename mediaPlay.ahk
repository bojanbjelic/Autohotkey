Suspend
mediaWindow = NULL
SC122::
;SC03F::
;MsgBox, 64, , 'key'
if mediaWindow = NULL
{
  WinGet, mediaWindow, ID, A
}
IfWinExist ahk_id %mediaWindow%
{
  WinGet, workingWindow, ID, A
  WinActivate, ahk_id %mediaWindow%
  Sleep, 50
  Send {Space}
  WinActivate, ahk_id %workingWindow%
}
Exit

^SC122::
Suspend, Toggle
TrayTip AHK, MediaPlay Toggled to %A_IsSuspended%
Sleep 3000
HideTrayTip()
Exit

^+SC122::
Suspend, Off
mediaWindow = NULL
TrayTip AHK, MediaPlay not suspended - target window reset
Sleep 3000
HideTrayTip()
Exit

HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}
