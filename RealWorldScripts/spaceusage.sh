#!/bin/bash

df -h | grep -Ev "tmpfs|devtmpfs" | tail -n+2 | awk '{print $5,$1}' |  sed 's/%//' | while read usage filepath;
do 
	if [[ "$usage" -ge 50 ]];then
		echo "Check disk space usage on $filepath = $usage"
	fi
done

# Output

# Check disk space usage on /dev/loop2 = 100
# Check disk space usage on /dev/loop0 = 100
# Check disk space usage on /dev/loop1 = 100
# Check disk space usage on /dev/loop3 = 100
# Check disk space usage on VM_Shared = 56


#################################################
#                                               #
#             Easy way to achieve above         #
#                                               #
#################################################


# df -h | awk '0+$5 >= 30 {print}' | awk '{print $5,$6}'

# Output

#100% /var/lib/snapd/snap/core/16202
#100% /var/lib/snapd/snap/animationmaker/5
#100% /var/lib/snapd/snap/core/17200
#100% /var/lib/snapd/snap/core20/2496
#37% /boot
#56% /media/sf_VM_Shared
