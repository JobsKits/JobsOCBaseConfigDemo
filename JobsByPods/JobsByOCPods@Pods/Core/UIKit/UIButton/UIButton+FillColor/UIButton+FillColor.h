//
//  UIButton+FillColor.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_FILLCOLOR_FF929210A4
#define JOBS_HEADER_GUARD_UIBUTTON_FILLCOLOR_FF929210A4

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FillColor)
/// 你截图里的自定义属性（如不需要可删）
@property(nonatomic,copy,nullable)NSString *titleName;
/// 给指定 state 设置背景色（本质是设置 backgroundImage）
-(void)by_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_FILLCOLOR_FF929210A4 */
