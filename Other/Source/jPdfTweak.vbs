Option Explicit
'An optional VB Script file for launching jPDF Tweak

'https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/windows-scripting/9bbdkx3k(v=vs.84)
'https://www.devguru.com/content/technologies/wsh/home.html
'https://documentation.help/MS-Office-VBScript/vbstoc.htm
'https://documentation.help/MS-Office-VBScript/vsgrpruntimefeatures.htm
'https://www.informit.com/articles/article.aspx?p=1187429&seqNum=5

Dim wsh, fso
Set wsh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

Dim ScriptDir, ScriptPath, AppName, AppDirectory, AppFullDirectory, AppFullPath, ArgsString, RunCommand
ScriptPath = WScript.ScriptFullName
ScriptDir = fso.GetParentFolderName(ScriptPath)

AppName = "jpdfTweak.jar"
AppDirectory = "jpdftweak-windows-x64-1.1"
AppFullDirectory = fso.BuildPath(ScriptDir, AppDirectory)
AppFullPath = fso.BuildPath(AppFullDirectory, AppName)

Dim JavaExe, PortableJava64, PortableJava64FullPath
JavaExe = "java"
PortableJava64 = "..\PortableApps\CommonFiles\OpenJDKJRE64\bin\java.exe"
PortableJava64FullPath = fso.BuildPath(ScriptDir, PortableJava64)
If fso.FileExists(PortableJava64FullPath) Then
    JavaExe = PortableJava64FullPath
End If


If WScript.Arguments.Length > 0 Then
   Dim i
   'WshArgument objects are not arrays, so can't use array functions/methods on them
   ReDim Args(WScript.Arguments.Length - 1)
   For i = 0 To WScript.Arguments.Length - 1
      Args(i) = WScript.Arguments(i)
   Next
   
   'ArgsString = Join(Args)
   ArgsString = """" & Join(Args, """ """) & """"
   Call wsh.Popup(ArgsString)
End If

RunCommand = """" & JavaExe & """ -jar """ & AppFullPath & """ " & ArgsString

'wsh.Popup(RunCommand)
Call wsh.Run(RunCommand, 0, True)
