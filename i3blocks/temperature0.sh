#
# a program to consult cores temperature using lm_sensors package
#

RAW=$(sensors | grep Core | awk '{print $3}')

C0=$(echo "$RAW" | head -n 1)


echo "🌡 0:$C0"
echo ""


C0=$( echo $C0 | grep -o "[0-9]*\.[0-9]")

if (( $(echo "$C0 > 70" | bc -l ) )) ;then echo "#FF0032" && exit ;fi
if (( $(echo "$C0 < 45" | bc -l ) )) ;then echo "#0F4888" && exit ;fi

