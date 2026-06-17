//
//  TFPopupConst.h
//  JobsOCBaseConfigDemo
//
//  Created by zhutaofeng on 2019/5/13.
//  Copyright © 2019 ztf. All rights reserved.
//

#ifndef TFPopupConst_h
#define TFPopupConst_h

#import <objc/runtime.h>
#import "MacroDef_Sys.h"

#pragma mark -- 属性绑定
#ifndef tf_synthesize_category_property
#define tf_synthesize_category_property(getter,settter,objc_AssociationPolicy,TYPE)\
tf_synthesize_category_property_retain(getter,settter)
#endif

#ifndef tf_synthesize_category_property_retain
#define tf_synthesize_category_property_retain(getter,settter)\
JobsKey(_##getter)\
@dynamic getter;\
- (id)getter{return Jobs_getAssociatedObject(_##getter);}\
- (void)settter:(id)obj{Jobs_setAssociatedRETAIN_NONATOMIC(_##getter, obj)}
#endif

#ifndef tf_synthesize_category_property_copy
#define tf_synthesize_category_property_copy(getter,settter)\
JobsKey(_##getter)\
@dynamic getter;\
- (id)getter{return Jobs_getAssociatedObject(_##getter);}\
- (void)settter:(id)obj{Jobs_setAssociatedCOPY(_##getter, obj)}
#endif

#ifndef tf_synthesize_category_property_assign
#define tf_synthesize_category_property_assign(getter,settter)\
JobsKey(_##getter)\
@dynamic getter;\
- (id)getter{return Jobs_getAssociatedObject(_##getter);}\
- (void)settter:(id)obj{Jobs_setAssociatedASSIGN(_##getter, obj)}
#endif

#ifndef x_weakSelf
#define x_weakSelf __weak typeof(self) weakself = self
#endif

#ifdef DEBUG
#define PopupLog(fmt, ...) JobsLog((@"\nfunc:%s,line:%d\n" fmt @"\n"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define PopupLog(...)
#endif


typedef NS_ENUM(NSInteger,TFAnimationType) {
    TFAnimationTypeFade,
    TFAnimationTypeScale,
};

#endif /* TFPopupConst_h */
