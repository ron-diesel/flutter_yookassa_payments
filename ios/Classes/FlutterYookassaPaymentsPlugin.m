#import "FlutterYookassaPaymentsPlugin.h"
#if __has_include(<flutter_yookassa_payments/flutter_yookassa_payments-Swift.h>)
#import <flutter_yookassa_payments/flutter_yookassa_payments-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_yookassa_payments-Swift.h"
#endif

@implementation FlutterYookassaPaymentsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterYookassaPaymentsPlugin registerWithRegistrar:registrar];
}
@end
