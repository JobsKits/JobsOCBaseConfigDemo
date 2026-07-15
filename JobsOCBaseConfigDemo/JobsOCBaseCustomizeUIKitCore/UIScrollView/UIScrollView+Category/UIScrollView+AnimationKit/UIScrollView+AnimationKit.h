//
//  UIScrollView+AnimationKit.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISCROLLVIEW_ANIMATIONKIT_4FD494E275
#define JOBS_HEADER_GUARD_UISCROLLVIEW_ANIMATIONKIT_4FD494E275

#import <UIKit/UIKit.h>
#import "UIScrollView+UIScrollViewProtocol.h"
#import "NSMutableArray+Extra.h"
#import "NSArray+Extra.h"
#import "NSString+CAAnimation.h"
#import "NSValue+Extra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (AnimationKit)
-(void)moveAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— moveSpringAnimation
-(void)moveSpringAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— alphaAnimation
-(void)alphaAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— fallAnimation
-(void)fallAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— shakeAnimation
-(void)shakeAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— overTurnAnimation
-(void)overTurnAnimWithSortingType:(SortingType)sortingType
                    animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                   completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— toTopAnimation
-(void)toTopAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— springListAnimation
-(void)springListAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— shrinkToTopAnimation
-(void)shrinkToTopAnimWithSortingType:(SortingType)sortingType
                       animationBlock:(jobsByVoidBlock _Nullable)animationBlock;
#pragma mark —— layDownAnimation
-(void)layDownAnimWithSortingType:(SortingType)sortingType
                   animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                  completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— roteAnimation
-(void)roteAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISCROLLVIEW_ANIMATIONKIT_4FD494E275 */
