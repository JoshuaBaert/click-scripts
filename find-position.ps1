[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

$X = [System.Windows.Forms.Cursor]::Position.X
$Y = [System.Windows.Forms.Cursor]::Position.Y
Write-Output "X: $X -- Y: $Y"
Write-Output "$X $Y"