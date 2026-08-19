//
//  UIBarButtonItem+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBARBUTTONITEM_EXTRA_C5C9457DC3

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#define JOBS_HEADER_GUARD_UIBARBUTTONITEM_EXTRA_C5C9457DC3

#import <UIKit/UIKit.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extra)

+(JobsRetBarButtonItemByViewBlock _Nonnull)initBy;
-(JobsRetBarButtonItemByRACCommandBlock _Nonnull)byRacCommand;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIBarButtonItem * _Nullable JobsBarButtonItem(__kindof UIView *_Nullable view){
    return [UIBarButtonItem.alloc initWithCustomView:view];
}
#endif /* JOBS_HEADER_GUARD_UIBARBUTTONITEM_EXTRA_C5C9457DC3 */
