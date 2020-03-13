#
# this program cheks if the mouse is enable in X then disable or enable it
# v2 : dosent work with any device anymore but when the mouse is reactivated
# the previous position is restored


DEVICE=$( xinput | grep "TrackPoint" | grep -oE "id=[0-9]{0,2}")
DEVICE=${DEVICE##*=}
#get mouse cordinates
POS=$(echo $(xdotool getmouselocation --shell | grep -o "[0-9]*" ) | awk '{print $1 , $2}')
FILE="/home/mario/tmp/mouse_cords"
#get mouse state in xorg
STATE=$( xinput --list-props ${DEVICE##*=} | grep "Device Enabled" | grep -o "[0-9]$" )

if [ $STATE == '1' ]
then
	xinput --disable $DEVICE
	echo $POS > $FILE
	xdotool mousemove 0 799
else
	xinput --enable $DEVICE
	xdotool mousemove $(cat $FILE | awk '{print $1, $2}')
fi

