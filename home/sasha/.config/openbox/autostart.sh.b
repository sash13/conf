# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.
##############################################################
# Panel Section
##############################################################
# pypanel, my favorite panel for openbox
#(sleep 3 && pypanel) &
# Use the wbar Launcher if you would like.  Don't forget to install it before uncommenting
# wbar &
# If you're going to use the gnome-panel, put a '#' in front of fbpanel & above and uncomment the next line
# gnome-panel &
(sleep 3 && tint2) &

#############################################################
# Gnome Integration Section
#############################################################
# This section let's Gnome give us some of its desktopiness
gnome-power-manager &
nm-applet --sm-disable &
/usr/libexec/gnome-settings-daemon &
gnome-volume-manager --sm-disable &
gnome-keyring-daemon &

###########################################################
# Other Add-on's for Openbox
###########################################################
# Make your wallpaper restore to last setting using Nitrogen.
nitrogen --restore &
parcellite &
volumeicon &

################################# End ###################
