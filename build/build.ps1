$msbuild = "'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe'"
$projectFile = "..\solution\visualstudio\OOXML.sln"
$msBuildParameters = "/p:Configuration=Release``;Platform=x64  /t:Clean,Build"
$msBuildCmd = '& ' + $msbuild + ' ' + $msBuildParameters + ' "' + $projectFile + '"'
Invoke-Expression $msBuildCmd

nuget pack Inoa.NPOI.nuspec -OutputDirectory "../build/tmp"
nuget push 'tmp\*.nupkg' '6e6c7405-484d-47b3-914b-3f7a81ce56e3' -Source 'https://inoanugetgallery.azurewebsites.net/'
rmdir -Force -Recurse tmp