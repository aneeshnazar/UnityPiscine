#!/bin/bash

# Unity installer script
# Should be run as root

EDITOR="https://netstorage.unity3d.com/unity/fc1d3344e6ea/MacEditorInstaller/Unity-2017.3.1f1.pkg";
STDASSETS="https://netstorage.unity3d.com/unity/fc1d3344e6ea/MacStandardAssetsInstaller/StandardAssets-2017.3.1f1.pkg";
EXAMPLES="https://netstorage.unity3d.com/unity/fc1d3344e6ea/MacExampleProjectInstaller/Examples-2017.3.1f1.pkg";
MONODEV="http://download.unity3d.com/download_unity/fc1d3344e6ea/MacMonoDevelopInstaller/UnityMonoDevelop.pkg";

curl $EDITOR > /tmp/Unity-2017.pkg;
curl $STDASSETS > /tmp/StandardAssets-2017.pkg;
curl $EXAMPLES > /tmp/Examples-2017.pkg;
curl $MONODEV > /tmp/UnityMonoDevelop.pkg;

cd /tmp;
for i in $(echo "Unity-2017.pkg StandardAssets-2017.pkg Examples-2017.pkg UnityMonoDevelop.pkg"); do
	#echo sudo -S '/usr/sbin/installer -pkg '$i' -target MacOS -verbose'
	/usr/sbin/installer -pkg $i -target /Volumes/Mac\ OS -verbose && rm -f $i || echo "Failed to install $i";
done
