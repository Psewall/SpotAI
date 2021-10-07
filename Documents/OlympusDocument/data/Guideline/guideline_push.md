# Guidelines for Handling Event Notifications

The camera sends a notification to application when processing status or camera status changes. This change is called an "event". Events are asynchronous notifications, which means events occur regardless of application status. Application can continue processing while waiting for a notification. Application does not need to handle all event notifications from the camera. However, proper event handling creates better user experiences for your application.

There are two cases where the camera issues an event.

1. Change in status of camera itself regardless of API method called by user
1. Change in progress of processing according to API method called by user


## １．Event of status of camera itself
The camera notifies the change of status of itself regardless of API method called by user.

#### Category 1

+  Generated captured image or preview image
+  Stopped driving zoom lens
+  Disconnected network
+  Updated live view image
+  Updated result of focusing
+  Stopped recording movie due to the camera, e.g., media has no capacity to record.

#### Category 2

+ Updated camera property

####  Category 3

+ Status of media was changed, e.g., remaining media capacity, mount status, and access status.
+ Status of lens was changed, e.g., focal length.
+ Updated shooting parameter
+ Detected face
+ Updated status of level gauge
+ Reached high temperature
+ Entered extended ISO range
+ Could not decide exposure parameter corresponding to exposure value
+ Subject was too bright or too dark to measure

### iOS
#### Category １

+ Implement a protocol corresponding to an event you would like to receive, and the following delegate method notifies the event.
+ See API reference for more details.

<div class="table-desc-3">

|              Protocol              |                  Delegate Method                  |                   Event                   |
|------------------------------------|---------------------------------------------------|-------------------------------------------|
| OLYCameraRecordingSupportsDelegate | camera:didReceiveCapturedImage(Preview):metadata: | Generated captured image or preview image |
| OLYCameraRecordingSupportsDelegate | cameraDidStopDrivingZoomLens:                     | Stopped driving zoom lens                 |
| OLYCameraConnectionDelegate        | camera:disconnectedByError:                       | Disconnected network                      |
| OLYCameraLiveViewDelegate          | camera:didUpdateLiveView:                         | Updated live view image                   |
| OLYCameraRecordingDelegate         | camera:didChangeAutoFocusResult:                  | Updated result of focusing                |
| OLYCameraRecordingDelegate         | cameraDidStopRecordingVideo:                      | Stopped recording movie due to the camera |

</div>

#### Category ２
+ Implement OLYCameraPropertyDelegate protocol to monitor change of camera property, and the following delegate method notifies updated property.
+ See API reference for more details.

<div class="table-desc-3">

|          Protocol         |         Delegate Method         |          Event          |
|---------------------------|---------------------------------|-------------------------|
| OLYCameraPropertyDelegate | camera:didChangeCameraProperty: | Updated camera property |

</div>

+ Note that the camera does not notify of all changes to camera properties. 
+ Event is notified when camera property itself is updated or when the range of property values changes.
+ The table below shows major properties to be notified upon update or notification timing.

<div class="table-desc-2">

|     Camera Property      |                                           Notification Timing                                           |
|--------------------------|---------------------------------------------------------------------------------------------------------|
| BATTERY_LEVEL            | Battery power fell below a threshold.                                                                 |
| SHUTTER                  | Range of property value was changed. Upper limit of shutter speed changes according to ISO sensitivity. |
| APERTURE                 | Range of property value was changed. Maximum aperture value changes according to zoom factor.           |
| EXPREV                   | Range of property value was changed. +-5EV for still images, +-3EV for movies.                          |
| AF_LOCK_STATE            | Auto focus lock was released.                                                                           |
| AE_LOCK_STATE            | Auto exposure lock was released.                                                                        |
| FOCUS_STILL, FOCUS_MOVIE | Focus mode was changed by sliding focus ring of lens that supports snapshot focus.                      |

</div>

#### Category ３
+ SDK provides no interface to notify events in this category directly. 
+ Instead SDK has Objective-C property to retain information on camera status. Application can detect event using Key-Value Observing to monitor corresponding Objective-C property.
+ The table below shows Objective-C property corresponding to the event in this category.

<div class="table-desc-3">

|     Objective−C Property    | Category of OLYCamera Class |                                              Notification Timing                                              |
|-----------------------------|-----------------------------|---------------------------------------------------------------------------------------------------------------|
| mediaMountStatus            | CameraSystem                | Status of media was changed                                                                                   |
| mediaBusy                   | CameraSystem                |                                                                                                               |
| mediaError                  | CameraSystem                |                                                                                                               |
| remainingImageCapacity      | CameraSystem                |                                                                                                               |
| remainingVideoCapacity      | CameraSystem                |                                                                                                               |
| lensMountStatus             | CameraSystem                | Status of lens was changed                                                                                    |
| actualFocalLength           | Recording                   |                                                                                                               |
| minimumFocalLength          | Recording                   |                                                                                                               |
| maximumFocalLength          | Recording                   |                                                                                                               |
| actualAutoFocusPoint        | Recording                   | Updated shooting parameter                                                                                    |
| actualApertureValue         | Recording                   |                                                                                                               |
| actualShutterSpeed          | Recording                   |                                                                                                               |
| actualExposureCompensation  | Recording                   |                                                                                                               |
| actualIsoSensitivity        | Recording                   |                                                                                                               |
| detectedHumanFaces          | RecordingSupports           | Detected face                                                                                                 |
| digitalSpiritLevel          | RecordingSupports           | Updated status of level gauge                                                                                 |
| highTemperatureWarning      | CameraSystem                | Reached high temperature                                                                                      |
| actualIsoSensitivityWarning | Recording                   | Entered extended ISO range. Image taken in the extended ISO range may not meet a certain standard of quality. |
| exposureWarning             | Recording                   | Could not decide exposure parameter corresponding to exposure value                                           |
| exposureMeteringWarning     | Recording                   | Subject was too bright or too dark to measure                                                                  |

</div>

---
NOTE）Objective-C property is totally different from camera property to configure camera settings.

### Android

#### Category １
+ Implement listener interface corresponding to an event you would like to receive, and the following event handler method notifies the event.
+ See API reference for more details.

<div class="table-desc-3">

|          Listener Interface         |          Handler Method         |                    Event                    |
|-------------------------------------|---------------------------------|---------------------------------------------|
| OLYCamera.RecordingSupportsListener | onReceiveCapturedImage(Preview) | Generated captured image or a preview image |
| OLYCamera.RecordingSupportsListener | onStopDrivingZoomLens           | Stopped driving zoom lens                   |
| OLYCamera.ConnectionListener        | onDisconnectedByError           | Disconnected network                        |
| OLYCamera.LiveViewListener          | onUpdateLiveImage               | Updated live view image                     |
| OLYCamera.RecordingListener         | onChangeAutoFocusResult         | Updated result of focusing                  |
| OLYCamera.RecordingListener         | onStopRecordingVideo            | Stopped recording movie due to the camera   |

</div>

#### Category 2

+ Implement OLYCameraPropertyListener interface to monitor change to camera property, and the following event handler method notifies updated property.
+ See API reference for more details.

<div class="table-desc-3">

|     Listener Interface    |     Handler Method     |          Event          |
|---------------------------|------------------------|-------------------------|
| OLYCameraPropertyListener | onUpdateCameraProperty | Updated camera property |

</div>

+ Note that the camera does not notify of all changes to camera properties. 
+ Event is notified when camera property itself is updated or when the range of property values changes.
+ The table below shows major properties to be notified upon update or notification timing.

<div class="table-desc-2">

|                      Camera Property                       |                                               Notification Timing                                               |
|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| CAMERA_PROPERTY_BATTERY_LEVEL                              | Battery power fell below a threshold.                                                                          |
| CAMERA_PROPERTY_SHUTTER                                    | Range of property value changed. Upper limit of shutter speed changes according to ISO sensitivity. |
| CAMERA_PROPERTY_APERTURE                                   | Range of property value changed. Maximum aperture value changes according to zoom factor.                 |
| CAMERA_PROPERTY_EXPREV                                     | Range of property value changed. +-5EV for still images, +-3EV for movies.                                    |
| CAMERA_PROPERTY_AF_LOCK_STATE                              | Auto focus lock was released.                                                                                    |
| CAMERA_PROPERTY_AE_LOCK_STATE                              | Auto exposure lock was released.                                                                                 |
| CAMERA_PROPERTY_FOCUS_STILL<br>CAMERA_PROPERTY_FOCUS_MOVIE | Focus mode was changed by sliding focus ring of lens which supports snapshot focus.                           |

</div>

#### Category ３

+ Implement OLYCameraStatusListener interface to monitor changes to camera status in this category, and the following event handler method notifies updated status.
+ See API reference for more details.

<div class="table-desc-3">

|    Listener Interface   | Handler Method |         Event         |
|-------------------------|----------------|-----------------------|
| OLYCameraStatusListener | onUpdateStatus | Updated camera status |

</div>

+ The table below shows the name of camera status corresponding to notified event and methods to acquire camera status.

<div class="table-desc-3">

| Camera Status to be notified | Get Method in OLYCamera Class |                                              Notification Timing                                              |
|------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------|
| MediaMountStatus             | getMediaMountStatus           | Status of media was changed                                                                                   |
| MediaBusy                    | isMediaBusy                   |                                                                                                               |
| MediaError                   | isMediaError                  |                                                                                                               |
| RemainingImageCapacity       | getRemainingImageCapacity     |                                                                                                               |
| RemainingVideoCapacity       | getRemainingVideoCapacity     |                                                                                                               |
| LensMountStatus              | getLensMountStatus            | Status of lens was changed                                                                                    |
| ActualFocalLength            | getActualFocalLength          |                                                                                                               |
| MinimumFocalLength           | getMinimumFocalLength         |                                                                                                               |
| MaximumFocalLength           | getMaximumFocalLength         |                                                                                                               |
| ActualAutoFocusPoint         | getActualAutoFocusPoint       | Updated shooting parameter                                                                                    |
| ActualApertureValue          | getActualApertureValue        |                                                                                                               |
| ActualShutterSpeed           | getActualShutterSpeed         |                                                                                                               |
| ActualExposureCompensation   | getActualExposureCompensation |                                                                                                               |
| ActualIsoSensitivity         | getActualIsoSensitivity       |                                                                                                               |
| DetectedHumanFaces           | getDetectedHumanFaces         | Detected face                                                                                                 |
| LevelGauge                   | getLevelGauge                 | Updated status of level gauge                                                                                 |
| HighTemperatureWarning       | isHighTemperatureWarning      | Reached high temperature                                                                                      |
| ActualIsoSensitivityWarning  | isActualIsoSensitivityWarning | Entered extended ISO range. Image taken in the extended ISO range may not meet a certain standard of quality. |
| ExposureWarning              | isExposureWarning             | Could not decide exposure parameter corresponding to exposure value                                           |
| ExposureMeteringWarning      | isExposureMeteringWarning     | Subject was too bright or too dark to measure                                                                 |

</div>

## ２．Event of progress of processing
+ There are some cases where the camera notifies application of an event according to the status and progress of processing.
+ Following three kinds of event handlers are called according to event.
+ Each method handles 0-3 events according to its function.

<div class="table-desc-4">

|          Event          |        iOS        |     Android     |                                     Notification Timing                                     |
|-------------------------|-------------------|-----------------|---------------------------------------------------------------------------------------------|
| Progress Notification   | progressHandler   | onProgress      | Called once or multiple times according to the progress of processing.                      |
| Completion Notification | completionHandler | onCompleted     | Called when process is finished. Result of processing generally is provided simultaneously. |
| Error Notification      | errorHandler      | onErrorOccurred | Called only when error occurs.                                                              |

</div>

### Handler for Progress Notification

+ Called once or multiple times according to the progress of processing.

#### Example: Taking Picture
+ Method to take picture handles the following progress notification
	+ iOS: takePicture:progressHandler:completionHandler:errorHandler:
	+ Android:  takePicuture(HashMap< String, Object >, OnTakePictureListener)

<div class="table-desc-1">

|                                                           Progress Notification                                                            |     iOS (enum OLYCameraTakingProgress)     | Android (enum TakingProgress) |
|--------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|-------------------------------|
| Start Auto Focusing                                                                                                                        | OLYCameraTakingProgressBeginFocusing       | BeginFocusing                 |
| Finish Auto Focusing                                                                                                                       | OLYCameraTakingProgressEndFocusing         | EndFocusing                   |
| Ready to Capture                                                                                                                           | OLYCameraTakingProgressReadyCapturing      | ReadyCapturing                |
| Start Capturing<br> Streaming live view pauses immediately after this event occurs. Event to notify pausing live view is not delivered.    | OLYCameraTakingProgressBeginCapturing      | BeginCapturing                |
| Finish Capturing<br> Streaming live view resumes immediately after this event occurs. Event to notify resuming live view is not delivered. | OLYCameraTakingProgressEndCapturing        | EndCapturing                  |
| Finish Taking Picture                                                                                                                      | OLYCameraTakingProgressFinished            | Finished                      |

</div>


#### Example of User Interface according to Progress Notification

Here is an example of user interface for your application when receiving progress notification.

<div class="table-desc-2">

| Progress Notification |                                                                                                                                   User Interface Example                                                                                                                                  |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Start Auto Focusing   | Do nothing.  If AF frame is set for touch AF etc., keep AF frame displayed in the same position.                                                                                                                                                                                          |
| Finish Auto Focusing  | Draw AF frame at the focusing point. If focusing succeeded, frame color should change to green. Otherwise, red.  Play sound effect according to the result of focusing.                                                                                                                   |
| Ready to Capture      | Do nothing.                                                                                                                                                                                                                                                                               |
| Start Capturing       | Play sound effect of shutter. Disable shutter operation, and change display to inform disabled status. Overlay translucent colored layer over live view image for example. Then display information to notify taking picture is in progress. Show animated icon or indicator for example. |
| Finish Taking Picture | Do nothing. Next operation is enabled.                                                                                                                                                                                                                                                    |

</div>

### Handler for Completion Notification

Called when process is finished. Result of processing generally is provided simultaneously. See API reference for more details.

### Handler for Error Notification

Called only when error occurs. The following are major cases where error notification is handled.

+ Network is disconnected.
+ Specified mode is invalid.
+ Specified parameter is invalid.
+ Received a control command when the same command is being executed.
+ Processing failed, e.g., event to be notified cannot be received.

