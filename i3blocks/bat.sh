#
# program to capture battery stats and calculate battery level

# this program include as well its earlier version as a 
# guide to how not to write a shell program

#total=$(cat /sys/class/power_supply/BAT0/uevent | grep -o "\w*\w" | head -n 21 | tail -n 1)
#now=$(cat /sys/class/power_supply/BAT0/uevent | grep -o "\w*\w" | head -n 23 | tail -n 1)
#result=$(awk "BEGIN{printf \"%.3f\" , ($now * 100 / $total )} ")

TOTAL=$( sed -ne '10p' /sys/class/power_supply/BAT0/uevent )
NOW=$( sed -ne '11p' /sys/class/power_supply/BAT0/uevent )

RESULT=$( printf "%.3f" $(( ${NOW##*=} * 100 / ${TOTAL##*=} )))

echo "Battery: $RESULT%"
echo "Bat: $RESULT%"

if (( $(echo "$RESULT < 20 " | bc -l) )); then echo "#FF0032" && exit; fi

if (( $(echo "$RESULT > 80 " | bc -l) )); then echo "#0F4888" && exit; fi
echo "#FFFFFF"
