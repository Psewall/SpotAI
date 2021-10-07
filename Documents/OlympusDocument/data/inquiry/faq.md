#Frequently Asked Questions

## Application Development
#### How is an application developed?
+ See [Getting Started](../GettingStarted/preparation.html) guide before starting development.

####  Does application have to be installed on a mobile device to connect to the camera?
+ No. iOS and Android simulators can connect to and control the camera.

#### Does Camera Kit provide all the functions implemented in Olympus' applications?
+ Use of some functions of the camera is restricted to Olympus' applications.

#### Is API called via Bluetooth Smart totally the same as that called via Wi-Fi?
+ There are only the following slight differences.
	+ Certain API calls are only supported via Wi-FI and given an error when used via Bluetooth Smart.
	+ API to turn on the camera is only for Bluetooth Smart.

#### Is Camera Kit for products equivalent to that for prototypes? 
+ No. Use Camera Kit for product to control Olympus AIR A01.

#### Can I sell my application using Camera Kit?
+ Yes. Confirm [Application Publishing Guide](./publication.html) before you sell it.

#### Can I open my application using Camera Kit without selling it.
+ Yes. Confirm [Application Publishing Guide](./publication.html) before you open it.

## Supported Platforms

#### What OS are supported?
+ iOS and Android OS. 

#### Which version is supported for iOS and Android?
+ Versions below are recommended.
+ iOS
	+ SDK: iOS 9.0 SDK or later
	+ Development Environment: Xcode 7.0 or later
	+ Execution Environment: iOS 8.0 or later

+ Android
	+ SDK: Android SDK r24 or later
	+ Development Environment: ADT 23 or later / Android Studio 1.1 or later
	+ Execution Environment：　Android 4.0 or later

#### Does Camera Kit support PC?
+ No. 

##Operation Environment
#### Can the camera be controlled from mobile device simulator?
+ Yes, iOS and Android simulators can connect to and control the camera.

#### Is a wired connection possible while iOS or Android simulator runs?
+ No. Simultaneous connection is not possible.

## Communication
#### How does Camera Kit communicate with the camera?
+ Communication is via Wi-Fi or Bluetooth Smart.
+ Bluetooth Smart is not available when Camera Kit communicates via Wi-Fi, and vice versa.
 
#### Can Camera Kit connect to multiple mobile devices simultaneously? Can multiple Camera Kits connect to one camera simultaneously?
+ No. Only one-to-one connection is supported.

#### Can the camera connect to a router in station mode?
+ No.

#### Mobile device cannot recognize the camera as a Wi-Fi access point.
+ Please confirm the following.
	+ The camera's power is on.
	+ Wireless switch is on.
	+ Battery has enough charge.
+ Wi-Fi stops when the camera is connected to PC via USB.

#### Mobile device recognizes the camera as a Wi-Fi access point, but cannot connect.
+ Please confirm the following.
	+ The camera is not connected to another mobile device. The camera supports only one-to-one connection to a mobile device.
	+ Setting to obtain IP address is DHCP.

+ How to confirm IP address setting
	+ iOS
		+ Settings > Wi-Fi
		+ Touch an icon next to the name of access point (SSID). SSID is AIR-A01-XXXXXXXXX (XXXXXXXXX is a nine-character alphanumeric code).
	+ Android
		+ Settings > Wi-Fi
		+ Touch the name of the access point (SSID), and the IP setting is displayed.
		+ IP setting may be a hidden extra option. 
	+ Access point name and passcode are printed on a sticker placed on the back of the camera. Please remove the back cover of the camera.

#### Camera Kit fails to connect to the camera after launching application.
+ Other applications may connect to the camera. Remove other applications from the task list of mobile OS and restart your application.

#### API call gets a communication error and live view stops frequently.
+ The camera may use the same Wi-Fi communication channel as other access points. This may be improved by changing WIFI_CH camera property.

##Shoot
#### Can the camera record a movie? 
+ Yes.

#### Can multiple art filters be applied at the same time? 
+ No. One type of art filter can be applied during shooting.

#### Does Camera Kit notify an event after shutter button of the camera is pushed?
+ Yes. See API reference for details.

#### Can the camera take a picture without a mobile device?
+ Yes. Memory card is required to shoot.


#### Live view image is not displayed after application starts.
+ Confirm the following.
	+ If lens is retractable, lens is unlocked by holding lock switch and turning lens.
	+ Lens is connected to body by twisting until lens stops.

#### Can the camera take a picture without focusing?
+ Yes. Set focus mode to manual focus.
+ Or use the following lenses:
	+ lens without autofocus mechanism
	+ lens without electrical contact
	+ lens with focus mode ring known as the Snapshot Focus mechanism

#### Live view image and taken image are different.
+ Yes. Live view image is resized and compressed to transfer it in real time.

#### The camera fails to shoot and gives an error.
+ Confirm the following.
	+ Memory card is unlocked.
	+ Memory card is not full.
	+ Autofocus did not fail.
	+ If wireless condition is bad, sending and receiving control command can timeout. Move to a place where wireless condition is good.

#### The camera fails to autofocus
+ Confirm the following.
	+ There is enough distance between the camera and the subject.
	+ Contrast of the subject is very low.
	+ The camera setting is not under or over exposed.
	+ When touch focus is enabled, coordinate of focus point is within valid autofocus area.  

#### Camera Kit does not deliver all preview images during continuous shooting.
+ Some preview images may not be delivered depending on wireless condition and memory status of the camera. 

#### Does the camera support wired remote release?
+ No.

##Save and Delete
#### Where is the captured image saved?
+ Saved to memory card inserted in the camera.
+ When the drive mode is normal (single-frame shooting), the camera reserves the last picture. The picture can be transmitted through Wi-Fi connection.

#### What memory card is supported?
+ microSD card.

#### How can one delete images or movies?
+ Use API available in Camera Kit 1.1 or later to delete one image or movie at a time.
+ Use Olympus application, OA.Central or OA.Viewer 
+ Connect the camera using USB cable and delete it from PC.

#### Does Camera Kit develop RAW image?
+ No. Use Olympus Viewer 3.

##Detect Camera Status
#### Can the camera detect its position?
+ Yes. The camera detects orientation, pitch angle, and roll angle. You can access this data through Camera Kit. (iOS: levelGauge property, Android: getLevelGauge() method)

#### Does the camera detect geolocation information?
+ No. The camera has no GPS sensor.

#### What does the color of LED placed next to power button of the camera mean?
+ When blue, the camera is not connected to a mobile device.
+ When green, the camera is connected via Wi-Fi or Bluetooth Smart.
+ When orange, the camera is charging.

#### When does LED blink?
+ Rapid blinking indicates the camera is accessing the memory card.
+ Slow blinking indicates the battery level is less than 20%.
+ If fading in and out repeatedly, the camera is in sleep mode.

#### Why does the LED blink orange and the camera sounds an alert?
+ This is the case when shooting is impossible. This occurs in the following situations.
	+ Error occurs when the camera accesses memory card.
	+ Memory card has no space.
	+ Lens has an error.
	+ Temperature of the camera body is very high.

##Misc.
#### The camera is hung-up. How can I fix it?
+ Hold power button down for eight seconds, and the camera will reboot.

####  How does the camera update its firmware?
+ Use Olympus Viewer 3 or OA.Central.