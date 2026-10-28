//
//  JobsDeviceDescription.h
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <UIKit/UIKit.h>
#import "JobsDeviceInfoItem.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsDeviceInfo/JobsDeviceInfo.h>)
#import <JobsDeviceInfo/JobsDeviceInfo.h>
#else
#import "JobsDeviceInfo.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 只读取公开设备信息；受限的硬件标识保留明确说明，不以 IDFV 冒充 UDID。
@interface JobsDeviceDescription : NSObject

+(JobsRetArrByVoidBlock _Nonnull)currentItems;

@end

NS_ASSUME_NONNULL_END
