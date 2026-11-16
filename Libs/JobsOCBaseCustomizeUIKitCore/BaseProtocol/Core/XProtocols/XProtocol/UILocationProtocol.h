//
//  UILocationProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UILOCATIONPROTOCOL_BF90131AF0
#define JOBS_HEADER_GUARD_UILOCATIONPROTOCOL_BF90131AF0

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UILocationProtocol <NSObject>
@optional
#pragma mark —— 方位和大小
/// Frame
Prop_assign()CGFloat jobsX;
Prop_assign()CGFloat jobsY;
Prop_assign()CGFloat jobsWidth;// 宽
Prop_assign()CGFloat jobsHeight;// 高
/// Edge
Prop_assign()CGFloat jobsTop;
Prop_assign()CGFloat jobsLeft;// = leading
Prop_assign()CGFloat jobsRight;// = trailing
Prop_assign()CGFloat jobsBottom;
/// NSRange
Prop_assign()NSUInteger location;
Prop_assign()NSUInteger length;
/// Offset
Prop_assign()CGFloat jobsOffsetX;
Prop_assign()CGFloat jobsOffsetY;
/// 结构体
Prop_assign()CGSize jobsSize;// 二维尺寸
Prop_assign()CGRect jobsRect;
-(JobsRetIDByFrameBlock _Nonnull)byJobsRect;
Prop_assign()CGPoint jobsPoint;
-(JobsRetIDByCGPointBlock _Nonnull)byJobsPoint;
Prop_assign()UIRectCorner rectCorner;// 设置切哪个直角
Prop_assign()CGSize cornerRadii;// 设置切哪个直角的切角矩形
Prop_assign()UILayoutConstraintAxis axis;
Prop_assign()UIStackViewDistribution distribution;
Prop_assign()UIStackViewAlignment alignment;
Prop_assign()NSInteger section;
Prop_assign()NSInteger item;
Prop_assign()NSInteger row;
#pragma mark —— UIButton 专用属性 — 图文的相对位置
Prop_assign()NSDirectionalRectEdge buttonEdgeInsetsStyle;
Prop_assign()CGFloat imageTitleSpace;
Prop_assign()CGFloat titleSpace;
#pragma mark —— 关于 UITableViewCell 和 UICollectionViewCell
Prop_assign(class)CGFloat HeightForHeaderInSection;
Prop_assign(class)CGFloat CellWidth;
Prop_assign(class)CGFloat CellHeight;
Prop_assign(class)CGSize CellSize;
Prop_assign()CGFloat heightForHeaderInSection;
Prop_assign()CGFloat cellWidth;
Prop_assign()CGFloat cellHeight;
Prop_assign()CGSize cellSize;
Prop_assign()CGSize tableHeaderViewSize;
Prop_assign()CGSize tableFooterViewSize;
Prop_assign()BOOL usesTableViewHeaderView;// 默认不使用
Prop_assign()BOOL usesTableViewFooterView;// 默认不使用
/// 更多，参见： 关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量.md
Prop_assign()CGFloat offsetXForEach;
Prop_assign()CGFloat offsetYForEach;
Prop_assign()CGFloat offsetHeight;
Prop_assign()CGFloat offsetWidth;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILOCATIONPROTOCOL_BF90131AF0 */
