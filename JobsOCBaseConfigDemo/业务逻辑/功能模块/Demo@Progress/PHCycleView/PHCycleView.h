//
//  PHCycleView.h
//  JobsOCBaseConfigDemo
//
//  Created by 1 on 2020/11/13.
//  Copyright © 2020 yzl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBorderWith 10
#define KCenter CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0)

#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHCycleView : UIView
/**进度条颜色*/
Prop_strong()UIColor *progressColor;
/**进度Label字体*/
Prop_strong()UIFont *progressFont;
/**描述Label字体*/
Prop_strong()UIFont *describeFont;
/**描述Label文字*/
Prop_copy()NSString *describeStr;
/**进度Label字体颜色*/
Prop_strong()UIColor *progressTextColor;
/**描述Label字体颜色*/
Prop_strong()UIColor *describeTextColor;
/**进度条无进度颜色*/
Prop_strong()UIColor *outLayerColor;
/*
 preAngle 横线间隔的度数
 size 线条的宽度 和长度
 color 线条的颜色
 */
-(void)setLinePreAngle:(CGFloat)preAngle
              lineSize:(CGSize)size
                 color:(UIColor *)color;

-(void)updateProgress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
