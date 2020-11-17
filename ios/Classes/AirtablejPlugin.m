#import "AirtablejPlugin.h"
#if __has_include(<airtablej/airtablej-Swift.h>)
#import <airtablej/airtablej-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "airtablej-Swift.h"
#endif

@implementation AirtablejPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAirtablejPlugin registerWithRegistrar:registrar];
}
@end
