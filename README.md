# Switchblade  
*Switching Fast and Furious between Windows with Hotkeys*  
by **Tope Farotimi**

📅 Latest Update: **September 2025**


---

## 🚀 What is Switchblade?

Do you find yourself switching between multiple windows while writing a thesis/research paper or coding a machine learning pipeline? 

Is the constant reaching for the mouse, looking for the window you want taxing your ADHD brain and killing your concentration?

Do you keep copying and pasting back and forth from MS Word/Powerpoint/VS Code to Chat GPT? 

If so, this just might be the app for you. 

Switchblade is a lightweight AutoHotkey-based utility that allows you to use some easy shortcuts to switch between the different programs you're working in for your project. 

With a little practice and muscle memory, you'll forget your mouse exists -- your fingers will fly and your keyboard will clatter like you're a hacker in a movie. "Aaaaaand....I'm in!" 

Read more to learn how below...

---

## ⌨️ Default Hotkeys

| Hotkey            | Action                           |
|-------------------|----------------------------------|
| **Win+Ctrl+X**    | Open File Explorer (reuse if open, restore/maximize if minimized) |
| **Win+Ctrl+E**    | Open Microsoft Excel             |
| **Win+Ctrl+W**    | Open Microsoft Word              |
| **Win+Ctrl+P**    | Open Microsoft Powerpoint             |
| **Win+Ctrl+W**    | Open Microsoft Word              |
| **Win+Ctrl+V**    | Open Visual Studio Code (reuse if open) |
| **Win+Ctrl+C**    | Open ChatGPT desktop app (custom configuration below) |
| **Ctrl+Win+Esc**  | Exit Switchblade                 |

*(You can edit `switchblade.ahk` to add or customize more.)*

---

## 🛠️ How to Use

### Option 1: Run the EXE (recommended for most users)
1. Download or compile `Switchblade.exe`.
2. Double-click to run — you’ll see the green "H" icon in your tray.
3. Your hotkeys are now active....

> If **ChatGPT doesn’t open** with `Win+Ctrl+C`:  
> - Right-click the `switchblade.ahk` source file.  
> - Edit the path in the ChatGPT hotkey section to match your installed app (CHATGPT.exe)  
> - Recompile to a .exe file by right-clicking on the .ahk file or run the `.ahk` version.

---

### Option 2: Run the AHK source directly
1. Download `switchblade.ahk`, `WinClip.ahk` and `WinClipAPI.ahk` 
2. Install [AutoHotkey](https://www.autohotkey.com/).  
3. Double-click `switchblade.ahk`.  
4. Tray icon appears, hotkeys work the same.  

This method is easier if you plan to edit your own hotkeys.

---

## 🔄 Startup Setup (auto-launch at login)

You can make Switchblade start automatically with Window. This is important if you don't want to have to click the .exe or .ahk files everytime you start up your computer.

### Method 1: Run command
1. In File Explorer, create a shortcut to `Switchblade.exe` (or to your `.ahk` if you run that) by right-clicking on the file.   
2. Copy the shortcut file.
3. Press **Win+R**.  
4. Type:  shell:startup and press Enter.  
5. Paste the shortcut file into this folder. 

### Method 2: Explorer
1. In File Explorer, create a shortcut to `Switchblade.exe` (or to your `.ahk` if you run that) by right-clicking on the file.   
2. In the address bar, type:  shell:startup and press Enter.  
3. Copy a shortcut to `Switchblade.exe` (or to your `.ahk` if you run that) into this folder.

Done — Switchblade will now launch every time you log in.

---

## ✨ Tips
- To stop Switchblade quickly, use **Ctrl+Win+Esc** or right-click the tray icon → *Exit*.  
- You can assign any app to a **Win+Ctrl+<key>** combo — just edit `switchblade.ahk`.  
- For it to work with Chat GPT, you need to make sure you’ve installed the desktop app (from the Microsoft Store). 

---

## 📦 Project Structure

```text
switchblade/
├─ switchblade.ahk     # Source script (edit this for new hotkeys)
├─ Switchblade.exe     # Compiled executable (recommended for casual users)
├─ WinClip.ahk         # Clipboard utility wrapper (required if running the .ahk source)
├─ WinClipAPI.ahk      # Low-level clipboard API (required if running the .ahk source)
├─ README.md           # This file
└─ .gitignore          # Ignore compiled files, logs, shortcuts

```text
---

May your fingers fly true and swift! 🗡️⌨️
