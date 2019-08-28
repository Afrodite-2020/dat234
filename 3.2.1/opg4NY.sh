read -p "enter an ip: " ipAdr
i="1"
baseip=`echo $ipAdr | cut -d"." -f1-3`
while [ $i -lt 256 ]
do
ping -c1 $baseip.$i 1>/dev/null 2>/dev/null
SUCCESS=$?

if [ $SUCCESS -eq 0 ]
then
  echo "$baseip.$i has replied"
else
  :
fi &
i=$((i + 1))
sleep 1.3
done


