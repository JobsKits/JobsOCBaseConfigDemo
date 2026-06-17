//
//  GestureProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_GESTUREPROTOCOL_B034A75D30
#define JOBS_HEADER_GUARD_GESTUREPROTOCOL_B034A75D30

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"
#import "JobsDefines.h"
#import "JobsBlock.h"

@class JobsSEL_IMP;

NS_ASSUME_NONNULL_BEGIN

@protocol GestureProtocol <BaseProtocol>
@optional
Prop_assign()NSUInteger minimumNumberOfTouches API_UNAVAILABLE(tvos);
Prop_assign()NSUInteger maximumNumberOfTouches API_UNAVAILABLE(tvos);
Prop_assign()NSUInteger numberOfTapsRequired;// 设置轻拍次数【UILongPressGestureRecognizer】【UITapGestureRecognizer】⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
Prop_assign()NSUInteger numberOfTouchesRequired;// 设置手指字数【UILongPressGestureRecognizer】【UITapGestureRecognizer】
Prop_assign()NSTimeInterval minimumPressDuration;// longPressGR最小长按时间【UILongPressGestureRecognizer】
Prop_assign()CGFloat allowableMovement;//【UILongPressGestureRecognizer】
Prop_assign()UISwipeGestureRecognizerDirection swipeGRDirection;/// swipe手势清扫方向
Prop_assign()UIScrollTypeMask allowedScrollTypesMask API_AVAILABLE(ios(13.4));
Prop_assign()CGFloat scale;// 捏合范围
Prop_assign()CGFloat rotate;// 旋转角度
/// UIGestureRecognizer
Prop_strong(nullable)UILongPressGestureRecognizer *longPressGR;// 长按手势
Prop_strong(nullable)UITapGestureRecognizer *tapGR;// 点击手势
Prop_strong(nullable)UITapGestureRecognizer *doubleTapGR;// 双击手势
Prop_strong(nullable)UISwipeGestureRecognizer *swipeGR;// 轻扫手势
Prop_strong(nullable)UIPanGestureRecognizer *panGR;// 平移手势
Prop_strong(nullable)UIPinchGestureRecognizer *pinchGR;// 捏合（缩放）手势
Prop_strong(nullable)UIRotationGestureRecognizer *rotationGR;// 旋转手势
Prop_strong(nullable)UIScreenEdgePanGestureRecognizer *screenEdgePanGR;// 屏幕边缘平移
/// action
Prop_strong(nullable)JobsSEL_IMP *longPressGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *tapGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *doubleTapGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *swipeGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *panGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *pinchGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *rotationGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *screenEdgePanGR_SelImp;

-(void)Dealloc;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_GESTUREPROTOCOL_B034A75D30 */
