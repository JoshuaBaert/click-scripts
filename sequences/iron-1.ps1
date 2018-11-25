# $thisDir = $PSScriptRoot
# $baseDir = $thisDir -replace '`\sequences',''

$baseDir = Split-Path $PSScriptRoot

Write-Host $baseDir