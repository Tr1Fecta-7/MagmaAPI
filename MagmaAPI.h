#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MagmaAPI : NSObject

@property (nonatomic, strong) NSDictionary *connectivityNames;
@property (nonatomic, strong) NSDictionary *moduleNames;

+ (instancetype)sharedInstance;
- (instancetype)init;

// Connectivity
- (UIColor *)connectivityColorForNameOrIdentifier:(NSString *)name enabledState:(BOOL)enabled;
- (UIColor *)connectivityContainerBackgroundColor;
- (UIColor *)connectivityGlobalColorWithState:(BOOL)enabled;
- (BOOL)connectivityHideContainer;
- (BOOL)regularConnectivityMode;
- (BOOL)glyphOnlyConnectivityMode;
- (NSString *)connectivityClassNameForPosition:(int)position;

// MediaControls
- (UIColor *)mediaControlsColorForName:(NSString *)name;
- (UIColor *)mediaControlsContainerBackgroundColor;
- (BOOL)mediaControlsColorLockscreen;
- (BOOL)mediaControlsHideContainer;

// Misc
- (UIColor *)miscMainBackgroundColor;
- (UIColor *)miscStatusBarColor;
- (NSString *)miscMainAlignment;
- (BOOL)miscStatusBarHide;
- (BOOL)powerModuleHideBackground;
- (BOOL)powerModuleHideContainer;
- (BOOL)prysmWeatherHideContainer;

// Sliders
- (UIColor *)slidersBrightnessBackgroundColor;
- (UIColor *)slidersBrightnessGlyphColor;

- (UIColor *)slidersContainerBackgroundColor;
- (BOOL)slidersHideContainer;

- (UIColor *)slidersVolumeBackgroundColor;
- (UIColor *)slidersVolumeGlyphColor;
- (BOOL)slidersVolumeSystem;

// Toggles / Modules
- (UIColor *)controlCenterModuleColorForNameOrIdentifier:(NSString *)name enabledState:(BOOL)enabled;
- (UIColor *)togglesContainerBackgroundColor;
- (UIColor *)togglesGlobalPickerColor;
- (BOOL)togglesHideContainer;
- (BOOL)togglesRegularOverlayMode;
- (BOOL)togglesRemoveOverlayMode;
- (BOOL)togglesColorOverlayMode;


@end


@interface UIColor (Magma)
+ (UIColor *)evoRGBAColorFromHexString:(NSString *)string;
@end


@interface MagmaPrefs : NSObject
+ (id)sharedInstance;
-(BOOL)boolForKey:(NSString *)key;
-(NSString *)valueForKey:(NSString *)key;
@end