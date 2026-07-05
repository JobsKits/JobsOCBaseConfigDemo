//
//  YTKChainRequest+AnimatingAccessory.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKCHAINREQUEST_ANIMATINGACCESSORY_DB310FBB5B
#define JOBS_HEADER_GUARD_YTKCHAINREQUEST_ANIMATINGACCESSORY_DB310FBB5B

#import <UIKit/UIKit.h>
#import "YTKAnimatingRequestAccessory.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

@interface YTKChainRequest (AnimatingAccessory)

Prop_weak()UIView *animatingView;
Prop_strong()NSString *animatingText;

@end
#endif /* JOBS_HEADER_GUARD_YTKCHAINREQUEST_ANIMATINGACCESSORY_DB310FBB5B */
