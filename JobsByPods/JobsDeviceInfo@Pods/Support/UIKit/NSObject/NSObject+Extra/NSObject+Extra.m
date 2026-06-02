//
//  NSObject+Extra.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)
/// NSBundle
+(NSBundle *_Nullable)mainBundle{
    return NSBundle.mainBundle;
}
/// NSLocale
+(NSLocale *_Nullable)currentLocale{
    return NSLocale.currentLocale;
}
/// UIDevice
+(UIDevice *_Nullable)currentDevice{
    return UIDevice.currentDevice;
}

@end
