//
//  UILabel+Measure.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_MEASURE_B1B05CFBE2
#define JOBS_HEADER_GUARD_UILABEL_MEASURE_B1B05CFBE2

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Measure)
/// iOS根据字体字号大小和字体label计算label宽度
+(CGSize)sizeWithText:(NSString *)text
                 font:(UIFont *)font
              maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_MEASURE_B1B05CFBE2 */
