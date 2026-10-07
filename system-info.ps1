# Basic System Information Script
# IT Support Lab
# Collects useful system information for first-level troubleshooting

Write-Host "=== SYSTEM INFORMATION ==="
Get-ComputerInfo |
    Select-Object WindowsProductName, WindowsVersion, OsArchitecture

Write-Host "`n=== COMPUTER NAME ==="
Write-Host $env:COMPUTERNAME

Write-Host "`n=== CURRENT USER ==="
Write-Host $env:USERNAME

Write-Host "`n=== NETWORK CONFIGURATION ==="
Get-NetIPConfiguration

Write-Host "`n=== DISK INFORMATION ==="
Get-Volume |
    Select-Object DriveLetter, FileSystemLabel, SizeRemaining, Size

Write-Host "`n=== TOP PROCESSES BY CPU ==="
Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 10 Name, CPU, Id

Write-Host "`n=== RUNNING SERVICES ==="
Get-Service |
    Where-Object {$_.Status -eq "Running"} |
    Select-Object -First 20 Name, DisplayName, Status

Write-Host "`n=== TROUBLESHOOTING INFORMATION COMPLETE ==="
