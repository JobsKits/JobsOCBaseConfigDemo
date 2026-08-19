//
//  ImageCodeView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IMAGECODEVIEW_ECA4A3D4BC
#define JOBS_HEADER_GUARD_IMAGECODEVIEW_ECA4A3D4BC

#import <UIKit/UIKit.h>
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageCodeView : UIView

Prop_copy()__kindof NSArray <NSString *>*CodeArr;
Prop_copy()NSString *CodeStr;
Prop_strong()UIColor *color;
Prop_strong()UIFont *font;
Prop_strong()UIColor *bgColor;//外界不传值定义内部即用随机色彩

-(JobsRetImageCodeViewByArrBlock _Nonnull)byCodeArr;
-(JobsRetImageCodeViewByStrBlock _Nonnull)byCodeStr;
-(JobsRetImageCodeViewByCorBlock _Nonnull)byColor;
-(JobsRetImageCodeViewByFontBlock _Nonnull)byFont;
-(JobsRetImageCodeViewByCorBlock _Nonnull)byBgColor;
-(jobsByjobsByIDBlockBlock _Nonnull)actionBlockImageCodeView;

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_IMAGECODEVIEW_ECA4A3D4BC */
