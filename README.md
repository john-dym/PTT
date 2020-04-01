# PTT
AutoHotkey - Push to Talk for microphones

Quick script that assigns Caps Lock as a push to talk button for activating the microphone by adjusting the volume and the mute status. While loop to force the microphone off was necessary as some programs would force the microphone on through either the host control or the software's auto volume adjustment.

To find the correct setting for `Mic_ID` and `Component_ID` use the script supplied in the `SoundSet` AHK documentation.
https://www.autohotkey.com/docs/commands/SoundSet.htm

For the microphone properties in windows sound panel, adjust the microphone volume to a unique number and run the AHK script to locate the corresponding volume level to set the variables.
