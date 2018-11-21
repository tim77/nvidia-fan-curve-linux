# NVIDIA Fan Curve Linux

NVIDIA Speed Fan Control

## Prerequisites

Run the command
	
	sudo nvidia-xconfig --cool-bits 4
	
Or manually add in **Section "Screen"**

    Option         "Coolbits" "4"

## How to install

1. Download/clone the files.

2. Move the script to a directory of your choosing.

3. Edit the desktop file, and fill in the directory to the script (sh) file.

4. Move the .desktop file to `/usr/share/applications/`

## How to run
	
1. Go to the directory of the script file.

2. Go to properties -> Permissions of the file

3. Enable "Allow executing of the file".

4. Search for the file in your desktop environment tab/or search and run the application.

##	How to run on start up

You should have a tweak tool to enable it to run on startup.

## Notes

* If you are running gtx 700 or newer series of graphics card, you will be able to set speeds to 0. Any older cards 	will cause the script to crash.

* If you are running an older nvidia binary driver, and the script isn't setting the speed. Consider changing GPUTargetFanSpeed to GPUCurrentFanSpeed.