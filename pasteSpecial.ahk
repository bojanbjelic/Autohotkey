#v::
Input, key, L1,,.-_luUctv?{`,}

__oCB := ClipBoardAll

; l = single line
If key = l
{
	StringReplace, ClipBoard, ClipBoard, `r`n, , All
}

; u / U = lowercase / uppercase
If key = u
{
	StringLower, lower, key
	If (key == lower) {
		StringLower Clipboard, Clipboard
	}
	Else {
		StringUpper Clipboard, Clipboard
	}
}

; c = CamelCase
; t = As A Title
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
}

; -/_ = replace blanks with _; removes `.|
If (key = "-" or key = "_")
{
	StringReplace, ClipBoard, ClipBoard, %A_Space%, _, All
	StringReplace, ClipBoard, ClipBoard, `,, _, All
	StringReplace, ClipBoard, ClipBoard, ., _, All
	StringReplace, ClipBoard, ClipBoard, |, _, All
}

; , = output new lines or spaces as CSVs
If key = ,
{
	If InStr(ClipBoard, "`r`n") > 0 { 
		StringReplace, ClipBoard, ClipBoard, `r`n, `,, All 
	} Else {
		StringReplace, ClipBoard, ClipBoard, %A_Space%, `,, All
	}
}

; v = plain text
If key = v
{
	ClipBoard = %ClipBoard%
}

; help message
If key = ?
{
	MsgBox, 64, Paste special shortcuts
		,
		(
		window + v followed by: `n 
- or _ 		replace space, comma and dot with underscore `n
l 		text in one line `n
,		paste in one line as csv `n
c		CamelCase `n
t		Text To Title Like This`n
v		paste as plain text`n
u		lower case
U		UPPER case
		)
		,10
}
Else
{
	Send ^v
}

Sleep 100
ClipBoard := __oCB
__oCB :=

Return
