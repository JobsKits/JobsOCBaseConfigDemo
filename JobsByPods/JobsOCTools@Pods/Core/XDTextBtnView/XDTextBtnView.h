//
//  XDTextBtnView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XDTEXTBTNVIEW_AC99FEC061
#define JOBS_HEADER_GUARD_XDTEXTBTNVIEW_AC99FEC061

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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@protocol XDTextBtnViewDelegate <NSObject>

@optional
//isSingle = YES
- (void)XDTextBtnViewClickIndex:(NSInteger)index lastClickIndex:(NSInteger)lastClickIndex;
//isSingle = NO
- (void)XDTextBtnViewSelectIndexes:(NSArray *)indexes;
-(jobsByNSArrayBlock _Nonnull)jobsXDTextBtnViewSelectIndexes;

@end

@interface XDTextBtnView : UIView

/**
 *  是否单选 默认单选
 *  如果单选 XDTextBtnViewClickIndex:lastClickIndex:
 *  如果多选 XDTextBtnViewSelectIndexes:
 */
Prop_assign()BOOL isSingle;
Prop_assign()CGFloat textFontSize;
Prop_strong()UIColor *textColor;
Prop_strong()UIColor *selectTextColor;
Prop_strong()UIColor *backgroundColor;
Prop_strong()UIColor *selectBackgroundColor;
Prop_assign()CGFloat cornerRadius;
Prop_assign()CGFloat borderWidth;
Prop_strong()UIColor *borderColor;

//按钮文字到按钮左右边的间距
Prop_assign()CGFloat marginX;

//按钮的间距
Prop_assign()CGFloat btnMarginX;
Prop_assign()CGFloat marginY;
Prop_assign()CGFloat btnHeight;

/**
 *  需要设置完全部样式后设置数据
 */
Prop_strong()NSArray <NSString *> *textArr;

/**
 *  需要设置完数据后设置默认数据
 */
Prop_strong()NSArray <NSString *> *defultIndexArr;
Prop_weak()id <XDTextBtnViewDelegate> delegate;

/**
 * 总高度(第一行无上marginY 最后一行无下marginY)
 */
Prop_assign(readonly)CGFloat maxY;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN XDTextBtnView
-(JobsRetXDTextBtnViewByNSIntegerBlock _Nonnull)byLastIndex;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END XDTextBtnView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_XDTEXTBTNVIEW_AC99FEC061 */
