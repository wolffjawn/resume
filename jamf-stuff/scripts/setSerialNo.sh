#!/bin/sh

#setComputerNameToHardwareSerialNumber
setComputerNameToHardwareSerialNumber() {
	HARDWARE_SERIAL_NUMBER=$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Serial/ {print $4}')
    SYSTEM_PREFERENCES=(
    	ComputerName
		LocalHostName
		HostName
	)
    
	for SYSTEM_PREFERENCE in "${SYSTEM_PREFERENCES[@]}"
	do
		/usr/sbin/scutil --set $SYSTEM_PREFERENCE $HARDWARE_SERIAL_NUMBER
	done
}
setComputerNameToHardwareSerialNumber
