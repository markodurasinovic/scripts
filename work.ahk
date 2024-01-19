#Requires AutoHotKey v2.0

F1::CheckActiveWindowClass()
F8::ToggleVSCode()
F9::ToggleSTS()
F10::ToggleBrowser()
F11::ToggleTerminal()

CheckActiveWindowClass()
{
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

ToggleStandardWindow(WinMatcher, path)
{
    if WinExist(WinMatcher)
    {
        HandleExistingWindow(WinMatcher)
    }
    else
    {
        Run(path)
    }
}

ToggleBrowser()
{
    ToggleStandardWindow("ahk_class MozillaWindowClass", "C:\Program Files\Mozilla Firefox\firefox.exe")
}

ToggleSTS()
{
    ToggleStandardWindow("ahk_class SWT_Window0", "C:\Users\mdurasinovic\Documents\sts-4.11.1.RELEASE\SpringToolSuite4.exe")
}

ToggleVSCode()
{
    ToggleStandardWindow("ahk_class Chrome_WidgetWin_1", "C:\Users\mdurasinovic\AppData\Local\Programs\Microsoft VS Code\Code.exe")
}

; inspired by andrewgodwin https://gist.github.com/andrewgodwin/89920ee02501ab12d09b02500897066c