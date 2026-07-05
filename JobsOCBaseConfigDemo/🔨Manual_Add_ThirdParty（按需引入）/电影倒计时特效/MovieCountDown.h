//
//  MovieCountDown.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MOVIECOUNTDOWN_F66A01BB78
#define JOBS_HEADER_GUARD_MOVIECOUNTDOWN_F66A01BB78

#import <UIKit/UIKit.h>

#import "JobsBaseProtocolHeader.h"

#import "JobsMakes.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieCountDown : NSObject<BaseProtocol>

Prop_weak()UIView *effectView;
Prop_strong()UIColor *countDownTextColor;
Prop_strong()UIColor *aphViewBackgroundColor;
Prop_assign()CGFloat countDownTime;

-(void)倒计时放大特效;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MOVIECOUNTDOWN_F66A01BB78 */
