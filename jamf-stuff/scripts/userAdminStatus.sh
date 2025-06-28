#!/bin/bash

# Get the Username of the currently logged user
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

# "a" to add "d" to delete

dseditgroup -o edit -"$4" $loggedInUser -t user admin 

echo "$3 admin status has changed."
