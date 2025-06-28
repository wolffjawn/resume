#!/bin/bash

PACKAGE_FILES=(
	"$4"
    "$6"
    "$7"
    "$8"
    "$9"
)

PACKAGE_ID=(
	"$5"
)

#

removePackageFiles() {
	local package_files=("$@")
	for file in "${package_files[@]}"
	do
		/bin/rm -rf "$file"
	done
}

removePackageFiles "${PACKAGE_FILES[@]}"

#

removePackageID() {
    local package_id=("$@")
	for id in "${package_id[@]}"
	do
		/usr/sbin/pkgutil --forget "$id"
	done
}

removePackageID "${PACKAGE_ID[@]}"
