#!/bin/bash
#Make sure to enable nvidia-xconfig --cool-bits=4


#This new script works with version 378.13 driver
#Old script is not functional (on Arch, at least)
#Changed up some options and flags for nvidia-settings
#Added some comments for clarity, in case other people want to make improved forks

#enable headless mode 
#request lightdm installed - apt install --no-install-recommends xorg lightdm for debian/ubuntu
headless=false
verbose=false

if [ "$headless" = true ] ; then
    export DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0
fi

#Enable user defined fancontrol for all gpu
nvidia-settings -a "GPUFanControlState=1"

while true
do

    #gpu index
    i=0

    #Get GPU temperature of all cards
    for gputemp in $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader);do
    
    if [ "$verbose" = true ] ; then
        echo "gpu ${i} temp ${gputemp}"; 
    fi

        #Note: you need to set the minimum fan speed to a non-zero value, or it won't work
        #This fan profile is being used in my GTX580 (Fermi). Change it as necessary

        #If temperature is between X to Y degrees, set fanspeed to Z value
        case "${gputemp}" in
                0[0-9])
                        newfanspeed="0"
                        ;;
                1[0-9])
                        newfanspeed="0"
                        ;;
                2[0-9])
                        newfanspeed="0"
                        ;;
                3[0-9])
                        newfanspeed="0"
                        ;;
                4[0-9])
                        newfanspeed="0"
                        ;;
                5[0-4])
                        newfanspeed="20"
                        ;;
                5[5-7])
                        newfanspeed="30"
                        ;;
                58)
                        newfanspeed="35"
                        ;;
                59)
                        newfanspeed="40"
                        ;;
                60)
                        newfanspeed="45"
                        ;;
                61)
                        newfanspeed="70"
                        ;;
                62)
                        newfanspeed="90"
                        ;;
                *)
                        newfanspeed="100"
                        ;;
        esac
        
        nvidia-settings -a "[fan-${i}]/GPUTargetFanSpeed=${newfanspeed}" 2>&1 >/dev/null
        
        if [ "$verbose" = true ] ; then
            echo "gpu ${i} new fanspeed ${newfanspeed}"; 
        fi
        
        sleep 1s
    #increment gpu index
    i=$(($i+1))
    done
done
