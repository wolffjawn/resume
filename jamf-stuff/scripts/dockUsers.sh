#! /bin/zsh

# EDIT/REPLACE DEFAULT DOCK WITH USER DEFAULT DOCK
# Written by Eric R. Miller using DockUtil
# 2022 Edited by Jonathan Wolff based of Jamf Nation article about Monterey Macs
# 2nd edit by Jonathan Wolff to use an array vs repetitive code
# DFC 2023


dockutilbin=$(/usr/bin/which dockutil)
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
loggedInUserPlist="/Users/$loggedInUser/Library/Preferences/com.apple.dock.plist"

# Add the path(s) for the application(s) to be included in the Dock 
#in order they appear below.

DOCK_APP_ARRAY=(
	"file:///System/Applications/Launchpad.app/"
    "/System/Applications/Utilities/Screenshot.app"
    "/Applications/Google Chrome.app"
    "/Applications/Microsoft Edge.app"
    "/Applications/Microsoft Outlook.app"
    "/Applications/Microsoft Teams.app"
    "/Applications/Microsoft OneNote.app"
    "/Applications/Microsoft Word.app"
    "/Applications/Microsoft Excel.app"
    "/Applications/Microsoft PowerPoint.app"
    "/Applications/OneDrive.app"
    "/Applications/VMware Horizon Client.app"
    "/Applications/Self Service.app"
)


$dockutilbin --remove all --no-restart $loggedInUserPlist; sleep 2
echo "Dock Cleared"

for APPNAME in "${DOCK_APP_ARRAY[@]}"; do
      $dockutilbin --add "$APPNAME" --no-restart $loggedInUserPlist
done
echo "Array Done"

if [ -d '/System/Applications/System Preferences.app' ]; then
	$dockutilbin --add '/System/Applications/System Preferences.app' --no-restart $loggedInUserPlist
else
    $dockutilbin --add '/System/Applications/System Settings.app' --no-restart $loggedInUserPlist    
    fi

$dockutilbin --add '~/Downloads' --display stack --view auto $loggedInUserPlist

echo "Done"

exit 0



#Additional Examples from jamfnation code
#$dockutilbin --add '' --type spacer --section apps --no-restart $loggedInUserPlist
#echo "Spacer Added"

#$dockutilbin --add file:///Applications/PCClient.app/ --label Papercut --no-restart $loggedInUserPlist
#$dockutilbin --add '/Applications/' --view grid --display folder --sort name --no-restart $loggedInUserPlist