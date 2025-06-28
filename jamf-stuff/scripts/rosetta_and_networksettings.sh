#!/bin/sh

#deploy Rosetta to Apple Silicon
deployRosettaToAppleSilicon() {
	if [ $(/usr/bin/uname -m) == 'arm64' ]; then
		/usr/sbin/softwareupdate --install-rosetta --agree-to-license
	fi
}
deployRosettaToAppleSilicon

#setComputerNameToHardwareSerialNumber
#setComputerNameToHardwareSerialNumber() {
#	HARDWARE_SERIAL_NUMBER=$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Serial/ {print $4}')
#    SYSTEM_PREFERENCES=(
#    	ComputerName
#		LocalHostName
#		HostName
#	)
    
#	for SYSTEM_PREFERENCE in "${SYSTEM_PREFERENCES[@]}"
#	do
#		/usr/sbin/scutil --set $SYSTEM_PREFERENCE $HARDWARE_SERIAL_NUMBER
#	done
#}
#setComputerNameToHardwareSerialNumber


#set system preferences to allow standard user to make network changes
security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.network allow
security authorizationdb write system.services.systemconfiguration.network allow
security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.datetime allow

#
#/usr/local/bin/jamf policy -verbose
