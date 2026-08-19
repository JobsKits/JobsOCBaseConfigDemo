//
//  CGAffineTransform+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CGAFFINETRANSFORM_DSL
#define JOBS_HEADER_GUARD_CGAFFINETRANSFORM_DSL

#import <UIKit/UIKit.h>
#import <string.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
@interface NSValue (JobsCGAffineTransformDSL)

+(JobsRetValueByVoidBlock _Nonnull)byCGAffineTransformIdentity;
+(JobsRetValueByAffineTransformBlock _Nonnull)byCGAffineTransform;
+(JobsRetValueByPointBlock _Nonnull)byCGAffineTransformMakeTranslation;
+(JobsRetValueByPointBlock _Nonnull)byCGAffineTransformMakeScale;
+(JobsRetValueByCGFloatBlock _Nonnull)byCGAffineTransformMakeRotation;
-(JobsRetValueByPointBlock _Nonnull)byTranslate;
-(JobsRetValueByPointBlock _Nonnull)byScale;
-(JobsRetValueByCGFloatBlock _Nonnull)byRotate;
-(JobsRetValueByAffineTransformBlock _Nonnull)byConcat;
Prop_assign(readonly)CGAffineTransform byCGAffineTransformValue;

@end
NS_ASSUME_NONNULL_END
#endif
