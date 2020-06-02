#import "WordpressSuitePlugin.h"
#if __has_include(<wordpress_suite/wordpress_suite-Swift.h>)
#import <wordpress_suite/wordpress_suite-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "wordpress_suite-Swift.h"
#endif

@implementation WordpressSuitePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWordpressSuitePlugin registerWithRegistrar:registrar];
}
@end
