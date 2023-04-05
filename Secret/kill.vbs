Option Explicit
Dim fso,myArray,procName,ws

Set ws = CreateObject("Wscript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
    myArray = Array("cmd.exe","cscript.exe","wscript.exe")

For Each procName in myArray
    Call Kill(procName)
Next

'---------------------------------------------------------------------------------------------------
Sub Kill(procName)
    Dim colProcess,name,objWMIService,strComputer
        strComputer = "."
    Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
    Set colProcess = objWMIService.ExecQuery ("Select * from Win32_Process Where Name like '" & procName & "'")
    For Each name in colProcess
        name.Terminate
    Next
End Sub