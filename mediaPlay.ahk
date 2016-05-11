mixcloudWin = NULL
SC122::
;IfWinNotActive
if mixcloudWin = NULL
{
  WinGet, mixcloudWin, ID, A
}
IfWinExist ahk_id %mixcloudWin%
{
  WinGet, working, ID, A
  WinActivate, ahk_id %mixcloudWin%
  Sleep, 50
  Send {Space}
  WinActivate, ahk_id %working%
}
Exit
