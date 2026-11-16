//
//  BaseViewProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEVIEWPROTOCOL_A33BE2AAC5
#define JOBS_HEADER_GUARD_BASEVIEWPROTOCOL_A33BE2AAC5

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>                         // 用于嵌入和管理网页内容，例如加载和显示网页。
#import <PDFKit/PDFKit.h>                         // 提供 PDF 文档的读取、渲染、标注和交互能力。
#import "UIViewModelProtocol.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

@class MASConstraint;
@class HQTextField;
@class CJTextField;
@class ZYTextField;
@class JobsMagicTextField;
@class JobsTextField;
@class JobsTextView;
@class SZTextView;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewProtocol <UIViewModelProtocol>
typedef id _Nullable(^JobsRetIDByObjWithBaseViewProtocolBlock)(id<BaseViewProtocol> _Nullable data);
@optional
Prop_strong(nullable)__kindof UIActivityIndicatorView *activityIndicatorView;
Prop_strong(nullable)__kindof UIStackView *stackView;
Prop_strong(nullable)__kindof UIView *viewer; // 和系统字段进行区分
Prop_strong(nullable)__kindof UICollectionView *collectionView;
Prop_strong(nullable)__kindof UITableView *tableView;
Prop_strong(nullable)__kindof UIScrollView *scrollView;
Prop_strong(nullable)__kindof WKWebView *webView;
Prop_strong(nullable)__kindof PDFView *pdfView;
Prop_strong(nullable)__kindof UIImageView *imageView;
Prop_strong(nullable)__kindof UIButton *button;
Prop_strong(nullable)__kindof UILabel *label;
Prop_strong(nullable)__kindof UILabel *subLabel;
Prop_strong(nullable)__kindof UITextView *textView;
Prop_strong(nullable)__kindof SZTextView *szTextView;
Prop_strong(nullable)__kindof UITextField *textField;
Prop_strong(nullable)__kindof JobsTextView *jobsTextView;
Prop_strong(nullable)__kindof JobsMagicTextField *magicTextField;
Prop_strong(nullable)__kindof ZYTextField *zyTextField;
Prop_strong(nullable)__kindof HQTextField *hqTextField;
Prop_strong(nullable)__kindof CJTextField *cjTextField; // iOS监听键盘删除事件
Prop_strong(nullable)__kindof JobsTextField *jobsTextField;
/// 是否允许托拽手势
Prop_assign()BOOL isAllowDrag;
/// 退出当前页面的时候，除了当前页面出栈以外，你额外需要做的事情
Prop_copy(nullable)JobsRetIDByIDBlock jobsBackBlock;
/// 圆切角参数：作用于-(void)layoutSubviews
Prop_assign()UIRectCorner layoutSubviewsRectCorner;
Prop_assign()CGSize layoutSubviewsRectCornerSize;
Prop_strong(nullable)UIColor *layerCor;
/// 记录该View的Masonry约束情况
Prop_strong(nullable)NSMutableArray <MASConstraint *>*constraintMutArr;/* #import <Masonry/Masonry.h> */
/// 视图长、宽、高的定义
Prop_assign()CGSize thisViewSize;
-(JobsRetIDByCGSizeBlock _Nonnull)byThisViewSize;
/// 标记是HeaderView 还是 FooterView
Prop_assign()JobsHeaderFooterViewStyle headerFooterViewStyle;
Prop_copy(nullable)jobsByBtnBlock backBtnClickAction;
Prop_copy(nullable)jobsByBtnBlock closeBtnClickAction;
#pragma mark —— 用类方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewWidthByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewHeightByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)heightForHeaderInSection;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetFrameByIDBlock _Nonnull)viewFrameByModel;
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeXByModel;
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeYByModel;
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeWidthByModel;
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeHeightByModel;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(JobsRetCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel;
/// 数据（字符串）定宽
+(JobsRetCGFloatByIDBlock _Nonnull)widthByData;
/// 数据（字符串）定高
+(JobsRetCGFloatByIDBlock _Nonnull)heightByData;
#pragma mark —— 用实例方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewWidthByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewHeightByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)heightForHeaderInSection;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetFrameByIDBlock _Nonnull)viewFrameByModel;
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeXByModel;
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeYByModel;
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeWidthByModel;
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeHeightByModel;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
-(JobsRetCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel;
/// 数据（字符串）定宽
-(JobsRetCGFloatByIDBlock _Nonnull)widthByData;
/// 数据（字符串）定高
-(JobsRetCGFloatByIDBlock _Nonnull)heightByData;
#pragma mark —— 一些功能性的
/// makeNormaleWebView
/// self.webView.loadRequest(self.urlString.URLRequest);
+(JobsRetVCByWebViewBlock _Nonnull)initByWebView;
/// 初始化的时候最好传入一个size值将其子视图的大小固定死。因为只有当父视图有Size的情况下子视图才会展开，从而避免刷新约束时候的一系列麻烦事。
-(instancetype)initWithSize:(CGSize)thisViewSize;
-(JobsRetIDByCGSizeBlock _Nonnull)initWithSize;
/// 依据数据源对UI进行渲染：具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetViewByIDBlock _Nonnull)JobsRichViewByModel;
-(JobsRetViewByIDBlock _Nonnull)JobsRichViewByModel2;
-(jobsByIDBlock _Nonnull)jobsRichViewByModel;
-(JobsRetViewByIDBlock _Nonnull)JobsRichViewByModel;
-(jobsByViewModelBlock _Nonnull)jobsRichViewByViewModel;
-(JobsRetScrollViewByIDBlock _Nonnull)dataLink; // 用于 UIScrollView/UITableView/UICollectionView 的数据源绑定
-(JobsRetScrollViewByIDBlock _Nonnull)byShow; // 用于显示 UICollectionView / UITableView
-(jobsByIDBlock _Nonnull)update;
-(JobsRetNavBarByVoidBtnBlocks _Nonnull)JobsNavBarBackBtnClickBlock; // 返回按钮的回调
-(JobsRetNavBarByVoidBtnBlocks _Nonnull)JobsNavBarCloseBtnClickBlock; // 关闭按钮的回调
#pragma mark —— 关于 UITableViewHeaderFooterView
+(JobsRetTableViewHeaderFooterViewByTableViewAndSaltBlock _Nonnull)initByReuseIdentifier;
-(JobsRetTableViewHeaderFooterViewByNSIntegerBlock _Nonnull)bySection;
-(JobsRetTableViewHeaderFooterViewByNSIntegerBlock _Nonnull)byStyle; // 标记是TableView.HeaderView 还是 TableView.FooterView
-(JobsRetTableViewHeaderFooterViewByTableViewBlock _Nonnull)byTableView; // @implementation UITableViewHeaderFooterView (Attribute)
#pragma mark —— 关于 TextField
/// 清除数据
-(JobsRetViewByVoidBlock _Nonnull)cleanTextFieldValue;
/// 返回真实的 TextField
-(UITextField *)realTextField;
-(JobsRetUITextFieldByVoidBlock _Nonnull)jobsRealTextField;
/**
 在这个方法里：
 传入：UITableViewHeaderFooterView *
 对外返回：创建需要覆盖在UITableViewHeaderFooterView *的在View
 再在- (nullable __kindof UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section方法里面：
 self.makeViewOnTableViewHeaderFooterView(headerView).alpha = 1; /// 进行一句话进行调用
 */
-(JobsRetViewByTableViewHeaderFooterViewBlock _Nonnull)makeViewOnTableViewHeaderFooterView;
#pragma mark —— 在View内部进行实现处理，对外暴露的值。（不直接暴露UI控件）
-(JobsRetIDByVoidBlock _Nonnull)value;
-(JobsRetIDByVoidBlock _Nonnull)value1;
-(JobsRetIDByVoidBlock _Nonnull)value2;
-(JobsRetIDByVoidBlock _Nonnull)value3;
-(JobsRetIDByVoidBlock _Nonnull)value4;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEVIEWPROTOCOL_A33BE2AAC5 */
