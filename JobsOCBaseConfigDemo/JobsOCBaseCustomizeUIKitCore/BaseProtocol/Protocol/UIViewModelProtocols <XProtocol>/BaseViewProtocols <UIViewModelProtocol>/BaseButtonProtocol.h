//
//  BaseButtonProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举

NS_ASSUME_NONNULL_BEGIN
@protocol BaseButtonProtocol <NSObject>
@optional
/// 为了迎合点语法而故意把下列方法属性化
/// UIButton + UI
#pragma mark —— 配置信息
/// 关于系统对于按钮的配置信息
Prop_strong(nullable)UIButtonConfiguration *buttonConfiguration API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos) NS_SWIFT_UI_ACTOR;/// 来自新Api的配置文件。UIButtonConfiguration.filledButtonConfiguration;
Prop_strong(nullable)UIBackgroundConfiguration *backgroundConfiguration API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos) NS_SWIFT_UI_ACTOR;/// 自定义按钮背景的配置
Prop_assign()UIControlContentHorizontalAlignment contentHorizontalAlignment API_UNAVAILABLE(watchos); /// 针对内容的横向对齐方式
Prop_assign()UIControlContentVerticalAlignment contentVerticalAlignment API_UNAVAILABLE(watchos); /// 针对内容的竖向对齐方式
Prop_assign()NSDirectionalEdgeInsets contentInsets API_AVAILABLE(ios(11.0),tvos(11.0),watchos(4.0)); /// 定位内边距的方向。iOS 15以后 结合UIButtonConfiguration 以替换属性：UIEdgeInsets
Prop_assign()UIEdgeInsets contentEdgeInsets;/// iOS 15以前可以用
Prop_strong(nullable)UIColor *baseBackgroundColor;/// 背景颜色（普通）
Prop_strong(nullable)UIColor *selectedBaseBackgroundColor;/// 背景颜色（已选择）
/// 关于按钮描边（也可以通过父类UIView进行处理）
Prop_strong(nullable)UIColor *layerBorderCor;/// 描边的颜色（普通）
Prop_strong(nullable)UIColor *selectedLayerBorderCor;/// 描边的颜色（已选择）
Prop_assign()CGFloat normalBorderWidth;/// 描边线的宽度（普通）
Prop_assign()CGFloat selectedBorderWidth;/// 描边线的宽度（已选择）
/// 关于按钮的图文关系
Prop_assign()CGFloat imagePadding;/// 图像与标题之间的间距
Prop_assign()CGFloat titlePadding;/// 标题和副标题标签之间的距离
Prop_assign()NSDirectionalRectEdge imagePlacement;/// ❤️图片和文字的位置关系❤️
/// 一些自定义的配置信息
Prop_assign()UILabelShowingType titleShowingType;/// 主标题的显示方式
Prop_assign()UILabelShowingType subTitleShowingType;/// 副标题的显示方式
Prop_assign()BOOL jobsSelected; /// 避免与系统方法冲突
Prop_assign()BOOL jobsEnabled; /// 避免与系统方法冲突
Prop_assign()CGSize imageSize;
Prop_assign()CGFloat contentSpacing;
Prop_assign()CGFloat btnWidth; /// 预设值，父视图的宽度不能大于这个值
#pragma mark —— 普通文本
/**
 在 iOS 16 中，UIButtonConfiguration 使用 titleTextAttributesTransformer 来调整按钮标题的字体和颜色
 但直接访问字体并不像从 titleLabel 那样简单
 */
/// 未选择（普通）
Prop_copy(nullable)NSString *title; /// 主标题
Prop_copy(nullable)NSString *subTitle API_AVAILABLE(ios(16.0)); ///（新Api才有的）副标题
Prop_strong(nullable)UIFont *titleFont;/// 普通主标题文本的字体
Prop_strong(nullable)UIFont *subTitleFont API_AVAILABLE(ios(16.0));/// 普通副标题文本的字体
Prop_strong(nullable)UIColor *titleCor;/// 普通主标题文本文字颜色
Prop_strong(nullable)UIColor *subTitleCor;/// 普通副标题文本文字颜色
Prop_assign()NSTextAlignment titleAlignment;/// 针对文本的对齐方式 UIButton.titleLabel.titleAlignment【老Api】。也对应新Api里面的title的对齐方式
Prop_assign()NSTextAlignment subTitleAlignment;/// 也对应新Api里面的subTitle的对齐方式
Prop_assign()UIButtonConfigurationTitleAlignment buttonConfigurationTitleAlignment API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);/// 针对文本的对齐方式 UIButtonConfiguration.titleAlignment 【新Api】
Prop_assign()NSLineBreakMode titleLineBreakMode;/// 主标题换行模式
Prop_assign()NSLineBreakMode subtitleLineBreakMode;///（新Api才有的）副标题换行模式
/// 已选择
Prop_copy(nullable)NSString *selectedTitle; /// 主标题
Prop_copy(nullable)NSString *selectedSubTitle API_AVAILABLE(ios(16.0)); ///（新Api才有的）副标题
Prop_strong(nullable)UIFont *selectedTitleFont;/// 普通主标题文本的字体
Prop_strong(nullable)UIFont *selectedSubTitleFont API_AVAILABLE(ios(16.0));/// 普通副标题文本的字体
Prop_strong(nullable)UIColor *selectedTitleCor;/// 普通主标题文本文字颜色
Prop_strong(nullable)UIColor *selectedSubTitleCor;/// 普通副标题文本文字颜色
Prop_assign()NSTextAlignment selectedTitleAlignment;/// 针对文本的对齐方式 UIButton.titleLabel.titleAlignment【老Api】。也对应新Api里面的title的对齐方式
Prop_assign()NSTextAlignment selectedSubTitleAlignment;/// 也对应新Api里面的subTitle的对齐方式
Prop_assign()UIButtonConfigurationTitleAlignment selectedButtonConfigurationTitleAlignment API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);/// 针对文本的对齐方式 UIButtonConfiguration.titleAlignment 【新Api】
Prop_assign()NSLineBreakMode selectedTitleLineBreakMode;/// 主标题换行模式
Prop_assign()NSLineBreakMode selectedSubtitleLineBreakMode;///（新Api才有的）副标题换行模式
#pragma mark —— 图片
/// 未选择（普通）
Prop_strong(nullable)UIImage *backgroundImage;///（普通）背景图片
Prop_strong(nullable)UIImage *normalImage;/// 正常情况下（普通）的image
/// 已选择
Prop_strong(nullable)UIImage *highlightBackgroundImage;/// （选中）背景图片
Prop_strong(nullable)UIImage *highlightImage;/// = selected_Image （选中）高亮情况下的image
#pragma mark —— 富文本
/// 未选择（普通）
Prop_strong(nullable)NSAttributedString *attributedTitle;/// 主标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
Prop_strong(nullable)NSAttributedString *attributedSubTitle;///（新Api才有的）副标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
/// 已选择
Prop_strong(nullable)NSAttributedString *selectedAttributedTitle;///（只限于老Api，新Api里面没有）UIControlStateSelected状态下的标题富文本。设置富文本，请关注：#import "NSObject+RichText.h"
Prop_strong(nullable)NSAttributedString *selectedAttributedSubTitle;
#pragma mark —— 对UIButton子控件的约束
/// ⚠️执行return的顺序依照下列👇🏻属性的排序⚠️
///【组 1】UIButton 单独自定义设置系统自带控件的Frame【形成Frame后直接return，避免被其他中间过程修改】❤️与组2、3属性互斥❤️
Prop_assign()CGRect textLabelFrame;
Prop_assign()CGRect subTextLabelFrame;
Prop_assign()CGRect btnImageViewFrame;
///【组 2】UIButton 单独自定义设置系统自带控件的Size【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、3属性互斥❤️
Prop_assign()CGSize textLabelSize;
Prop_assign()CGFloat textLabelFrameResetX;
Prop_assign()CGFloat textLabelFrameResetY;

Prop_assign()CGSize subTextLabelSize;
Prop_assign()CGFloat subTextLabelFrameResetX;
Prop_assign()CGFloat subTextLabelFrameResetY;

Prop_assign()CGSize imageViewSize;
Prop_assign()CGFloat imageViewFrameResetX;
Prop_assign()CGFloat imageViewFrameResetY;
///【组 3】UIButton 单独自定义设置系统自带控件的长宽【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、2属性互斥❤️
Prop_assign()CGFloat textLabelWidth;
Prop_assign()CGFloat subTextLabelWidth;
Prop_assign()CGFloat imageViewWidth;
Prop_assign()CGFloat textLabelHeight;
Prop_assign()CGFloat subTextLabelHeight;
Prop_assign()CGFloat imageViewHeight;
/// UIButton 单独自定义设置系统自带控件的偏移量 ❤️与其他组属性不互斥❤️
/// 关于 textLabel 的偏移
Prop_assign()CGFloat textLabelFrameOffsetX;
Prop_assign()CGFloat textLabelFrameOffsetY;
Prop_assign()CGFloat textLabelFrameOffsetWidth;
Prop_assign()CGFloat textLabelFrameOffsetHeight;
/// 关于 subTextLabel 的偏移
Prop_assign()CGFloat subTextLabelFrameOffsetX;
Prop_assign()CGFloat subTextLabelFrameOffsetY;
Prop_assign()CGFloat subTextLabelFrameOffsetWidth;
Prop_assign()CGFloat subTextLabelFrameOffsetHeight;
/// 关于 imageView 的偏移
Prop_assign()CGFloat imageViewFrameOffsetX;
Prop_assign()CGFloat imageViewFrameOffsetY;
Prop_assign()CGFloat imageViewFrameOffsetWidth;
Prop_assign()CGFloat imageViewFrameOffsetHeight;
#pragma mark —— 用类方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)buttonWidthByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)buttonHeightByModel;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)buttonSizeByModel;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetFrameByIDBlock _Nonnull)buttonFrameByModel;
#pragma mark —— 用实例方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)buttonWidthByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)buttonHeightByModel;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGSizeByIDBlock _Nonnull)buttonSizeByModel;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetFrameByIDBlock _Nonnull)buttonFrameByModel;
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richButtonByModel;
/// 其他
-(JobsRetTableViewCellByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets;

@end

NS_ASSUME_NONNULL_END

#ifndef BaseButtonProtocol_synthesize_part1
#define BaseButtonProtocol_synthesize_part1 \
\
@synthesize jobsSelected = _jobsSelected;\
@synthesize jobsEnabled = _jobsEnabled;\
@synthesize layerBorderCor = _layerBorderCor;\

#endif /* BaseButtonProtocol_synthesize_part1 */

#ifndef BaseButtonProtocol_synthesize_part2
#define BaseButtonProtocol_synthesize_part2 \
\
@synthesize buttonConfiguration = _buttonConfiguration;\
@synthesize backgroundConfiguration = _backgroundConfiguration;\
@synthesize contentHorizontalAlignment = _contentHorizontalAlignment;\
@synthesize contentVerticalAlignment = _contentVerticalAlignment;\
@synthesize contentInsets = _contentInsets;\
@synthesize contentEdgeInsets = _contentEdgeInsets;\
@synthesize baseBackgroundColor = _baseBackgroundColor;\
@synthesize selectedBaseBackgroundColor = _selectedBaseBackgroundColor;\
@synthesize selectedLayerBorderCor = _selectedLayerBorderCor;\
@synthesize normalBorderWidth = _normalBorderWidth;\
@synthesize selectedBorderWidth = _selectedBorderWidth;\
@synthesize imagePadding = _imagePadding;\
@synthesize titlePadding = _titlePadding;\
@synthesize imagePlacement = _imagePlacement;\
@synthesize titleShowingType = _titleShowingType;\
@synthesize subTitleShowingType = _subTitleShowingType;\
@synthesize imageSize = _imageSize;\
@synthesize contentSpacing = _contentSpacing;\
@synthesize btnWidth = _btnWidth;\
@synthesize title = _title;\
@synthesize subTitle = _subTitle;\
@synthesize titleFont = _titleFont;\
@synthesize subTitleFont = _subTitleFont;\
@synthesize titleCor = _titleCor;\
@synthesize subTitleCor = _subTitleCor;\
@synthesize titleAlignment = _titleAlignment;\
@synthesize subTitleAlignment = _subTitleAlignment;\
@synthesize buttonConfigurationTitleAlignment = _buttonConfigurationTitleAlignment;\
@synthesize titleLineBreakMode = _titleLineBreakMode;\
@synthesize subtitleLineBreakMode = _subtitleLineBreakMode;\
@synthesize selectedTitle = _selectedTitle;\
@synthesize selectedSubTitle = _selectedSubTitle;\
@synthesize selectedTitleFont = _selectedTitleFont;\
@synthesize selectedSubTitleFont = _selectedSubTitleFont;\
@synthesize selectedTitleCor = _selectedTitleCor;\
@synthesize selectedSubTitleCor = _selectedSubTitleCor;\
@synthesize selectedTitleAlignment = _selectedTitleAlignment;\
@synthesize selectedSubTitleAlignment = _selectedSubTitleAlignment;\
@synthesize selectedButtonConfigurationTitleAlignment = _selectedButtonConfigurationTitleAlignment;\
@synthesize selectedTitleLineBreakMode = _selectedTitleLineBreakMode;\
@synthesize selectedSubtitleLineBreakMode = _selectedSubtitleLineBreakMode;\
@synthesize backgroundImage = _backgroundImage;\
@synthesize normalImage = _normalImage;\
@synthesize highlightBackgroundImage = _highlightBackgroundImage;\
@synthesize highlightImage = _highlightImage;\
@synthesize attributedTitle = _attributedTitle;\
@synthesize attributedSubTitle = _attributedSubTitle;\
@synthesize selectedAttributedTitle = _selectedAttributedTitle;\
@synthesize selectedAttributedSubTitle = _selectedAttributedSubTitle;\
@synthesize textLabelFrame = _textLabelFrame;\
@synthesize subTextLabelFrame = _subTextLabelFrame;\
@synthesize btnImageViewFrame = _btnImageViewFrame;\
@synthesize textLabelSize = _textLabelSize;\
@synthesize textLabelFrameResetX = _textLabelFrameResetX;\
@synthesize textLabelFrameResetY = _textLabelFrameResetY;\
@synthesize subTextLabelSize = _subTextLabelSize;\
@synthesize subTextLabelFrameResetX = _subTextLabelFrameResetX;\
@synthesize subTextLabelFrameResetY = _subTextLabelFrameResetY;\
@synthesize imageViewSize = _imageViewSize;\
@synthesize imageViewFrameResetX = _imageViewFrameResetX;\
@synthesize imageViewFrameResetY = _imageViewFrameResetY;\
@synthesize textLabelWidth = _textLabelWidth;\
@synthesize subTextLabelWidth = _subTextLabelWidth;\
@synthesize imageViewWidth = _imageViewWidth;\
@synthesize textLabelHeight = _textLabelHeight;\
@synthesize subTextLabelHeight = _subTextLabelHeight;\
@synthesize imageViewHeight = _imageViewHeight;\
@synthesize textLabelFrameOffsetX = _textLabelFrameOffsetX;\
@synthesize textLabelFrameOffsetY = _textLabelFrameOffsetY;\
@synthesize textLabelFrameOffsetWidth = _textLabelFrameOffsetWidth;\
@synthesize textLabelFrameOffsetHeight = _textLabelFrameOffsetHeight;\
@synthesize subTextLabelFrameOffsetX = _subTextLabelFrameOffsetX;\
@synthesize subTextLabelFrameOffsetY = _subTextLabelFrameOffsetY;\
@synthesize subTextLabelFrameOffsetWidth = _subTextLabelFrameOffsetWidth;\
@synthesize subTextLabelFrameOffsetHeight = _subTextLabelFrameOffsetHeight;\
@synthesize imageViewFrameOffsetX = _imageViewFrameOffsetX;\
@synthesize imageViewFrameOffsetY = _imageViewFrameOffsetY;\
@synthesize imageViewFrameOffsetWidth = _imageViewFrameOffsetWidth;\
@synthesize imageViewFrameOffsetHeight = _imageViewFrameOffsetHeight;
#endif /* BaseButtonProtocol_synthesize_part2 */


#ifndef BaseButtonProtocol_synthesize
#define BaseButtonProtocol_synthesize \
\
BaseButtonProtocol_synthesize_part1 \
BaseButtonProtocol_synthesize_part2

#endif /* BaseButtonProtocol_synthesize */

#ifndef BaseButtonProtocol_dynamic_part2
#define BaseButtonProtocol_dynamic_part2 \
\
@dynamic buttonConfiguration;\
@dynamic backgroundConfiguration;\
@dynamic contentHorizontalAlignment;\
@dynamic contentVerticalAlignment;\
@dynamic contentInsets;\
@dynamic contentEdgeInsets;\
@dynamic baseBackgroundColor;\
@dynamic selectedBaseBackgroundColor;\
@dynamic layerBorderCor;\
@dynamic selectedLayerBorderCor;\
@dynamic normalBorderWidth;\
@dynamic selectedBorderWidth;\
@dynamic imagePadding;\
@dynamic titlePadding;\
@dynamic imagePlacement;\
@dynamic titleShowingType;\
@dynamic subTitleShowingType;\
@dynamic imageSize;\
@dynamic contentSpacing;\
@dynamic btnWidth;\
@dynamic title;\
@dynamic subTitle;\
@dynamic titleFont;\
@dynamic subTitleFont;\
@dynamic titleCor;\
@dynamic subTitleCor;\
@dynamic titleAlignment;\
@dynamic subTitleAlignment;\
@dynamic buttonConfigurationTitleAlignment;\
@dynamic titleLineBreakMode;\
@dynamic subtitleLineBreakMode;\
@dynamic selectedTitle;\
@dynamic selectedSubTitle;\
@dynamic selectedTitleFont;\
@dynamic selectedSubTitleFont;\
@dynamic selectedTitleCor;\
@dynamic selectedSubTitleCor;\
@dynamic selectedTitleAlignment;\
@dynamic selectedSubTitleAlignment;\
@dynamic selectedButtonConfigurationTitleAlignment;\
@dynamic selectedTitleLineBreakMode;\
@dynamic selectedSubtitleLineBreakMode;\
@dynamic backgroundImage;\
@dynamic normalImage;\
@dynamic highlightBackgroundImage;\
@dynamic highlightImage;\
@dynamic attributedTitle;\
@dynamic attributedSubTitle;\
@dynamic selectedAttributedTitle;\
@dynamic selectedAttributedSubTitle;\
@dynamic textLabelFrame;\
@dynamic subTextLabelFrame;\
@dynamic btnImageViewFrame;\
@dynamic textLabelSize;\
@dynamic textLabelFrameResetX;\
@dynamic textLabelFrameResetY;\
@dynamic subTextLabelSize;\
@dynamic subTextLabelFrameResetX;\
@dynamic subTextLabelFrameResetY;\
@dynamic imageViewSize;\
@dynamic imageViewFrameResetX;\
@dynamic imageViewFrameResetY;\
@dynamic textLabelWidth;\
@dynamic subTextLabelWidth;\
@dynamic imageViewWidth;\
@dynamic textLabelHeight;\
@dynamic subTextLabelHeight;\
@dynamic imageViewHeight;\
@dynamic textLabelFrameOffsetX;\
@dynamic textLabelFrameOffsetY;\
@dynamic textLabelFrameOffsetWidth;\
@dynamic textLabelFrameOffsetHeight;\
@dynamic subTextLabelFrameOffsetX;\
@dynamic subTextLabelFrameOffsetY;\
@dynamic subTextLabelFrameOffsetWidth;\
@dynamic subTextLabelFrameOffsetHeight;\
@dynamic imageViewFrameOffsetX;\
@dynamic imageViewFrameOffsetY;\
@dynamic imageViewFrameOffsetWidth;\
@dynamic imageViewFrameOffsetHeight;\
@dynamic isCanBeClickWhenTimerCycle;

#endif /* BaseButtonProtocol_dynamic_part2 */
