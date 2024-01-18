#Requires AutoHotKey v2.0

F10::ToggleBrowser()
F11::ToggleTerminal()

CheckWindow(path, title) 
{
    Run(path)
    WinWait(title)
    WinActivate
    MsgBox(WinGetClass("A"))
}

ShowWindow(WinMatcher)
{
    WinShow(WinMatcher)
    WinActivate(WinMatcher)
}

HandleExistingWindow(WinMatcher)
{
    if WinActive(WinMatcher)
    {
        WinMinimize(WinMatcher)
    }
    else
    {
        ShowWindow(WinMatcher)
    }
}

ToggleTerminal()
{
    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    if WinExist(WinMatcher)
    {
        HandleExistingWindow(WinMatcher)
    }
    else
    {
        Run("c:\Users\mdurasinovic\AppData\Local\Microsoft\WindowsApps\wt.exe")
        Sleep(1000)
        ShowWindow(WinMatcher)
        Send("cd vagrant")
        Send("{Enter}")
        Send("vagrant up")
        Send("{Enter}")
    }
}

ToggleBrowser()
{
    WinMatcher := "ahk_class MozillaWindowClass"

    if WinExist(WinMatcher)
    {
        HandleExistingWindow(WinMatcher)
    }
    else
    {
        Run("C:\Program Files\Mozilla Firefox\firefox.exe")
        Sleep(1000)
        ShowWindow(WinMatcher)
    }
}

; inspired by andrewgodwin https://gist.github.com/andrewgodwin/89920ee02501ab12d09b02500897066c