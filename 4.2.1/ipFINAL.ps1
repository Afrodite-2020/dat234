#Kall på funksjonen "ping-CIDR" etterfulgt av IP med subnett
#eks: ping-CIDR x.x.x.x/24


function ping-CIDR($inIP){

$mask = $inIP.Substring($inIP.length - 2)
    $ipParse = $inIP.Split("\.")
    $oc1 = $ipParse[0]
    $oc2 = $ipParse[1]
    $oc3 = $ipParse[2]

$subArray = @()
$counter = 1
for($n=1;$n -lt 34; $n++){
$subArray += $counter
$counter = ($counter*2)
$subArray[$n-1] = $subArray[$n-1]-1
}#for end 
    for ($i=0; $i -le ($subArray[32-$mask]); $i++){
    ping "$oc1.$oc2.$oc3.$i" -n 1
    }#for end

    }#class end
