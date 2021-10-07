####Art Filters

**Name and Function**

<div class="table-artfilter-1">

|     Property Name    |                                                                                                                                                                                         Function                                                                                                                                                                                         |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| RECENTLY_ART_FILTER | <ul><li>Art Filter Type. Art filters allow you to control various creative effects, transforming your photography into works of art. They are built right into the camera. </li><li>This property is valid when TAKEMODE property is set to ART.</li><li>Set ART_BKT to enable art filter bracketing</li><li>Explanation and sample image of each art filter are shown in art filter variation section.</li></ul> |

</div>



**Property Value**

<div class="table-artfilter-1">

|   Property Value   |           Description           |
|------------------|--------------------------|
| POPART           | Pop Art             |
| FANTASIC_FOCUS   | Soft Focus |
| DAYDREAM         | Pale & Light Color             |
| LIGHT_TONE       | Light Tone           |
| ROUGH_MONOCHROME | Grainy Film         |
| TOY_PHOTO        | Pin Hole            |
| MINIATURE        | Diorama                 |
| CROSS_PROCESS    | Cross Process           |
| GENTLE_SEPIA     | Gentle Sepia         |
| DRAMATIC_TONE    | Dramatic Tone       |
| LIGNE_CLAIR      | Key Line       |
| PASTEL           | Watercolor        |
| VINTAGE          | Vintage             |
| PARTCOLOR        | Partial Color             |

</div>

**Access Permission**
<div class="table-art-access">

|   Wi-Fi    | Bluetooth Smart |
|------------|-----------------|
| Read/Write | Read/Write      |

</div>

**Supported Shooting Mode**
<div class="table-art-conflict">

| iAuto | P | A | S | M | ART | movieP | movieA | movieS | movieM |
|-------|---|---|---|---|-----|--------|--------|--------|--------|
|       |   |   |   |   | OK  |        |        |        |        |

</div>

####Part Color Hue

**Name and Function**

<div class="table-artfilter-1">

|     Property Name    |                                                                                                                                                                                         Function                                                                                                                                                                                                                                |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| COLOR_PHASE  | Hue for partial color<br>Partial color, which is one of the art filters, makes a picture grayscale except area(s) similar to the color configured by this property. Partial color also works as a picture mode. This property is valid when TAKEMODE property is set to ART, and RECENTLY_ART_FILTER property is set to PARTCOLOR. Another case is when COLORTONE property is set to PARTCOLOR. |

</div>

**Property Value**

<div class="table-artfilter-2">

|   Property Value   |           Description       |               Color Sample                |
|--------------|----------------|-------------------------------------|
|            0 | Hue Pattern 0  | <img src="../img/partcolor/1.png">  |
|            1 | Hue Pattern 1  | <img src="../img/partcolor/2.png">  |
|            2 | Hue Pattern 2  | <img src="../img/partcolor/3.png">  |
|            3 | Hue Pattern 3  | <img src="../img/partcolor/4.png">  |
|            4 | Hue Pattern 4  | <img src="../img/partcolor/5.png">  |
|            5 | Hue Pattern 5  | <img src="../img/partcolor/6.png">  |
|            6 | Hue Pattern 6  | <img src="../img/partcolor/7.png">  |
|            7 | Hue Pattern 7  | <img src="../img/partcolor/8.png">  |
|            8 | Hue Pattern 8  | <img src="../img/partcolor/9.png">  |
|            9 | Hue Pattern 9  | <img src="../img/partcolor/10.png"> |
|           10 | Hue Pattern 10 | <img src="../img/partcolor/11.png"> |
|           11 | Hue Pattern 11 | <img src="../img/partcolor/12.png"> |
|           12 | Hue Pattern 12 | <img src="../img/partcolor/13.png"> |
|           13 | Hue Pattern 13 | <img src="../img/partcolor/14.png"> |
|           14 | Hue Pattern 14 | <img src="../img/partcolor/15.png"> |
|           15 | Hue Pattern 15 | <img src="../img/partcolor/16.png"> |
|           16 | Hue Pattern 16 | <img src="../img/partcolor/17.png"> |
|           17 | Hue Pattern 17 | <img src="../img/partcolor/18.png"> |

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
|       | OK | OK | OK | OK | OK  | OK     | OK     | OK     | OK     |

</div>