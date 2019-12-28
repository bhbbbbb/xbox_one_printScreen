#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include xinput.ahk

CoordMode, Mouse, Screen
XInput_Init()

Loop 
{
    Loop, 4 
	{
        if State:= XInput_GetState(A_Index-1)
		{
            BT := State.wButtons
			;0x2020 is Back (or View) button + the B button pressed down at the same time
			if BT = 0x2020 
			{
				Click, 950,70
				;Click, 1550,865,2
				MsgBox, It worked! Back+B button
				Sleep, 600
			}	
			;0x4020 is Back (or View) button + the X button pressed down at the same time
			if BT = 0x4020 
			{
				Send, #d
				Sleep, 600
			}

        }
    }
	Tooltip Button Info-%BT%
	Sleep, 100
}