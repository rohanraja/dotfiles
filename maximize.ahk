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


!1::WinActivate("Trello" ,"https://trello.com/b/q1GsQgYw/isolatedbrowseraccessibility")
!2::ToggleWinMinimize("win_2")
!3::ToggleWinMinimize("win_3")
!4::ToggleWinMinimize("win_4")
!5::ToggleWinMinimize("win_5")
!6::ToggleWinMinimize("win_6")

!m::WinActivate("maximize.ahk", "C:\Program Files\Microsoft VS Code\Code.exe C:\Users\roraja\Documents\maximize.ahk")

!u::ToggleWinMinimize("Unified Service Desk")
!v::ToggleWinMinimize("Microsoft Visual Studio")
!y::ToggleWinMinimize("YouTube")
!t::WinActivate("usd_onecrm", "C:\Users\roraja\Desktop\use_onecrm.lnk")
!c::WinActivate("Chrome", "http://google.com")
!o::WinActivate("Outlook", "Outlook")
!n::WinActivate("Visual Studio Code", "Visual Studio Code")
!8::WinActivate("splitbug", "D:\USDTesting\Bug_SplitFont\usd.lnk")

!r::WinActivate("AutoHotkey321424" ,"C:\Users\roraja\Documents\maximize.ahk")



 ^+c::
 ID := WinExist("A")
 WinGetClass, Class, ahk_id %ID%
 ControlGetText,ePath, Edit1, ahk_id %ID%
 if epath=
    epath=%A_desktop%
 Run, %comspec%, %epath%
return

!p::
Send ~\administrator
Send {Tab}
Send T{!}T@n1130
return


!7::

FileCopy , C:\src\CRM\target\debug\amd64\UnifiedServiceDesk.TestCaseControls.dll , C:\src\OneCRM\USD\target\USD\UnifiedServiceDesk.TestCaseControls.dll  ; mvoes the file to new location
sleep , 200
exist = %ErrorLevel% ; get the error level 0 = no errors
if exist > 0 ; what to do if there is an error like filename already exists
{
FileCopy , C:\src\CRM\target\debug\amd64\UnifiedServiceDesk.TestCaseControls.dll , C:\src\OneCRM\USD\target\USD\UnifiedServiceDesk.TestCaseControls.dll, 1  ; mvoes the file to new location

}
return

