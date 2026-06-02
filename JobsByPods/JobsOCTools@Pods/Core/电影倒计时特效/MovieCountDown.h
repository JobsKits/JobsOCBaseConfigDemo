//
//  MovieCountDown.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MOVIECOUNTDOWN_F66A01BB78
#define JOBS_HEADER_GUARD_MOVIECOUNTDOWN_F66A01BB78

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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
