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

ToggleStandardWindow(WinMatcher, path)
{
    if WinExist(WinMatcher)
    {
        HandleExistingWindow(WinMatcher)
        return "EXISTING"
    }
    else
    {
        Run(path)
        return "NEW"
    }
}

ToggleTerminal()
{
    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"
    Result := ToggleStandardWindow(WinMatcher, "c:\Users\mdurasinovic\AppData\Local\Microsoft\WindowsApps\wt.exe")
    if (Result == "NEW")
    {
        Sleep(1000)
        WinActivate(WinMatcher)
        Send("cd vagrant")
        Send("{Enter}")
        Send("vagrant up")
        Send("{Enter}")
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
