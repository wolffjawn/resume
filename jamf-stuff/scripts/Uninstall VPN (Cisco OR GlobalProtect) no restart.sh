#!/bin/bash

DRT=/opt/cisco/anyconnect/bin/dart_uninstall.sh
VPN=/opt/cisco/anyconnect/bin/vpn_uninstall.sh
GP=/Applications/GlobalProtect.app/Contents/Resources/uninstall_gp.sh

if [ -e "$DRT" ]; then

	$DRT
    
    if [ -e "$VPN" ]; then
    
		$VPN
        
    fi
   
   echo "Cisco AnyConnect uninstalled"
   
fi


if [ -e "$GP" ]; then
    
	$GP

	echo "GlobalProtect uninstalled"

    fi
    
    
