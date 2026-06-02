//
//  ZWPullMenuCell.h
//  ZWPullMenuView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <ZWPullMenuView/ZWPullMenuModel.h>
#import <ZWPullMenuView/ZWPullMenuConfig.h>

NS_ASSUME_NONNULL_BEGIN
@interface ZWPullMenuCell : UITableViewCell
@property (strong, nonatomic) UIImageView *menuImageView;
@property (strong, nonatomic) UILabel *menuTitleLab;
/** 
 *  model
 */
@property (nonatomic, strong) ZWPullMenuModel *menuModel;
/**
 *  相关配置
 */
@property (nonatomic, strong) ZWPullMenuConfig *zw_menuConfg;
/**
 *  线条颜色
 */
@property (nonatomic, strong) UIColor *lineColor;
/** 
 * 最后一栏cell
 */
@property (nonatomic, assign) BOOL isFinalCell;
/**
 *  pullMenu样式
 */
@property (nonatomic, assign) ZWPullMenuStyle zwPullMenuStyle;

@end
NS_ASSUME_NONNULL_END
