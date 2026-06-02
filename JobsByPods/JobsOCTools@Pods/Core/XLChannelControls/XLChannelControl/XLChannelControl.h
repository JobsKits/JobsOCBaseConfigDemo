//
//  XLChannelControl.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLCHANNELCONTROL_32ABD92E58
#define JOBS_HEADER_GUARD_XLCHANNELCONTROL_32ABD92E58

#import <Foundation/Foundation.h>

typedef void(^XLChannelBlock)(NSArray *enabledTitles,NSArray *disabledTitles);

@interface XLChannelControl : NSObject

+ (XLChannelControl *)shareControl;

- (void)showChannelViewWithEnabledTitles:(NSArray*)enabledTitles disabledTitles:(NSArray*)disabledTitles finish:(XLChannelBlock)block;

@end
#endif /* JOBS_HEADER_GUARD_XLCHANNELCONTROL_32ABD92E58 */
