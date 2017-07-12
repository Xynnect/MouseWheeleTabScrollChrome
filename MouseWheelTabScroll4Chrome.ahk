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
	;CoordMode, Mouse, Window
	MouseGetPos,, ypos, id

	WinGetClass, class, ahk_id %id%
	;WinGet, maximized, MinMax, %id%
	;WinGetPos, wX, wY, , , A

	;CoordMode, Mouse, Screen
	;MouseGetPos,, MousescreenY, id

	;ToolTip, ypos: %ypos% mY: %MousescreenY% wY: %wY% %id% %class%

	MouseGetPos, xpos,, id1

	WinGetClass, class, ahk_id %id1%

	If (ypos < 60 and (InStr(class,"Chrome_WidgetWin") or InStr(class,"Progman")))
	{



		;if (maximized)
			;WinActivate ahk_id %id%

		IfWinNotActive ahk_id %id%
			WinActivate ahk_id %id%
		If A_ThisHotkey = WheelUp
			Send ^{PgUp}
		Else
			Send ^{PgDn}
	}
	Else If (xpos < 20 )
	{



		;if (maximized)
			;WinActivate ahk_id1 %id1%

		IfWinNotActive ahk_id1 %id1%
			WinActivate ahk_id1 %id1%
		If A_ThisHotkey = WheelUp

Gosub, goto1MouseHotkeys

		Else

Gosub, goto2MouseHotkeys

	}
	Else
	{
		If A_ThisHotkey = WheelUp
			Send {WheelUp}
		Else
			Send {WheelDown}
	}
	Return


goto1MouseHotkeys:
   
SendInput {LAlt Down}
sleep, 10
SendInput {Esc}
sleep, 20
SendInput {LAlt Up}

return

goto2MouseHotkeys: 

SendInput {LAlt Down}
sleep, 10
SendInput {LShift Down}
sleep, 10
SendInput {Esc}
sleep, 20
SendInput {LShift Up}
sleep, 10
SendInput {LAlt Up}

return

