//
//  YTKBatchRequest+AnimatingAccessory.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKBATCHREQUEST_ANIMATINGACCESSORY_E9DB51E72D
#define JOBS_HEADER_GUARD_YTKBATCHREQUEST_ANIMATINGACCESSORY_E9DB51E72D

#import <UIKit/UIKit.h>
#import "YTKAnimatingRequestAccessory.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsDefines.h"

@interface YTKBatchRequest (AnimatingAccessory)

Prop_weak()UIView *animatingView;
Prop_strong()NSString *animatingText;

@end
#endif /* JOBS_HEADER_GUARD_YTKBATCHREQUEST_ANIMATINGACCESSORY_E9DB51E72D */
