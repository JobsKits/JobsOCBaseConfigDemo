//
//  XLChannelControl.h
//  JobsOCBaseConfigDemo
//
//  Created by MengXianLiang on 2017/3/3.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsDefineProperty.h"
#import "JobsBlock.h"


@interface XLChannelControl : NSObject

+ (XLChannelControl*)shareControl;

- (void)showChannelViewWithEnabledTitles:(NSArray*)enabledTitles disabledTitles:(NSArray*)disabledTitles finish:(XLChannelBlock)block;

@end
