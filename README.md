# MagmaAPI
Developer API for Magma Evo


This API was made for Tweak Developers who want to make use of Magma Evo's colors and other methods. The API is easy to use and basically plug and play.

# How to use MagmaAPI in your tweak?

Add the header to your tweak project: https://github.com/Tr1Fecta-7/MagmaAPI/blob/master/MagmaAPI.h


Get the MagmaAPI sharedInstance and values you need at runtime (Examples):

```objc

// Example 1
UIColor *disabledWifiColor = [[%c(MagmaAPI) sharedInstance] connectivityColorForNameOrIdentifier:@"WiFi" enabledState:NO];

// Example 2
UIColor *enabledBluetoothColor = [[objc_getClass("MagmaAPI") sharedInstance] connectivityColorForNameOrIdentifier:@"Bluetooth" enabledState:YES];

// Example 3
UIColor *enabledFlashlightColor = [[NSClassFromString(@"MagmaAPI") sharedInstance] controlCenterModuleColorForNameOrIdentifier:@"Flashlight" enabledState:YES];

// Example 4
BOOL sliderContainerHidden = [[%c(MagmaAPI) sharedInstance] slidersHideContainer];
```


Alternatively you can also provide a module identifier for missing or custom modules
```objc

UIColor *enabledBackgrounderActionColor = [[%c(MagmaAPI) sharedInstance] controlCenterModuleColorForNameOrIdentifier:@"jp.akusio.backgrounderaction13" enabledState:YES];

UIColor *normalLockButtonColor = [[%c(MagmaAPI) sharedInstance] controlCenterModuleColorForNameOrIdentifier:@"com.jailbreak365.control-center.LockButton" enabledState:NO];

```

# List of default Connectivity and Module Names and Identifiers

```objc

// These are the names and identifiers for the default connectivity toggles

@"Airdrop": @"CCUIConnectivityAirDropViewController",
@"Airplane": @"CCUIConnectivityAirplaneViewController",
@"Bluetooth": @"CCUIConnectivityBluetoothViewController",
@"Cellular": @"CCUIConnectivityCellularDataViewController",
@"Hotspot": @"CCUIConnectivityHotspotViewController",
@"WiFi": @"CCUIConnectivityWifiViewController"

```

```objc
// These are the names and identifiers for the default module toggles

@"Appearance": @"com.apple.control-center.AppearanceModule",
@"Calculator": @"com.apple.control-center.CalculatorModule",
@"Camera": @"com.apple.control-center.CameraModule",
@"Flashlight": @"com.apple.control-center.FlashlightModule",
@"LowPowerMode": @"com.apple.control-center.LowPowerModule",
@"OrientationLock": @"com.apple.control-center.OrientationLockModule",
@"Timer": @"com.apple.mobiletimer.controlcenter.timer",
@"ScreenRecord": @"com.apple.replaykit.controlcenter.screencapture",
@"DoNotDisturb": @"com.apple.donotdisturb.DoNotDisturbModule",

@"TapToRadar": @"com.apple.control-center.TapToRadarModule",
@"Carry": @"com.apple.control-center.CarryModule",
@"TextSize": @"com.apple.accessibility.controlcenter.text.size",
@"Home": @"com.apple.Home.ControlCenter",
@"Magnifier": @"com.apple.control-center.MagnifierModule",
@"QRCode": @"com.apple.control-center.QRCodeModule",

@"QuickNote": @"com.apple.control-center.QuickNoteModule",
@"CarMode": @"com.apple.control-center.CarModeModule",
@"PerformanceTrace": @"com.apple.control-center.PerformanceTraceModule",
@"VoiceMemos": @"com.apple.control-center.VoiceMemosModule",
@"SpokenNotifications": @"com.apple.siri.SpokenNotificationsModule",
@"Wallet": @"com.apple.control-center.WalletModule",
@"HearingDevices": @"com.apple.accessibility.controlcenter.hearingdevices",
@"FeedbackAssistantModule": @"com.apple.control-center.FeedbackAssistantModule",
@"AirplayMirroring": @"com.apple.mediaremote.controlcenter.airplaymirroring",
@"Audio": @"com.apple.mediaremote.controlcenter.audio",

@"Alarm": @"com.apple.control-center.AlarmModule",
@"AppleTVRemote": @"com.apple.control-center.AppleTVRemoteModule",
@"Display": @"com.apple.control-center.DisplayModule",
@"General": @"com.apple.accessibility.controlcenter.general",
@"GuidedAccess": @"com.apple.accessibility.controlcenter.guidedaccess",
@"Stopwatch": @"com.apple.control-center.stopwatch",
@"Mute": @"com.apple.control-center.MuteModule"
```
