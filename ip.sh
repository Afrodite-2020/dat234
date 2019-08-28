#read -p "Enter IP-address: " ip_address

input=$1
i="1"
baseip=`echo $input | cut -d"." -f1-3`

while [ $i -lt 256 ]
do
ping -c1 -w1 $baseip.$i &
i=$((i + 1))
done
