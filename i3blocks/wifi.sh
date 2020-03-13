#
# a program to deliver internet SSID, IP address and Network quality
# to i3blocks following its syntaxe
#
# v 2.0 : error coverage added in case of blocked interface
#



p_exit(){
	echo "W: down"
	echo ""
	echo "#FF0032"
	exit 0
}
n_exit(){
	echo "W: not connected"
	echo ""
	echo "#FF0032"
	exit 0
}
POWER=$(iwconfig wls1 | grep -o "Tx-Power=\w*" | cut -d \= -f 2)

test "$POWER" = "off" && p_exit

SSID=$(iwconfig wls1  | grep -o "\".*\"" | tr -d \")

[ -z "$SSID" ] && n_exit 

QUALITY=$(iwconfig wls1 | grep -o "[0-9][0-9]/[0-9][0-9]")

QUALITY=$((100 * $QUALITY ))

IP=$(hostname -i)

echo "W: ($SSID) $IP $QUALITY%"
echo "W: ($SSID) $IP $QUALITY%"

if test "$QUALITY" -lt 80
then
	echo "#FFFFFF"
elif test "$QUALITY" -lt 50
then
	echo "#FF0032"
else
	echo "#0F4888"
fi
