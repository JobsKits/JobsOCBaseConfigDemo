//
//  TFPopupConst.h
//  TFPopup
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef TFPopupConst_h
#define TFPopupConst_h

#import <objc/runtime.h>

#pragma mark -- 属性绑定
#ifndef tf_synthesize_category_property
#define tf_synthesize_category_property(getter,settter,objc_AssociationPolicy,TYPE)\
- (TYPE)getter{return objc_getAssociatedObject(self, @selector(getter));}\
- (void)settter:(TYPE)obj{objc_setAssociatedObject(self, @selector(getter), obj, objc_AssociationPolicy);}
#endif

#ifndef tf_synthesize_category_property_retain
#define tf_synthesize_category_property_retain(getter,settter) tf_synthesize_category_property(getter,settter,OBJC_ASSOCIATION_RETAIN_NONATOMIC,id)
#endif

#ifndef tf_synthesize_category_property_copy
#define tf_synthesize_category_property_copy(getter,settter)   tf_synthesize_category_property(getter,settter,OBJC_ASSOCIATION_COPY,id)
#endif

#ifndef tf_synthesize_category_property_assign
#define tf_synthesize_category_property_assign(getter,settter) tf_synthesize_category_property(getter,settter,OBJC_ASSOCIATION_ASSIGN,id)
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
