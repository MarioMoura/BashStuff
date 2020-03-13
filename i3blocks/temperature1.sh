#
# a program to consult cores temperature using lm_sensors package
#

RAW=$(sensors | grep Core | awk '{print $3}')

C1=$(echo "$RAW" | tail -n 1)


echo "🌡 1:$C1"
echo ""

C1=$( echo $C1 | grep -o "[0-9]*\.[0-9]")

if (( $(echo "$C1 > 70" | bc -l ) )) ;then echo "#FF0032" && exit ;fi
if (( $(echo "$C1 < 45" | bc -l ) )) ;then echo "#0F4888" && exit ;fi

