#!/bin/sh

	result=$(/sbin/ifconfig | /usr/bin/grep "inet 10" | /usr/bin/awk '{ print $2 }' | head -n 1)

echo "<result>$result</result>"
