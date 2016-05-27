mediaWindow = NULL
SC122::
;IfWinNotActive
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
