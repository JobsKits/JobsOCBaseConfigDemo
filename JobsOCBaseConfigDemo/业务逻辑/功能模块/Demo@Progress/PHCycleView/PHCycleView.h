//
//  PHCycleView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

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

#define kBorderWith 10
#define KCenter CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0)

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

-(jobsByCGFloatBlock _Nonnull)updateProgress;
-(jobsByCorBlock _Nonnull)jobsSetProgressColor;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN PHCycleView
-(JobsRetPHCycleViewByCGFloatBlock _Nonnull)byCurrentProgress;
-(JobsRetPHCycleViewByNSStringBlock _Nonnull)byDescribeStr;
-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byDescribeTextColor;
-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byOutLayerColor;
-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byProgressTextColor;
-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byDescribeFont;
-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byProgressFont;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END PHCycleView
@end

NS_ASSUME_NONNULL_END
