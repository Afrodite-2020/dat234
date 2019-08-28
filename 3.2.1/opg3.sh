read -p "enter an ip: " ipAdr
i="1"
baseip=`echo $ipAdr | cut -d"." -f1-3`
while [ $i -lt 256 ]
do
ping -c1 -w1 $baseip.$i &
i=$((i + 1))
sleep 1.3
done


