clear
$key = Read-Host "Key value" 
$msg = Read-Host "Enter Encrypted Message"
clear
Write-Host "o------------------------------------o"
Write-Host "Encrypted Message:" $msg
Write-Host "o------------------------------------o"
$String = [char[]]$msg

foreach ($letter in $String)
{
    $nr = [int[]][char]$letter
    if ($nr -ge 65 -and $nr -le 90) #UpperCase
    {
        [string]$Snr = $nr
        [int]$Nnr = $Snr 
        [int]$nkey = $key
        [int]$Enr = $Nnr - $nkey 
        if ($Enr -gt 90) {$Enr = $Enr - 26}
        if ($Enr -lt 65) {$Enr = $Enr + 26}
        [string]$ELetter = [char]$Enr        
    }  

    if ($nr -ge 97 -and $nr -le 122) #LowerCase
    {
        [string]$Snr = $nr
        [int]$Nnr = $Snr 
        [int]$nkey = $key
        [int]$Enr = $Nnr - $nkey 
        if ($Enr -gt 122) {$Enr = $Enr - 26}
        if ($Enr -lt 97)  {$Enr = $Enr + 26}
        [string]$ELetter = [char]$Enr      
    }    
    $EMsg = $EMsg + $ELetter    
}

Write-Host "Decrypted Message:" $EMsg
Write-Host "o------------------------------------o"
Write-Host "`n"
$EMsg = $null #We used this to reset the code for testing, sometimes it would bug out