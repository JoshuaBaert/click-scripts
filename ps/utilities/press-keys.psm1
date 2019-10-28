Add-Type -AssemblyName System.Windows.Forms 
function pressKeys {
    param( [string]$keys )
    Start-Sleep 2

    $keys.ToCharArray() | ForEach-Object {
        Start-Sleep -Seconds 0.4
        [System.Windows.Forms.SendKeys]::SendWait($_)
    }
}
