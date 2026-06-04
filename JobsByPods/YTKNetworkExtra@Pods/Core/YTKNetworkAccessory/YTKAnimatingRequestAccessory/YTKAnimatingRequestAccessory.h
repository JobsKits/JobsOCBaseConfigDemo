//
//  YTKAnimatingRequestAccessory.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKANIMATINGREQUESTACCESSORY_2008E8B2F2
#define JOBS_HEADER_GUARD_YTKANIMATINGREQUESTACCESSORY_2008E8B2F2

#import <UIKit/UIKit.h>

//#import "YTKAlertUtils.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

@interface YTKAnimatingRequestAccessory : NSObject <YTKRequestAccessory>

Prop_weak()UIView *animatingView;
Prop_copy()NSString *animatingText;

-(id)initWithAnimatingView:(UIView *)animatingView;
-(id)initWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

+(id)accessoryWithAnimatingView:(UIView *)animatingView;
+(id)accessoryWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

@end
#endif /* JOBS_HEADER_GUARD_YTKANIMATINGREQUESTACCESSORY_2008E8B2F2 */
