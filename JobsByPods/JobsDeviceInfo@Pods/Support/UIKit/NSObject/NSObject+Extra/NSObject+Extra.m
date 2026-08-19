//
//  NSObject+Extra.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)
/// NSBundle
+(NSBundle *)mainBundle{
    return (((JobsRetNSBundleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsMainBundle)))(self, @selector(jobsMainBundle)))();
}

+(JobsRetNSBundleByVoidBlock _Nonnull)jobsMainBundle{
    return ^NSBundle *_Nullable{
        return NSBundle.mainBundle;
    };
}
/// NSLocale
+(NSLocale *)currentLocale{
    return (((JobsRetNSLocaleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsCurrentLocale)))(self, @selector(jobsCurrentLocale)))();
}

+(JobsRetNSLocaleByVoidBlock _Nonnull)jobsCurrentLocale{
    return ^NSLocale *_Nullable{
        return NSLocale.currentLocale;
    };
}
/// UIDevice
+(UIDevice *)currentDevice{
    return (((JobsRetUIDeviceByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsCurrentDevice)))(self, @selector(jobsCurrentDevice)))();
}

+(JobsRetUIDeviceByVoidBlock _Nonnull)jobsCurrentDevice{
    return ^UIDevice *_Nullable{
        return UIDevice.currentDevice;
    };
}

@end
