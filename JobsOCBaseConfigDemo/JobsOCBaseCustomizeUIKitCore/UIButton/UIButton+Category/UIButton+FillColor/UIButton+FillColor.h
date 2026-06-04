//
//  UIButton+FillColor.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 5/2/26.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FillColor)
/// 你截图里的自定义属性（如不需要可删）
Prop_copy(nullable)NSString *titleName;
/// 给指定 state 设置背景色（本质是设置 backgroundImage）
-(void)by_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
