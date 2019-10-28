[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
function singleClick {
    param ( $x, $y, $waitTime )
    $mouseClick = Get-Content -Path "$PSScriptRoot\mouse-click.cs"
    $mouseClick = $mouseClick -replace "`n",' '

    $SendMouseClick = Add-Type -memberDefinition "$mouseClick" -name "Win32MouseEventNew" -namespace Win32Functions -passThru

    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)

    Start-Sleep -Seconds 1
    $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0)
    $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0)

    if( $waitTime ) { Start-Sleep -Seconds $waitTime }
}
