#Requires AutoHotkey v2.0

GroupAdd "GCode", "ahk_exe Code.exe"
GroupAdd "GVs", "ahk_exe devenv.exe"
GroupAdd "GMsedge", "ahk_exe msedge.exe"
GroupAdd "Gexplorer", "ahk_class CabinetWClass"


#1::
{
    if WinExist("ahk_exe Code.exe")
        GroupActivate "GCode", "r"
    else
        Run "C:\Users\Vamsiv\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}

#2::
{
    if WinExist("ahk_exe devenv.exe")
        GroupActivate "GVs", "r"
    else
        Run "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
}

#3::
{
    if WinExist("ahk_class CabinetWClass")
        GroupActivate "Gexplorer", "r"
    else
        Run('explorer')
}


#4::  ; Win+1
{
    if WinExist("ahk_exe msedge.exe")
        GroupActivate "GMsedge", "r"
    else
        Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
}

#5::  ; Ctrl+Alt+T
{
    if WinExist("ahk_exe ms-teams.exe")
        WinActivate
    else
        Run "C:\Users\Vamsiv\AppData\Local\Microsoft\Teams\current\Teams.exe"
}

#6::  ; Ctrl+Alt+M
{
    if WinExist("ahk_exe olk.exe")
        WinActivate
    else
        Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"
}

#7::  ; Ctrl+Alt+D
{
    if WinExist("ahk_exe Fork.exe")
        WinActivate
    else
        Run "C:\Users\Vamsiv\AppData\Local\Fork\Fork.exe"
}


#9::  ; Ctrl+Alt+D
{
    if WinExist("ahk_exe dbeaver.exe")
        WinActivate
    else
        Run "C:\Users\Vamsiv\AppData\Local\DBeaver\dbeaver.exe"
}

#0::  ; Ctrl+Alt+D
{
    if WinExist("ahk_exe Reader.exe")
        WinActivate
    else
        Run "C:\Users\Vamsiv\AppData\Local\Reader\Reader.exe"
}



!b::  ; Alt+B
{
   Run "msedge.exe https://git.campsystems.com/dashboard/"
}



