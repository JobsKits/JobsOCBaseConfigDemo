//
//  UIBackgroundConfiguration+Extra.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIBackgroundConfiguration+Extra.h"

@implementation UIBackgroundConfiguration (Extra)
#if defined(__IPHONE_18_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_18_0)
- (JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byShadowOpacity
    API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(CGFloat opacity) {
        @jobs_strongify(self)
        if (@available(iOS 18.0, *)) {
            self.shadowProperties.opacity = opacity;
        };return self;
    };
}
#endif

@end
