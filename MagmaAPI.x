#import "MagmaAPI.h"


@implementation MagmaAPI

+ (instancetype)sharedInstance {
    static MagmaAPI *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if ((self = [super init])) {
        self.moduleNames = @{
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
        };

        self.connectivityNames = @{
            @"Airdrop": @"CCUIConnectivityAirDropViewController",
            @"Airplane": @"CCUIConnectivityAirplaneViewController",
            @"Bluetooth": @"CCUIConnectivityBluetoothViewController",
            @"Cellular": @"CCUIConnectivityCellularDataViewController",
            @"Hotspot": @"CCUIConnectivityHotspotViewController",
            @"Wifi": @"CCUIConnectivityWifiViewController"
        };
    }
    return self;
}

#pragma mark Connectivity

- (UIColor *)connectivityColorForNameOrIdentifier:(NSString *)name enabledState:(BOOL)enabled {
    NSString *connectivityName = [self.connectivityNames objectForKey:name];
    UIColor *connectivityColor;
    if (connectivityName) {
        if (enabled) {
            connectivityColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Enabled", connectivityName]]];
        } else {
            connectivityColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Disabled", connectivityName]]];
        }
    } else {
        if (enabled) {
            connectivityColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Enabled", name]]];
        } else {
            connectivityColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Disabled", name]]];
        }
    }

    return connectivityColor;
}



- (UIColor *)connectivityContainerBackgroundColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"connectivityContainerBackground"]];
}

- (UIColor *)connectivityGlobalColorWithState:(BOOL)enabled {
    return enabled ? [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"connectivityGlobalColorEnabled"]] : [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"connectivityGlobalColorDisabled"]];
}


- (BOOL)connectivityHideContainer {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"connectivityHideContainer"];
}

- (BOOL)regularConnectivityMode {
    NSString *connectivityMode = [[%c(MagmaPrefs) sharedInstance] valueForKey:@"connectivityModeEnabled"];
    return [connectivityMode isEqualToString:@"regular"] ? YES : NO;
}

- (BOOL)glyphOnlyConnectivityMode {
    NSString *connectivityMode = [[%c(MagmaPrefs) sharedInstance] valueForKey:@"connectivityModeEnabled"];
    return [connectivityMode isEqualToString:@"glyphOnly"] ? YES : NO;
}

- (NSString *)connectivityClassNameForPosition:(int)position {
    return [[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"connectivityPosition%d", position]];
}

#pragma mark Media Controls

- (UIColor *)mediaControlsColorForName:(NSString *)name {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"mediaControls%@", name]]];
}

- (UIColor *)mediaControlsContainerBackgroundColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"mediaControlsContainerBackgroundColor"]];
}

- (BOOL)mediaControlsColorLockscreen {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"mediaControlsColorLockscreen"];
}

- (BOOL)mediaControlsHideContainer {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"mediaControlsHideContainer"];
}

#pragma mark Miscellaneous

- (UIColor *)miscMainBackgroundColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"miscMainBackground"]];
}

- (UIColor *)miscStatusBarColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"miscStatusBarColor"]];
}

- (NSString *)miscMainAlignment {
    return [[%c(MagmaPrefs) sharedInstance] valueForKey:@"miscMainAlignment"];
}

- (BOOL)miscStatusBarHide {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"miscStatusBarHide"];
}

- (BOOL)powerModuleHideBackground {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"powerModuleHideBackground"];
}

- (BOOL)powerModuleHideContainer {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"powerModuleHideContainer"];
}

- (BOOL)prysmWeatherHideContainer {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"prysmWeatherHideContainer"];
}

#pragma mark Sliders

- (UIColor *)slidersBrightnessBackgroundColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"slidersBrightnessBackgroundColor"]];
}

- (UIColor *)slidersBrightnessGlyphColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"slidersBrightnessGlyph"]];
}

- (UIColor *)slidersContainerBackgroundColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"slidersContainerBackground"]];
}

- (BOOL)slidersHideContainer {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"slidersHideContainer"];
}

- (UIColor *)slidersVolumeBackgroundColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"slidersVolumeBackground"]];
}

- (UIColor *)slidersVolumeGlyphColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"slidersVolumeGlyph"]];
}

- (BOOL)slidersVolumeSystem {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"slidersVolumeSystem"];
}

#pragma mark Toggles/Modules

- (UIColor *)controlCenterModuleColorForNameOrIdentifier:(NSString *)name enabledState:(BOOL)enabled {
    NSString *moduleName = [self.moduleNames objectForKey:name];
    UIColor *moduleColor;

    if (moduleName) {
        if (enabled) {
            moduleColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Enabled", moduleName]]];
        } else {
            moduleColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Disabled", moduleName]]];
        }
    } else {
        if (enabled) {
            moduleColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Enabled", name]]];
        } else {
            moduleColor = [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:[NSString stringWithFormat:@"%@Disabled", name]]];
        }
    }

    return moduleColor;
}


- (UIColor *)togglesContainerBackgroundColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"togglesContainerBackground"]];
}

- (UIColor *)togglesGlobalPickerColor {
    return [UIColor evoRGBAColorFromHexString:[[%c(MagmaPrefs) sharedInstance] valueForKey:@"togglesGlobalPicker"]];
}

- (BOOL)togglesHideContainer {
    return [[%c(MagmaPrefs) sharedInstance] boolForKey:@"togglesHideContainer"];
}

- (BOOL)togglesRegularOverlayMode {
    NSString *overlayMode = [[%c(MagmaPrefs) sharedInstance] valueForKey:@"togglesOverlayMode"];
    return [overlayMode isEqualToString:@"regular"] ? YES : NO;
}

- (BOOL)togglesRemoveOverlayMode {
    NSString *overlayMode = [[%c(MagmaPrefs) sharedInstance] valueForKey:@"togglesOverlayMode"];
    return [overlayMode isEqualToString:@"removeOverlay"] ? YES : NO;
}

- (BOOL)togglesColorOverlayMode {
    NSString *overlayMode = [[%c(MagmaPrefs) sharedInstance] valueForKey:@"togglesOverlayMode"];
    return [overlayMode isEqualToString:@"colorOverlay"] ? YES : NO;
}


@end