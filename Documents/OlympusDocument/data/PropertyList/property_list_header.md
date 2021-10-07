#OLYCameraKit Property List
##Overview

* Property is setting value of camera.
* Methods to control property in OLYCameraKit can read and write property.
* There are "Read Only" properties and "Read-Write (Writable)" properties.
* The value for a writable property can be changed by specifying property name and property value.

##Methods to control property
* The following table shows methods to read property, write property, and acquire the list of properties etc.

<div class="table-desc-2-2">

<table> 
<caption> iOS </caption>
<tr>
<th>Operation</th>
<th>Corresponding Method</th>
</tr>
<tr>
<td>Get list of camera property names currently available.</td><td class="desc">cameraPropertyNames:</td>
</tr>
<tr>
<td>Get value that is set in camera properties.</td><td class="desc">cameraPropertyValue:error:</td>
</tr>
<tr>
<td>Get values that are set in camera properties.</td><td class="desc">cameraPropertyValues:error:</td>
</tr>
<tr>
<td>Get list of camera property values that can be set.</td><td class="desc">cameraPropertyValueList:error:</td>
</tr>
<tr>
<td>Set value to camera properties.</td><td class="desc">setCameraPropertyValue:value:error:</td>
</tr>
<tr>
<td>Set values to camera properties.</td><td class="desc">setCameraPropertyValues:error:</td>
</tr>
<tr>
<td>More details.</td>
<td class="desc">
See methods in <a href="../apirefiOS/category_o_l_y_camera_07_camera_system_08.html">OLYCamera(CameraSystem) Category</a>
</td>
</tr>
</table>

<table>
<caption>Android</caption>
<tr>
<th>Operation</th>
<th>Corresponding Method</th>
</tr>
<tr>
<td>Get list of camera property names currently available.</td><td class="desc">getCameraPropertyNames()</td>
</tr>
<tr>
<td>Get value that is set in camera properties.</td><td class="desc">getCameraPropertyValue(name)</td>
</tr>
<tr>
<td>Get values that are set in camera properties.</td><td class="desc">getCameraPropertyValues(names)</td>
</tr>
<tr>
<td>Get list of camera property values that can be set.</td><td class="desc">getCameraPropertyValueList(name)</td>
</tr>
<tr>
<td>Set value to camera properties.</td><td class="desc">setCameraPropertyValue(name, value)</td>
</tr>
<tr>
<td>Set values to camera properties.</td><td class="desc">setCameraPropertyValues(values)</td>
</tr>
<tr>
<td>More details.</td><td class="desc">
See methods in <a href="../apirefAndroid/classjp_1_1co_1_1olympus_1_1camerakit_1_1_o_l_y_camera.html#system">Camera System group in OLYCamera Class</a>
</td>
</tr>
</table>

</div>

##Sections and Legend of Property List

**Sections**

<div class="table-desc-2-2">

| Section | Summary |
|--|--|
|Name and Function| Name and function of property.  Property to read and write is specified by the property name.|
|Property Value| List of values to be set on the property.  The values not in this list cannot be set to the  property.|
|Access Permission |Read-only, read-write or not-supported. See the subsection below for more details.|
|Supported Shooting Mode| List of shooting modes in which the property is valid. See the subsection below for more details.|

</div>

**Access Permission**

<div class="table-desc-3">


| Wireless Standard | Access Permission |                                 Description                                  |
|-------------------|-------------------|------------------------------------------------------------------------------|
| Wi-Fi             | Read Only         | You can only get the value of property from the camera via Wi-Fi.            |
|                   | Read Write        | You can get and set the value of property to configure the camera via Wi-Fi. |
|                   | Not Supported     | Wi-Fi does not support this property.                                        |
| Bluetooth Smart               | Read Only         | You can only get the value of property from the camera via Bluetooth Smart.              |
|                   | Read Write        | You can get and set the value of property to configure the camera via Bluetooth Smart.   |
|                   | Not Supported     | Bluetooth Smart does not support this property.                                          |


</div>

**Supported Shooting Mode**

* The camera supports 10 shooting modes.
* Shooting mode can be changed by the following properties.
	* TAKEMODE
	* EXPOSE_MOVIE_SELECT
* See the table below for details of correspondence between shooting mode and property.
* See the description of property corresponding to each shooting mode in property list for more details of each shooting mode.

<div class="table-desc-10-1">

| Shooting Mode           | iAuto     | P     | A     | S     | M     | ART     | movie<br>P     | movie<br>A     | movie<br>S     | movie<br>M     |
| --------------------- | :-------: | :---: | :---: | :---: | :---: | :-----: | :------------: | :------------: | :------------: | :------------: |
| TAKEMODE              | iAuto     | P     | A     | S     | M     | ART     | movie          | movie          | movie          | movie          |
| EXPOSE_MOVIE_SELECT   |           |       |       |       |       |         | P              | A              | S              | M              |

</div>

##Property List
