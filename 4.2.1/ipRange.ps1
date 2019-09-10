
function ping-CIDR($inIP){

if($inIP.EndsWith("/24")){

    $ipParse = $inIP.Split("\.")
    $oc1 = $ipParse[0]
    $oc2 = $ipParse[1]
    $oc3 = $ipParse[2]

    $i=1
    while($i - 255){
    ping "$oc1.$oc2.$oc3.$i"
    $i++
}
}else{
echo "Add subnet-length"
}#end if
}#End func