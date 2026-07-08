//
//  BaseLayerProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASELAYERPROTOCOL_8603727699
#define JOBS_HEADER_GUARD_BASELAYERPROTOCOL_8603727699

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@protocol BaseLayerProtocol <NSObject>
@optional
Prop_assign()CGFloat cornerRadiusValue;
         // 圆切角—作用于所有的角
Prop_assign()UIRectCorner roundingCorners;      // ❤️ 这个属性如果不是UIRectCornerAllCorners，在某些情况下，按钮会不可见 圆切角—作用于指定的方位
Prop_assign()CGSize roundingCornersRadii;       // 圆切角—指定方位的Size大小
Prop_strong(nullable)UIColor *layerBorderCor;   // 描边的颜色
Prop_assign()CGFloat borderWidth;
               // 描边线的宽度
Prop_assign()BOOL masksToBounds;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASELAYERPROTOCOL_8603727699 */
