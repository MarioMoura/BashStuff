
CHOICE=$(echo -e "Normal\nRight\nLeft\nInverted" | dmenu -fn "PxPlus IBM VGA8" -nb "#202020" -sb "#0000ff")

if [ $CHOICE == "Normal" ]
then
	echo "eae"
	xrandr -o 0
	xsetwacom set 13 "Rotate" none
	xsetwacom set 15 "Rotate" none
elif [ $CHOICE == "Right" ]
then
	xrandr -o 3
	xsetwacom set 13 "Rotate" cw
	xsetwacom set 15 "Rotate" cw
elif [ $CHOICE == "Left" ]
then
	xrandr -o 1
	xsetwacom set 13 "Rotate" ccw
	xsetwacom set 15 "Rotate" ccw
elif [ $CHOICE == "Inverted" ]
then
	xrandr -o 2
	xsetwacom set 13 "Rotate" half
	xsetwacom set 15 "Rotate" half
fi

echo  $CHOICE

