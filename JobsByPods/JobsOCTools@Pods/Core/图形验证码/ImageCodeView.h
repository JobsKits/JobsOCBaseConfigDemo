//
//  ImageCodeView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IMAGECODEVIEW_ECA4A3D4BC
#define JOBS_HEADER_GUARD_IMAGECODEVIEW_ECA4A3D4BC

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface ImageCodeView : UIView

Prop_copy()__kindof NSArray <NSString *>*CodeArr;
Prop_copy()NSString *CodeStr;
Prop_strong()UIColor *color;
Prop_strong()UIFont *font;
Prop_strong()UIColor *bgColor;//外界不传值定义内部即用随机色彩

-(void)actionBlockImageCodeView:(jobsByIDBlock _Nullable)imageCodeViewBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_IMAGECODEVIEW_ECA4A3D4BC */
