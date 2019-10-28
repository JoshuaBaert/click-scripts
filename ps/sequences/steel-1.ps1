$baseDir = Split-Path $PSScriptRoot
Import-Module "$baseDir\utilities\mouse-click.psm1"
Import-Module "$baseDir\utilities\mouse-right-click.psm1"
Import-Module "$baseDir\utilities\mouse-single-click.psm1"
Import-Module "$baseDir\utilities\press-keys.psm1"

Write-Host 'press Ctrl + C to stop'
Start-Sleep -Seconds 7

$j = 0
while ($j -lt 100) {

    Write-Host 'Stocking Up'
    rightClick 654 334 2
    singleClick 654 394 2
    rightClick 701 338 2
    singleClick 701 447 2

    Write-Host 'Headed to Furnace'
    click 1827 254 15

    Write-Host 'Smelting'
    click 1086 582 3
    click 1060 674 24

    Write-Host 'Depositing Results'
    click 1601 258 14
    click 893 632 3
    click 981 805 3
    $j++
}


