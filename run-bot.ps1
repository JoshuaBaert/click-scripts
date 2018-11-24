[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

function click {
    param ( $x, $y, $waitTime )
    $mouseClick = Get-Content -Path "C:\code\personal\click-test\mouse-click.cs"
    $mouseClick = $mouseClick -replace "`n",' '

    $SendMouseClick = Add-Type -memberDefinition "$mouseClick" -name "Win32MouseEventNew" -namespace Win32Functions -passThru

    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)

    Start-Sleep -Seconds 1
    $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0)
    $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0)
    $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0)
    $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0)
    $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0)
    $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0)

    if( $waitTime ) { Start-Sleep -Seconds $waitTime }
}

Write-Host 'press Ctrl + C to stop'

Start-Sleep -Seconds 7

$j = 0
while ($j -lt 100) {
    
    # New-Alias 'returnMining' '.\return-mining.ps1'

    Write-Host 'Returning from bank'
    click 1571 409 15
    click 1684 436 15

    # New-Alias 'mineOre' '.\mine-ore.ps1'
    $waitTime = 22

    Write-Host 'Starting Mining'
    # start from coming down
    click 765 510 $waitTime 

    for ($i = 0; $i -lt 4; $i++) {
        write-host "$i interval"
        click 963 510 $waitTime
        click 1011 548 $waitTime
        click 1096 462 $waitTime + 3
        click 854 555 $waitTime
        click 963 485 $waitTime
        
        # return
        click 784 668 $waitTime + 3
    }
    write-host "Final"
    click 963 510 $waitTime
    click 1011 548 $waitTime
    click 1096 462 $waitTime + 3
    click 854 555 3
    click 963 485 3
    
    # return
    click 784 668 $waitTime + 3

    # New-Alias 'depositCoal' '.\deposit-coal.ps1'

    Write-Host 'Depositing results'
    click 1763 96 15
    click 1849 115 15
    click 1067 618 3
    click 981 805 3

    $j++
}
