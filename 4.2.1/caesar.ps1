clear

$EMsg = $null #We used this to reset the code for testing, sometimes it would bug out
$msg = $null  #Same as above

Write-Host "Do you want to decrypt or encrypt a message?"
$crypt = Read-host "d = decrypt | e = encrypt"

#Decrypting
if ($crypt -eq "d" -or $crypt -eq "D")
{
    $key = Read-Host "Key value" 
    $msg = Read-Host "Enter Message to decrypt"
    clear
    Write-Host "o------------------------------------o"
    Write-Host "Message to decrypt:" $msg
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
        
        if ($nr -ge 32 -and $nr -le 64) #Specialcharacter/Number 1
        {
        
            [string]$Snr = $nr
            [int]$Nnr = $Snr
            [string]$ELetter = [char]$Nnr      
        }

        if ($nr -ge 91 -and $nr -le 96) #Specialcharacter/Number 2
        {
            [string]$Snr = $nr
            [int]$Nnr = $Snr 
            [string]$ELetter = [char]$Nnr      
        }

        if ($nr -ge 123 -and $nr -le 126) #Specialcharacter/Number 3
        {
        
            [string]$Snr = $nr
            [int]$Nnr = $Snr
            [string]$ELetter = [char]$Nnr    
        }
        
        $EMsg = $EMsg + $Eletter
    }

    Write-Host "Decrypted Message:" $EMsg
    Write-Host "o------------------------------------o"
    Write-Host "`n"
}

#Encrypting
elseif ($crypt -eq "e" -or $crypt -eq "E")
{
    $key = Read-Host "Key value" 
    $msg = Read-Host "Enter Message to encrypt"
    clear
    Write-Host "o------------------------------------o"
    Write-Host "Message to encrypt:" $msg
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
            [int]$Enr = $Nnr + $nkey 
            if ($Enr -gt 90) {$Enr = $Enr - 26}
            if ($Enr -lt 65) {$Enr = $Enr + 26}
            [string]$ELetter = [char]$Enr        
        }  

        if ($nr -ge 97 -and $nr -le 122) #LowerCase
        {
        
            [string]$Snr = $nr
            [int]$Nnr = $Snr 
            [int]$nkey = $key
            [int]$Enr = $Nnr + $nkey 
            if ($Enr -gt 122) {$Enr = $Enr - 26}
            if ($Enr -lt 97)  {$Enr = $Enr + 26}
            [string]$ELetter = [char]$Enr      
        }

        if ($nr -ge 32 -and $nr -le 64) #Specialcharacter/Number
        {
        
            [string]$Snr = $nr
            [int]$Nnr = $Snr
            [string]$ELetter = [char]$Nnr      
        }

        if ($nr -ge 91 -and $nr -le 96) #Specialcharacter/Number 2
        {
        
            [string]$Snr = $nr
            [int]$Nnr = $Snr
            [string]$ELetter = [char]$Nnr      
        }

        if ($nr -ge 123 -and $nr -le 126) #Specialcharacter/Number 3
        {
        
            [string]$Snr = $nr
            [int]$Nnr = $Snr
            [string]$ELetter = [char]$Nnr      
        }

        $EMsg = $EMsg + $ELetter        
    }

    Write-Host "Encrypted Message:" $EMsg
    Write-Host "o------------------------------------o"
    Write-Host "`n"
}

#Errorhandle if user puts a different character than 'd', 'e', 'D' or 'E'
else {
    echo "Error: Please enter either 'd' or 'e' to select whether to decrypt or encrypt. Try again."
}


