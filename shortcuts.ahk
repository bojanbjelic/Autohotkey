:*:@utc::
timeUTC := A_NowUTC
FormatTime, new1, %timeUTC%,yyyy-MM-ddTHH:mmZ
SendInput %new1%
return

:*:@cet::
timeUTC := A_Now
FormatTime, new1, %timeUTC%,yyyy-MM-ddTHH:mmZ
SendInput %new1%
return

:*:@date::
timeUTC := A_Now
FormatTime, new1, %timeUTC%,yyyy-MM-dd
SendInput %new1%
return

:*:@time-::
timeUTC := A_Now
FormatTime, new1, %timeUTC%,HH-mm-ss
SendInput %new1%
return

:*:@eur::
SendInput €
return

:*:@currencies::
SendInput ¤ € £ ￥¢ $ ₪ ௹ ﷼
return

:*:@chars::
SendInput ✔×✖★☆≈←→↑↓↪↩↘⤴⤵±👋👽👍💀
return

:*:@arrows::
SendInput ←→↑↓↪↩↘⤴⤵
return

:*:@->::
SendInput →
return

:*:@--::
SendInput —
return

; Caps Lock - disabled
CapsLock::
*CapsLock::
Return

; Win+T - toggle the active window on top
#t:: WinSet, AlwaysOnTop, Toggle, A

; Win+O - copy selection to clipboard and open file
#o:: 
clipboard =
Send, ^c
ClipWait, 2
If ErrorLevel = 0
	Run %clipboard%
Return
