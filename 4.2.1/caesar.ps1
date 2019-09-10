clear
$i = 0
$ascii = [char[]](97..122) ##alphabet in ASCII
write-host "Text to decrypt: "
$text = read-host
write-host "`nEnter key from 1-25: "
$key = read-host
$textlength = $text.length

write-host "`n--------------------------------------------"
while ($textlength -gt 0) ##while greater than 0
{
	$currentIndex = 0..($ascii.count -1) | where {$ascii[$_] -eq $text[$i]}
	$newIndex = $currentIndex - $key
	if ($newIndex -gt 25){
		$newIndex = $newIndex - 26
	}
	write-host -NoNewLine $ascii[$newIndex]
	$textlength --
	$i ++
}
write-host "`n--------------------------------------------`n"
