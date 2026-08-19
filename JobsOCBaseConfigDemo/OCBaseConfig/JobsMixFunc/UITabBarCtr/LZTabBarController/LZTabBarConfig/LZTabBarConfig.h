//
//  LZTabBarConfig.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LZTABBARCONFIG_65E9C95039
#define JOBS_HEADER_GUARD_LZTABBARCONFIG_65E9C95039

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZTabBarConfig : NSObject
/// 控制器数组, 必须设置
Prop_copy()NSArray *viewControllers;
-(JobsRetLZTabBarConfigByArrBlock _Nonnull)byViewControllers;
/// item标题数组, 选择设置
Prop_copy()NSArray *titles;
-(JobsRetLZTabBarConfigByArrBlock _Nonnull)byTitles;
/// 是否是导航, 默认 YES
Prop_assign()BOOL isNavigation;
-(JobsRetLZTabBarConfigByBOOLBlock _Nonnull)byIsNavigation;
/// 选中状态下的图片数组
Prop_copy()NSArray *selectedImages;
-(JobsRetLZTabBarConfigByArrBlock _Nonnull)bySelectedImages;
/// 正常状态下的图片数组
Prop_copy()NSArray *normalImages;
-(JobsRetLZTabBarConfigByArrBlock _Nonnull)byNormalImages;
/// 选中状态下的标题颜色 默认: red
Prop_strong()UIColor *selectedColor;
-(JobsRetLZTabBarConfigByCorBlock _Nonnull)bySelectedColor;
/// 正常状态下的标题颜色 默认: gray
Prop_strong()UIColor *normalColor;
-(JobsRetLZTabBarConfigByCorBlock _Nonnull)byNormalColor;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof LZTabBarConfig *_Nonnull jobsMakeLZTabBarConfig(jobsByLZTabBarConfigBlock _Nonnull block){
    LZTabBarConfig *data = LZTabBarConfig.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_LZTABBARCONFIG_65E9C95039 */
