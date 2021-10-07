####White Balance
**Name and Function**

<div class="table-artfilter-1">

|Property Name |     Function     |
|--------------|------------------|
| WB           | White Balance |

</div>

**Property Value**

<div class="table-artfilter-1">

|   Property Value  |                                                                           Description                                                                           |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| WB_AUTO           | Auto White Balance <br>Used for most light conditions (when there is a white object in the frame). Use this mode for general use.                     |
| MWB_FINE          | Preset white balance for shooting outdoors on a clear day, to capture the reds in a sunset or the colors in a fireworks display. Color temperature is 5300K. |
| MWB_SHADE         | Preset white balance for shooting outdoors in the shadows on a clear day. Color temperature is 7500K.                                                           |
| MWB_CLOUD         | Preset white balance for shooting outdoors on a cloudy day. Color temperature is 6000K.                                                                         |
| MWB_LAMP          | Preset white balance for shooting under a tungsten light. Color temperature is 3000K.                                                                           |
| MWB_FLUORESCENCE1 | Preset white balance for shooting under fluorescent lights. Color temperature is 4000K.                                                                        |
| MWB_WATER_1       | Preset white balance for underwater photography. Color temperature is 5500K.                                                                                    |
| WB_CUSTOM1        | Custom White Balance. Select color temperature in terms of Kelvin using CUSTOM_WB_KELVIN_1 property.                                                            |

</div>

**Access Permission**
<div class="table-art-access">

|   Wi-Fi    | Bluetooth Smart |
|------------|-----------------|
| Read/Write | Read/Write      |

</div>

**Supported Shooting Mode**
<div class="table-art-conflict">

| iAuto | P  | A  | S  | M  | ART | movieP | movieA | movieS | movieM |
|-------|----|----|----|----|-----|--------|--------|--------|--------|
|       | OK | OK | OK | OK | OK	| OK     | OK     | OK     | OK     |

</div>

####Custom White Balance Color Temperature
**Name and Function**

<div class="table-artfilter-1">

|   Property Name    |                                            Function                                           |
|--------------------|-----------------------------------------------------------------------------------------------|
| CUSTOM_WB_KELVIN_1 | White balance using Kelvin <br> This property is valid when WB property is set to WB_CUSTOM1. |

</div>

**Property Value**

<div class="table-artfilter-1">

| Property Value | Description  |
|--------------|--------|
|         2000 | 2000K  |
|         2050 | 2050K  |
|         2100 | 2100K  |
|         2150 | 2150K  |
|         2200 | 2200K  |
|         2250 | 2250K  |
|         2300 | 2300K  |
|         2350 | 2350K  |
|         2400 | 2400K  |
|         2450 | 2450K  |
|         2500 | 2500K  |
|         2550 | 2550K  |
|         2600 | 2600K  |
|         2650 | 2650K  |
|         2700 | 2700K  |
|         2750 | 2750K  |
|         2800 | 2800K  |
|         2900 | 2900K  |
|         3000 | 3000K  |
|         3100 | 3100K  |
|         3200 | 3200K  |
|         3300 | 3300K  |
|         3400 | 3400K  |
|         3500 | 3500K  |
|         3600 | 3600K  |
|         3700 | 3700K  |
|         3800 | 3800K  |
|         3900 | 3900K  |
|         4000 | 4000K  |
|         4200 | 4200K  |
|         4400 | 4400K  |
|         4600 | 4600K  |
|         4800 | 4800K  |
|         5000 | 5000K  |
|         5200 | 5200K  |
|         5400 | 5400K  |
|         5600 | 5600K  |
|         5800 | 5800K  |
|         6000 | 6000K  |
|         6200 | 6200K  |
|         6400 | 6400K  |
|         6600 | 6600K  |
|         6800 | 6800K  |
|         7000 | 7000K  |
|         7400 | 7400K  |
|         7800 | 7800K  |
|         8200 | 8200K  |
|         8600 | 8600K  |
|         9000 | 9000K  |
|         9400 | 9400K  |
|         9800 | 9800K  |
|        10000 | 10000K |
|        11000 | 11000K |
|        12000 | 12000K |
|        13000 | 13000K |
|        14000 | 14000K |

</div>

**Access Permission**
<div class="table-art-access">

|   Wi-Fi    | Bluetooth Smart |
|------------|-----------------|
| Read/Write | Read/Write      |

</div>

**Supported Shooting Mode**
<div class="table-art-conflict">

| iAuto | P  | A  | S  | M  | ART | movieP | movieA | movieS | movieM |
|-------|----|----|----|----|-----|--------|--------|--------|--------|
|       | OK | OK | OK | OK | 	  | OK     | OK     | OK     | OK     |

</div>

####White Balance Adjustment

**Overview**

+ Allow users to fine-tune white balance with reference to preset.
+ There are two adjustment parameters for each preset according to adjustment axes. WB adjustment A and WB adjustment G are for amber - blue axis and green - magenta axis, respectively. 
+ If WB adjustment A has positive value, white balance is adjusted with amber color. Otherwise, blue color.
+ If WB adjustment G has positive value, white balance is adjusted with green color. Otherwise, magenta color.

**Property Name**

+ Property name is string which combines property name prefix and suffix.
	+ Property name to adjust in amber - blue axis with reference to preset WB for tungsten: WB_REV_3000K
	+ Property name to adjust in green - magenta axis with reference to Auto WB: WB_REV_G_AUTO


Prefix	
<div class="table-artfilter-1">

| Property Name Prefix |         Adj.  Axis        |
|----------------------|---------------------------|
| WB_REV_              | WB Adj. A (Amber/Blue)    |
| WB_REV_G_            | WB Adj. G (Green/Magenta) |

</div>

Suffix
<div class="table-artfilter-1">

| Property Name Suffix |  WB Preset  |
|----------------------|-------------|
| 3000K                | Tungsten    |
| 4000K                | Fluorescent |
| 5300K                | Clear Day   |
| 6000K                | Cloudy Day  |
| 7500K                | Shadow      |
| AUTO                 | Auto        |
| AUTO_UNDER_WATER     | Underwater  |

</div>

**Property Value**

WB Adjustment A, WB Adjustment G (Common)

<div class="table-artfilter-1">

| Property Value | Description |
|--------------|------|
|           -7 |   -7 |
|           -6 |   -6 |
|           -5 |   -5 |
|           -4 |   -4 |
|           -3 |   -3 |
|           -2 |   -2 |
|           -1 |   -1 |
|            0 |    0 |
|           +1 |   +1 |
|           +2 |   +2 |
|           +3 |   +3 |
|           +4 |   +4 |
|           +5 |   +5 |
|           +6 |   +6 |
|           +7 |   +7 |

</div>

**Access Permission**
<div class="table-art-access">

|   Wi-Fi    | Bluetooth Smart |
|------------|-----------------|
| Read/Write | Read/Write      |

</div>

**Supported Shooting Mode**
<div class="table-art-conflict">

| iAuto | P  | A  | S  | M  | ART | movieP | movieA | movieS | movieM |
|-------|----|----|----|----|-----|--------|--------|--------|--------|
|       | OK | OK | OK | OK | 	  | OK     | OK     | OK     | OK     |

</div>

#### WB AUTO Keeping Warm Colors
**Name and Function**

<div class="table-artfilter-1">

|         Property Name          |                              Function                             |
|--------------------------------|-------------------------------------------------------------------|
| AUTO_WB_DENKYU_COLORED_LEAVING | Adjust white balance keeping warm colors. |


</div>

**Property Value**

<div class="table-artfilter-1">

| Property Value | Description |
|--------------|------|
| OFF          | OFF <br> Eliminate warm colors.   |
| ON           | ON   <br> Keep warm colors.|

</div>

**Access Permission**
<div class="table-art-access">

|   Wi-Fi    | Bluetooth Smart |
|------------|-----------------|
| Read/Write | Read/Write      |

</div>

**Supported Shooting Mode**
<div class="table-art-conflict">

| iAuto | P  | A  | S  | M  | ART | movieP | movieA | movieS | movieM |
|-------|----|----|----|----|-----|--------|--------|--------|--------|
|       | OK | OK | OK | OK | OK	| OK     | OK     | OK     | OK     |


</div>

