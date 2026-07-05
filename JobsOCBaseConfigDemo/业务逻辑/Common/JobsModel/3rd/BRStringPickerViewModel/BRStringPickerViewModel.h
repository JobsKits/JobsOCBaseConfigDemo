//
//  BRStringPickerViewModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026/5/29.
//

#ifndef BRStringPickerViewModel_h
#define BRStringPickerViewModel_h

#import <Foundation/Foundation.h>

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class BRPickerStyle;

@interface BRStringPickerViewModel : NSObject
/// 来自新版 BRTextPickerView
/** 文本选择器显示类型 */
Prop_assign()BRTextPickerMode pickerMode;
/**
 *  1.设置数据源
 *    单列：@[@"男", @"女", @"其他"]，或直接传一维模型数组(NSArray <BRTextModel *>*)
 *    多列：@[@[@"语文", @"数学", @"英语"], @[@"优秀", @"良好"]]，或直接传多维模型数组
 *    联动：传树状结构模型数组(NSArray <BRTextModel *>*)，可使用 [NSArray br_modelArrayWithJson:mapper:] 转换
 */
Prop_copy(nullable)NSArray *dataSourceArr;
/**
 *  2.设置数据源（新版支持 plist/json 文件）
 *    单列/多列：可传 plist 文件名，如 @"education_data.plist"
 *    多列联动：可传 JSON 文件名，如 @"region_tree_data.json"
 */
Prop_copy(nullable)NSString *fileName;
/// 旧命名兼容：内部建议改用 fileName。
Prop_copy(nullable)NSString *plistName;
/** 设置默认选中的位置【单列】 */
Prop_assign()NSInteger selectIndex;
/** 设置默认选中的位置【多列/联动】 */
Prop_copy(nullable)NSArray <NSNumber *> *selectIndexs;
/**
 *  新版 BRTextPickerView 已移除 selectValue / selectValues。
 *  这里保留字段仅用于历史模型承载，实际配置 BRTextPickerView 时不再按 value 反查。
 */
Prop_copy(nullable)NSString *selectValue;
Prop_copy(nullable)NSArray <NSString *> *selectValues;
/** 设置选择器显示的列数，即层级数；默认由数据源层级动态计算 */
Prop_assign()NSUInteger showColumnNum;
/// 旧命名兼容：等价于 showColumnNum。
Prop_assign()NSInteger numberOfComponents;
/// 滚动至选择行动画，默认为 NO。
Prop_assign()BOOL selectRowAnimated;
/// 来自 BRPickerAlertView
/** 选择器标题 */
Prop_copy(nullable)NSString *title;
/** 是否自动选择：新版文本选择器已无 isAutoSelect，建议使用 singleChangeBlock / multiChangeBlock 实现滚动即回调 */
Prop_assign()BOOL isAutoSelect;
/** 自定义UI样式（不传或为nil时，是默认样式） */
Prop_strong(nullable)BRPickerStyle *pickerStyle;
/** accessory view for above picker view. default is nil */
Prop_strong(nullable)UIView *pickerHeaderView;
/** accessory view below picker view. default is nil */
Prop_strong(nullable)UIView *pickerFooterView;
/** 弹框视图(使用场景：可以在 alertView 上添加选择器的自定义背景视图) */
Prop_strong(nullable)UIView *alertView;
/** 组件的父视图：可以传自己获取的 keyWindow，或页面的 view */
Prop_strong(nullable)UIView *keyView;

@end

NS_ASSUME_NONNULL_END

#endif /* BRStringPickerViewModel_h */
