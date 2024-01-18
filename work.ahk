#Requires AutoHotKey v2.0

F11::ToggleTerminal()

ShowWindow(WinMatcher)
{
    WinShow(WinMatcher)
    WinActivate(WinMatcher)
}

ToggleTerminal()
{
    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    if WinExist(WinMatcher)
    ; Window Exists
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
    else
    {
        Run "c:\Users\marko\AppData\Local\Microsoft\WindowsApps\wt.exe"
        Sleep(1000)
        ShowWindow(WinMatcher)
        Send("cd vagrant")
        Send("{Enter}")
        Send("vagrant up")
        Send("{Enter}")
    }
}

; inspired by andrewgodwin https://gist.github.com/andrewgodwin/89920ee02501ab12d09b02500897066c