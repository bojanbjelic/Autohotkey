#v::
Input, key, L1,,.-_luUctv?{`,}
;If ErrorLevel = Match
;{
	; MsgBox, 64, Paste special options, kk,10
	; MsgBox, 64, , "%key%", 10
	oCB := ClipBoardAll
	If key = l
	{
		StringReplace, ClipBoard, ClipBoard, `r`n, , All
		;SendPlay ^v
		SendInput %clipboard%
		ClipBoard := oCB

		;MsgBox, 64, Paste special options, l,10
	}
	If key = u
	{
		;MsgBox, 64, Paste special options, uU,10
		StringLower, lower, key
		If (key == lower)
		{
			StringLower Clipboard, Clipboard
			SendInput %clipboard%
			ClipBoard := oCB
			;MsgBox, 64, Paste special options, u,10
		}
		Else
		{
			StringUpper Clipboard, Clipboard
			SendInput %clipboard%
			ClipBoard := oCB
			;MsgBox, 64, Paste special options, U,10
		}
	}
	
	If (key = "c" or key = "t")
	{
		cl = %clipboard%
		output = 
		Loop, parse, cl, %A_Space%, %A_Space%%A_Tab%
		{
			str = %A_LoopField%
			StringUpper, str, str, T
			If (key = "c")
				output = %output%%str%
			Else
				output = %output% %str%
		}
		ClipBoard = %output%
		SendInput %clipboard%
		ClipBoard := oCB
	}
	If (key = "-" or key = "_")
	{
		StringReplace, ClipBoard, ClipBoard, %A_Space%, _, All
		StringReplace, ClipBoard, ClipBoard, `,, _, All
		StringReplace, ClipBoard, ClipBoard, ., _, All
		StringReplace, ClipBoard, ClipBoard, |, _, All
		SendInput %clipboard%
		ClipBoard := oCB
	}
	If key = ,
	{
		cl = %clipboard%
		If InStr(cl, "`r`n") > 0 { 
			StringReplace, ClipBoard, ClipBoard, `r`n, `,, All 
		} Else {
			StringReplace, ClipBoard, ClipBoard, %A_Space%, `,, All
		}
		SendInput %clipboard%
		ClipBoard := oCB
	}
	If key = v
	{
		;SendInput {Raw}%clipboard%
		ClipBoard = %clipboard%
		SendInput %clipboard%
	}
	; help message
	If key = ?
	{
		MsgBox, 64, Paste special options
			,
			(
			window + v followed by: `n 
- or _ 		replace space, comma and dot with underscore `n
l 		text in one line `n
,		paste in one line as csv
c		CamelCase `n
t		Text To Title Like This`n
v		paste as plain text`n
u		lower case
			)
			,10
	}
;}
Return