#!/bin/bash

# Script to start Internet Explorer from inside Windows 10 VM

echo "Starting 'Internet Explorer' browser inside a Windows 10 virtual machine"
echo ""
sleep 1
echo "This will take some time, so please be patient."

## Replace "Windows 10" with the name or UUID of your Windows virtual machine
VBoxManage startvm "Windows 10" 

## Give Windows time to settle
sleep 15

## Let's now start the browser
echo ""
echo "Now starting 'Internet Explorer'"

## Remember to replace the placeholders with your Windows username and password 
VBoxManage --nologo guestcontrol "Windows 10" run --exe "C:\Program Files\Internet Explorer\iexplore.exe" --username [your-windows-username-here] --password [your-password-here]

echo ""
echo "Now shutting down the Windows VM after saving the VM's state."
VBoxManage controlvm "Windows 10" savestate

sleep 2

#Check VM state to make sure it's been shutdown properly.
echo ""
echo "Check the VM state"
VBoxManage showvminfo "Windows 10" | grep State

exit
