//
//  WMZCodeView.h
//  WMZCode
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <WMZCode/WMZCodeViewDefine.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

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

@interface WMZCodeView : UIView<BaseProtocol>
/*
 * 调用方法
 *
 * @param  CodeType  类型
 * @param  name      背景图
 * @param  rect      frame
 * @param  block     回调
 *
 */
- (WMZCodeView*)addCodeViewWithType:(CodeType)type
                      withImageName:(NSString *)name
                          witgFrame:(CGRect)rect;
@end

@interface WMZSlider : UISlider

Prop_strong()UILabel *label;

@end

NS_ASSUME_NONNULL_END
