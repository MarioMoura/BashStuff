#
# a simple script to interactively change the screen resolution through
# xrandr

CHOICE=$(echo -e "1280x800\n1280x720\n1024x576\n960x540\n800x600\n640x360" | dmenu -fn "PxPlus IBM VGA8" -nb "#202020" -sb "#0000ff")

xrandr --output LVDS-1 --mode $CHOICE
