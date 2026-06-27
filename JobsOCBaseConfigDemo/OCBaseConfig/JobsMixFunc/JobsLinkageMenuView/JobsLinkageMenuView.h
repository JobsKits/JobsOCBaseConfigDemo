//
//  JobsLinkageMenuView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "UIButton+UI.h"
#import "UIButtonModel.h"
#import "JobsBlock.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLinkageMenuViewConfig : NSObject

Prop_assign()CGFloat MENU_WIDTH;                    // 左侧菜单栏固定宽度，优先级最高
Prop_assign()CGFloat CONTENT_WIDTH;                 // 右侧内容区固定宽度，剩余宽度给菜单栏
Prop_assign()CGFloat MENU_RATIO;                    // 左侧菜单栏占整体宽度比例，0~1 生效
Prop_assign()CGFloat BOTTOMVIEW_HEIGHT;             // 滑块高度
Prop_assign()CGFloat BOTTOMVIEW_WIDTH;              // 滑块宽度
Prop_assign()CGFloat LINEVIEW_WIDTH;                // 分割线宽度
Prop_assign()CGFloat ANIMATION_TIME;                // 菜单栏滚动的时间
Prop_assign()CGFloat DEFAULT_MENU_ITEM_HEIGHT;      // 统一菜单子项高度
Prop_strong(nullable)NSArray<NSNumber *> *MENU_ITEM_HEIGHTS;             // 按数组下标单独配置高度
Prop_strong(nullable)NSDictionary<NSNumber *, NSNumber *> *MENU_ITEM_HEIGHT_MAP; // 按菜单下标覆盖高度
Prop_assign()BOOL CLEAR_CONTENT_WHEN_MISSING;       // 菜单无内容时是否清空右侧区域
Prop_copy(nullable)jobsByIDBlock menuClickBlock;    // 任意菜单点击回调，payload 为 NSDictionary
Prop_copy(nullable)jobsByIDBlock noContentClickBlock; // 菜单无内容时回调，payload 为 NSDictionary

@end

@interface JobsLinkageMenuView : BaseView

Prop_strong()UIColor *selectViewColor; // 滑块颜色
Prop_strong()UIColor *textColor;       // 标题颜色
Prop_strong()UIColor *selectTextColor; // 标题选中的颜色
Prop_assign()CGFloat textSize;         // 标题字体大小
Prop_copy(nullable)jobsByIDBlock menuClickBlock;
Prop_copy(nullable)jobsByIDBlock noContentClickBlock;

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(nullable JobsLinkageMenuViewConfig *)linkageMenuViewConfig;
-(instancetype)byMenuClickBlock:(nullable jobsByIDBlock)block;
-(instancetype)byNoContentClickBlock:(nullable jobsByIDBlock)block;
-(void)reloadData;

@end

NS_ASSUME_NONNULL_END
