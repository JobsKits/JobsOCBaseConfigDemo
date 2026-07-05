//
//  UICollectionViewCell+ShakeAnimation.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_67DD940F33
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_67DD940F33

#import <UIKit/UIKit.h>
#import "NSMutableArray+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (ShakeAnimation)

-(void)beginShake;// 实现cell抖动方法
-(void)stopShake;// 实现cell停止抖动方法

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_67DD940F33 */
