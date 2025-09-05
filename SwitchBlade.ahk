; ==============================================================
;  SwitchBlade - Hotkey-based app switcher/launcher for Windows
;  Created by: Tope Farotimi (@tfarotiimi)
;  License: MIT
;  Last Updated: 2024-09-04
; ==============================================================

#SingleInstance Force

#Include WinClip.ahk   ; make sure WinClip.ahk is next to this script
#Include WinClipAPI.ahk

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

#^r::Reload   ; Win+Ctrl+R will reload the script
#^q::ExitApp      ; Win+Ctrl+Q = quit script completely

; -----------------------------
; Hotkeys
; -----------------------------

; Win+Ctrl+X -> File Explorer (reuse existing window)
#^x::
    if WinExist("ahk_class CabinetWClass") {
        WinActivate, ahk_class CabinetWClass
        WinMaximize, ahk_class CabinetWClass
        Sleep, 80
    } else {
        Run, explorer.exe,, Max
    }
return

; Win+Ctrl+W -> Microsoft Word
#^w::AppHotkey("WINWORD.EXE", "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE")

; Win+Ctrl+E -> Microsoft Excel
#^e::AppHotkey("EXCEL.EXE", "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE")

; Win+Ctrl+P -> Microsoft PowerPoint
#^p::AppHotkey("POWERPNT.EXE", "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.EXE")

; Win+Ctrl+O -> Microsoft Outlook
#^o::AppHotkey("OUTLOOK.EXE", "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE")

; Win+Ctrl+N -> Microsoft OneNote
#^n::AppHotkey("ONENOTE.EXE", "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")

; Win+Ctrl+V -> Visual Studio Code
#^v::AppHotkey("Code.exe", "%LocalAppData%\Programs\Microsoft VS Code\Code.exe")

; Win+Ctrl+M -> Microsoft Edge
#^m::AppHotkey("msedge.exe", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")

#^c::   ; Win+Ctrl+H hotkey
    GPTHotKey()
return

; ---  ChatGPT Copy Pasta ---
GPTHotKey() {
    ; 1) Trigger copy reliably
    Clipboard := ""            ; clear
    Send, ^c
    Sleep, 120                 ; small buffer to give source app time to copy
    ClipWait, 2
    if ErrorLevel {
       ;continue even if no text copied
       text := ""  ; empty text to send
    }
    else {
    text := Clipboard         ; use Clipboard for reliability
    }

    ; 2) Activate or launch ChatGPT (path-agnostic) 
    ; MAKE SURE YOU HAVE A CHATGPT DESKTOP APP SHORTCUT IN START MENU FOLDER HERE -> C:\Users\<YOUR_WINDOWS_USERNAME>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs , FURTHER INSTRUCTIONS IN README.MD
    ; IF NOT, HOT KEY CANNOT LAUNCH CHAT GPT IF ITS NOT OPEN

    if WinExist("ahk_exe ChatGPT.exe") {
        WinActivate, ahk_exe ChatGPT.exe
        WinWaitActive, ahk_exe ChatGPT.exe, , 5
    } else {
        Run, %A_AppData%\Microsoft\Windows\Start Menu\Programs\ChatGPT.lnk
        WinWait, ahk_exe ChatGPT.exe, , 10
        WinActivate, ahk_exe ChatGPT.exe
        WinWaitActive, ahk_exe ChatGPT.exe, , 5
    }

    Sleep, 200   ; let UI settle

    ; --- Paste into ChatGPT ---
    WinClip.SetText(text)

    ; Try WinClip.Paste(), fallback to ControlSend
    if !WinClip.Paste() {
        Sleep, 150
        ControlSend,, ^v, ahk_exe ChatGPT.exe
    }


    return
}

^#F12::ListHotkeys  ; press Ctrl+Win+F12 to list active hotkeys

; -----------------------------
; Universal App Launcher Helper
; -----------------------------
AppHotkey(process, path) {
    if WinExist("ahk_exe " . process) {
        WinActivate
    } else {
        Run, %path%
        WinWait, ahk_exe %process%, , 10
        WinActivate
    }
return
}
