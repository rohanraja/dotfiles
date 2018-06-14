ToggleWinMinimize(TheWindowTitle)
{
SetTitleMatchMode,2
DetectHiddenWindows, Off
IfWinActive, %TheWindowTitle%
{
WinMinimize, %TheWindowTitle%
}
Else
{
IfWinExist, %TheWindowTitle%
{
WinGet, winid, ID, %TheWindowTitle%
DllCall("SwitchToThisWindow", "UInt", winid, "UInt", 1)
}
}
Return
}


WinActivate( TheWindowTitle, TheProgramTitle )
{
	SetTitleMatchMode,2
	DetectHiddenWindows, Off
	
	IfWinExist, %TheWindowTitle%
	{
		WinGet, winid, ID, %TheWindowTitle%
		DllCall("SwitchToThisWindow", "UInt", winid, "UInt", 1)
	}
	Else
	{
		Run %TheProgramTitle%
	}
	Return
}


 ^+c::
 ID := WinExist("A")
 WinGetClass, Class, ahk_id %ID%
 ControlGetText,ePath, Edit1, ahk_id %ID%
 if epath=
    epath=%A_desktop%
 Run, %comspec%, %epath%
return