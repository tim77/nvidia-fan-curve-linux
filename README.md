# NVIDIA-Fan-Curve-Linux
Nvidia Speed Fan Control - Fan Curve
<p>
	<b>Prerequisites</b>
	<br>Run the command "sudo nvidia-xconfig --cool-bits 4"</br>
</p>

<p>
	<b>How to install:</b>
	<ul>
		<li>Download/clone the files</li>
		<li>Move the script to a directory of your choosing</li>
		<li>Edit the desktop file, and fill in the directory to the script (sh) file</li>
		<li>Move the .desktop file to /usr/share/applications/</li>
	</ul>
</p>
<p>
	<b>How to run:</b>
	<ul>
		<li>Go to the directory of the script file</li>
		<li>Go to properties -> Permissions of the file</li>
		<li>Enable "Allow executing of the file"</li>
		<li>Search for the file in your desktop environment tab/or search and run the application</li>
	</ul>
</p>

<p>
	<b>How to run on start up:</b>
	<br>You should have a tweak tool to enable it to run on startup</br>
</p>
<p>
	<b>Notes:</b>
	<ul>
		<li>If you are running gtx 700 or newer series of graphics card, you will be able to set speeds to 0. Any older cards 	will cause the script to crash.</li>
		<li>If you are running an older nvidia binary driver, and the script isn't setting the speed. Consider changing GPUTargetFanSpeed to GPUCurrentFanSpeed</li>
	</ul>
</p>
