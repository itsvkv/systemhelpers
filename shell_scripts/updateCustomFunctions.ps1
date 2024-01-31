Get-Process -Name "Telerik.ReportDesigner"|Stop-Process
Start-Sleep -Seconds 2
Copy-Item -Path "E:\Pi\reporting\CoreERP.Reporting.CustomFunctions\bin\Debug\netstandard2.0\CoreERP.Reporting.CustomFunctions.dll" -Destination "C:\Program Files (x86)\Progress\Telerik Reporting R2 2023\Report Designer"
Start-Process "C:\Program Files (x86)\Progress\Telerik Reporting R2 2023\Report Designer\Telerik.ReportDesigner.exe"