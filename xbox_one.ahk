#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include xinput.ahk

;CoordMode, Mouse, Screen
#IfWinActive ahk_exe SciTE.exe
XInput_Init()

Loop 
{
    Loop, 4 
	{
        if State:= XInput_GetState(A_Index-1)
		{
            BT := State.wButtons
			
			
			if(BT == 48) {
				SendInput, #!{PrintScreen}				
			}
        }
    }
	;Tooltip Button Info-%BT%
	Sleep, 100                          
}
#IF
#IfWinActive ahk_exe SciTE.exe
~^s::
MyReload("xbox_one.ahk")
return
MyReload(current_title) {
	WinGetActiveTitle, title
	IfInString, title, %current_title%
	{
		MsgBox,,, reload!!!%current_title%, 0.5
		Reload
		return
	}

}
#If