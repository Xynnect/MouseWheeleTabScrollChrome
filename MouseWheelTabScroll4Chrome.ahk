; Mouse Wheel Tab Scroll 4 Chrome
; -------------------------------
; Scroll though Chrome tabs with your mouse wheel when hovering over the tab bar.
; If the Chrome window is inactive when starting to scroll, it will be activated.

#NoEnv	; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn	; Enable warnings to assist with detecting common errors.
#SingleInstance force	; Determines whether a script is allowed to run again when it is already running.
#UseHook Off	; Using the keyboard hook is usually preferred for hotkeys - but here we only need the mouse hook.
#InstallMouseHook
#MaxHotkeysPerInterval 1000	; Avoids warning messages for high speed wheel users.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
Menu, Tray, Tip, Mousewheel tab scroll for Chrome (1.0.3)

WheelUp::
WheelDown::
	MouseGetPos,, ypos, id
	MouseGetPos, xpos,, id1
	WinGetClass, class, ahk_id %id%
	WinGetClass, class, ahk_id %id1%

	WinGet windows, List
	Loop %windows%
	{
		id2 := windows%A_Index%
		WinGetTitle wt, ahk_id %id2%
		r .= wt . "`n"
	}

	If (ypos < 60 and (InStr(class,"Chrome_WidgetWin") or InStr(class,"Progman")))
	{

		IfWinNotActive ahk_id %id%
		WinActivate ahk_id %id%
		If A_ThisHotkey = WheelUp
			Send ^{PgUp}
		Else
			Send ^{PgDn}
	}
	
	;and %id1% in r
	
	Else If (ypos > 60 and xpos > 20)
	{
		If A_ThisHotkey = WheelUp
			Send {WheelUp}
		Else
			Send {WheelDown}
	}
	Else
	{
		IfWinNotActive ahk_id1 %id1%
		WinActivate ahk_id1 %id1%
		If A_ThisHotkey = WheelUp
			Gosub, goto1MouseHotkeys
			
		Else
			Gosub, goto2MouseHotkeys
			
	}
	Return

goto1MouseHotkeys:
   
Send {WheelUp}
sleep, 1
SendInput {LAlt Down}
sleep, 1
SendInput {Esc}
sleep, 1
SendInput {LAlt Up}

return

goto2MouseHotkeys: 

Send {WheelDown}
sleep, 1
SendInput {LAlt Down}
sleep, 1
SendInput {LShift Down}
sleep, 1
SendInput {Esc}
sleep, 1
SendInput {LShift Up}
sleep, 1
SendInput {LAlt Up}


return

