//
//  FSAppIconManager.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FSAppIconManager.h"

@implementation FSAppIconManager
+(JobsRetStrByVoidBlock _Nonnull)getCurrentAppIconName{
    return ^NSString *_Nullable{
        if (@available(iOS 10.3, *)) {
            return (UIApplication.sharedApplication.alternateIconName.length == 0) ? @"".jobsTr() : UIApplication. sharedApplication.alternateIconName;
        } else {
            // Fallback on earlier versions
            return @"".jobsTr();
        }
    };
}

+(JobsRetBOOLByVoidBlock _Nonnull)canChangeAppIcon{
    return ^BOOL{
        if (@available(iOS 10.3, *)) {
            return UIApplication.sharedApplication.supportsAlternateIcons;
        } else {
            // Fallback on earlier versions
            return NO;
        }
    };
}

+(void)changeAppIconWithIconName:(NSString *)iconName
               completionHandler:(void (^)(NSError * _Nullable))completionHandler {
    if (@available(iOS 10.3, *)) {
        [UIApplication.sharedApplication setAlternateIconName:iconName
                                            completionHandler:^(NSError * _Nullable error) {
            completionHandler(error);
        }];
    } else {
        // Fallback on earlier versions
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"AppIcon change failed", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The current system version does not support replacing the AppIcon.", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"".jobsTr(), nil)
                                   };
        NSError *error = [NSError errorWithDomain:@"".jobsTr()
                                             code:34001
                                         userInfo:userInfo];
        completionHandler(error);
    }
}

@end
