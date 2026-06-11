//
//  UNNotificationSound+DSL.m
//  JobsOCDSL
//
#import "UNNotificationSound+DSL.h"

@implementation UNNotificationSound (JobsChain)
+(JobsRetNotificationSoundByVoidBlock)byDefaultSound{
    return ^UNNotificationSound *_Nullable(void){
        return [self defaultSound];
    };
}

+(JobsRetNotificationSoundByStrBlock)bySoundNamed{
    return ^UNNotificationSound *_Nullable(NSString *_Nullable data){
        return data ? [self soundNamed:data] : nil;
    };
}

+(JobsRetNotificationSoundByCGFloatBlock)byDefaultCriticalSoundWithAudioVolume API_AVAILABLE(ios(12.0)){
    return ^UNNotificationSound *_Nullable(CGFloat data){
        if (@available(iOS 12.0, *)) return [self defaultCriticalSoundWithAudioVolume:data];
        return [self defaultSound];
    };
}

+(JobsRetNotificationSoundByStrBlock)byRingtoneSoundNamed API_AVAILABLE(ios(15.0)){
    return ^UNNotificationSound *_Nullable(NSString *_Nullable data){
        if (@available(iOS 15.0, *)) return data ? [self ringtoneSoundNamed:data] : nil;
        return data ? [self soundNamed:data] : nil;
    };
}

@end
