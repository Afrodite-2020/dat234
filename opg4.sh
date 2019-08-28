read -p "enter an ip: " ipAdr
i="1"
baseip=`echo $ipAdr | cut -d"." -f1-3`

while [ $i -lt 256 ]
do 
nmap -n -sn $baseip.$i -oG - | awk '/Up$/{print $2}' &
i=$((i + 1))
sleep 1.3
done 
