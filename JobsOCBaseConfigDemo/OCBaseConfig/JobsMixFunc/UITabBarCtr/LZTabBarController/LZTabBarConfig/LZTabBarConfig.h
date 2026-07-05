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
/// item标题数组, 选择设置
Prop_copy()NSArray *titles;
/// 是否是导航, 默认 YES
Prop_assign()BOOL isNavigation;
/// 选中状态下的图片数组
Prop_copy()NSArray *selectedImages;
/// 正常状态下的图片数组
Prop_copy()NSArray *normalImages;
/// 选中状态下的标题颜色 默认: red
Prop_strong()UIColor *selectedColor;
/// 正常状态下的标题颜色 默认: gray
Prop_strong()UIColor *normalColor;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof LZTabBarConfig *_Nonnull jobsMakeLZTabBarConfig(jobsByLZTabBarConfigBlock _Nonnull block){
    LZTabBarConfig *data = LZTabBarConfig.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_LZTABBARCONFIG_65E9C95039 */
