
$baseDir = Split-Path $PSScriptRoot
Import-Module "$baseDir\utilities\mouse-click.psm1"

Write-Host 'press Ctrl + C to stop'
Start-Sleep -Seconds 7

$j = 0
while ($j -lt 100) {
    
    # Return from bank

    Write-Host 'Returning from bank'
    click 1571 409 15
    click 1684 436 15

    # Mining Ore
    $waitTime = 22

    Write-Host 'Mining'
    # First Mine
    click 765 510 $waitTime 

    for ($i = 0; $i -lt 4; $i++) {
        write-host "round $i"
        click 963 510 $waitTime
        click 1011 548 $waitTime
        click 1096 462 $waitTime + 3
        click 854 555 $waitTime
        click 963 485 $waitTime
        
        # back to begining
        click 784 668 $waitTime + 3
    }
    write-host "Final"
    click 963 510 $waitTime
    click 1011 548 $waitTime
    click 1096 462 $waitTime + 3
    click 854 555 3
    click 963 485 3
        
    # back to begining
    click 784 668 $waitTime + 3

    # Deposit in Bank

    Write-Host 'Depositing results'
    click 1763 96 15
    click 1849 115 15
    click 1067 618 3
    click 981 805 3

    $j++
}
