mkdir 'C:\Program Files\telegraf'
Set-Location -Path 'C:\Program Files\telegraf'
Stop-Service telegraf -Force
.\telegraf.exe --service uninstall
cmd.exe /c sc delete telegraf
Start-Sleep -Seconds 10
Copy-Item -Force -Path "\\wn44.blijdorp.ad\SYSVOL\blijdorp.ad\scripts\telegraf.conf" -Destination "C:\Program Files\telegraf\telegraf.conf"
Copy-Item -Path "\\wn44.blijdorp.ad\SYSVOL\blijdorp.ad\scripts\telegraf.exe" -Destination "C:\Program Files\telegraf\telegraf.exe"
.\telegraf.exe --service install
Start-Sleep -Seconds 10
Set-Service telegraf -StartupType Automatic
Start-Service telegraf
