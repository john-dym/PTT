#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Mic_ID = 4
Component_ID = Master
volume_int = 90

SetCapsLockState, Off

while true
	{
	SoundGet, mic_volume, %Component_ID%, volume, %Mic_ID%
	SoundGet, mic_status, %Component_ID%, mute, %Mic_ID%
	
	;Changes the AHK tray icon to a on and off microphone icon if files are avaliable.
	if (FileExist("mic_off.ico") and FileExist("mic_on.ico"))
		{
		if (mic_status = "On" and mic_volume = 0)
			{
			Menu, Tray, Icon, mic_off.ico
			} 
		else 
			{
			Menu, Tray, Icon, mic_on.ico
			}
		}

	key_state := GetKeyState("CapsLock", "P")

	;Forces the mic into mute and volume 0 incase another program tries to force them on I.E. Zoom
	if (mic_status = "Off" and key_state = 0)
		{
		SoundSet, 1, %Component_ID%, mute, %Mic_ID%
		}

	if (mic_volume > 0 and key_state = 0)
		{
		SoundSet, 0, %Component_ID%, volume, %Mic_ID%
		}
	}
	
CapsLock::
	SoundSet, %volume_int%, %Component_ID%, volume, %Mic_ID%
	SoundSet, 0, %Component_ID%, mute, %Mic_ID%
return