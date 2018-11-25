
$baseDir = Split-Path $PSScriptRoot
Import-Module "$baseDir\utilities\mouse-click.psm1"

Write-Host 'press Ctrl + C to stop'
Start-Sleep -Seconds 7

$j = 0
while ($j -lt 3) {
    Write-Host 'Returning from bank'
    click 1865 358 21
    click 1691 376 10

    Write-Host 'Mining'
    $miningTime = 4

    # First Mine
    click 858 591 $miningTime

    for ($i = 0; $i -lt 7; $i++) {
        write-host "round $i"
        click 1104 552 $miningTime
        click 849 632 $miningTime
        click 958 509 $miningTime

        # Reset
        click 916 514 $miningTime
    }

    # Depositing in bank
    click 1746 154 10
    click 1563 169 21
    click 958 585 3
    click 981 805 3

    $j++
}

