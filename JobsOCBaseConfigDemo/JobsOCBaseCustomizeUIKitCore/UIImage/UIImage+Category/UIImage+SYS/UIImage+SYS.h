//
//  UIImage+SYS.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_SYS_C230671663
#define JOBS_HEADER_GUARD_UIIMAGE_SYS_C230671663

#import <objc/message.h>
#import <UIKit/UIKit.h>
#import "JobsString.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SYS)
/*
    这里MKImageNamed方法中不能调用imageNamed方法,
    因为imageNamed实质已经是MKImageNamed方法了,
    会出项死循环,
    调用其自己的时候,
    实质是调用imageNamed方法,
    imageNamed中没有代用MKImageNamed,
    这样就不会出现死循环;
*/
+(JobsRetImageByStrBlock _Nonnull)imageByName;
/// 替换系统的 imageWithData 方法
+(JobsRetImageByDataBlock _Nonnull)imageByData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGE_SYS_C230671663 */
