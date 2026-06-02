//
//  AppToolsProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_APPTOOLSPROTOCOL_F310A6C4D9
#define JOBS_HEADER_GUARD_APPTOOLSPROTOCOL_F310A6C4D9

#import <UIKit/UIKit.h>
#if __has_include(<JobsOCProtocols/BaseProtocol.h>)
#import <JobsOCProtocols/BaseProtocol.h>
#elif __has_include("BaseProtocol.h")
#import "BaseProtocol.h"
#else
#import "BaseProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/XProtocol.h>)
#import <JobsOCProtocols/XProtocol.h>
#elif __has_include("../XProtocols/XProtocol.h")
#import "../XProtocols/XProtocol.h"
#else
#import "XProtocol.h"
#endif
#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

@class UIViewModel;
@class UIButtonModel;
@class UITextModel;
@class JobsHotLabelBySingleLine;
@class CasinoGetiOSNewestVersionModel;
@class JobsRichTextConfig;

NS_ASSUME_NONNULL_BEGIN
/// App工具协议
@protocol AppToolsProtocol <BaseProtocol,XProtocol>
@optional
#pragma mark —— 关于挂载的数据资料
Prop_strong(nullable)UIViewModel *viewModel;
Prop_weak(nullable)UIViewModel *viewModel_weak;
Prop_strong(nullable)UIButtonModel *buttonModel;
Prop_strong(nullable)UIButtonModel *subButtonModel;
Prop_strong(nullable)UITextModel *textModel;
Prop_strong(nullable)UITextModel *subTextModel;
Prop_strong(nullable)UITextModel *backBtnTitleModel;/// 在具体的子类去实现，以覆盖父类的方法实现
Prop_strong(nullable)NSMutableArray <__kindof UIViewModel *> *viewModels;
Prop_strong(nullable)NSMutableArray <__kindof UIButtonModel *> *buttonModels;
/// JobsRichTextConfig
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *titleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *subTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *selectedTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *selectedSubTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
#pragma mark —— 关于导航栏
Prop_strong(nullable)__kindof UIButton *backBtn;
Prop_strong(nullable)UIButtonModel *closeBtnModel;
Prop_strong(nullable)UIButtonModel *backBtnModel;
Prop_strong(nullable)UIViewModel *titleModel;
/// 配置GKNavigationBar（不包括返回键的设定）
-(jobsByViewModelBlock _Nonnull)setGKNav;
/// 配置 JobsNavBarConfig
-(JobsReturnNavBarConfigByButtonModelBlock _Nonnull)makeNavBarConfig;
/// 配置GKNavigationBar的返回按钮（从上个页面推过来才有返回键）
-(jobsByBtnBlock _Nonnull)setGKNavBackBtn;
/// 配置GKNavigationBar的返回按钮
-(jobsByBtnBlock _Nonnull)setGKNavBackBtnBy;
/// 配置GKNavigationBar的标题（按钮）
-(jobsByButtonModelBlock _Nonnull)setGKNavTitleBtnBy;
/// 返回按钮的回调
-(JobsReturnNavBarByVoidBtnBlocks _Nullable)JobsNavBarBackBtnClickBlock;
/// 关闭按钮的回调
-(JobsReturnNavBarByVoidBtnBlocks _Nullable)JobsNavBarCloseBtnClickBlock;
#pragma mark —— 获取绑定的数据源
-(UIViewModel *_Nullable)getViewModel;
-(__kindof UIButtonModel *_Nullable)getButtonModel;
#pragma mark —— <AppToolsProtocol> 关于注册登录
/// Token过期应该做的事情
-(jobsByVoidBlock _Nonnull)tokenExpire;
/// 退出登录应该做的事情
-(jobsByVoidBlock _Nonnull)logout;
/// 清除用户数据资料
-(jobsByVoidBlock _Nonnull)cleanUserData;
/// 去登录？去注册？
-(jobsByNSIntegerBlock _Nonnull)toLoginOrRegister;
/// 在某些页面不调取登录页
-(void)toLoginOrRegisterWithRestricted:(__kindof NSArray <Class>*_Nullable)dataArr
                    appDoorContentType:(CurrentPage)appDoorContentType;
/// 去登录
-(jobsByVoidBlock _Nonnull)toLogin;
/// 强制去登录
-(jobsByVoidBlock _Nonnull)forcedLogin;
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
-(void)popUpViewToLogout;
#pragma mark —— <AppToolsProtocol> 关于 TabBar
/// TabBar
-(UITabBar *)getTabBar;
/// JobsTabbarVC 关闭手势
-(jobsByVoidBlock _Nonnull)tabBarClosePan;
/// JobsTabbarVC 打开手势
-(jobsByVoidBlock _Nonnull)tabBarOpenPan;
/// 跳到首页
-(void)jumpToHome;
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <__kindof UIViewController *>*)appRootVC;
/// 当前对象是否是 Tabbar管理的，不含导航的根控制器
-(BOOL)isRootVC;
#pragma mark —— 关于图片编解码
/// 图片base64编码，再固定50字符的位置加入固定盐。盐码（盐需大写、长度 16位）：RRU4JZTV5WZXPCVZ
/// 编码
-(JobsRetStrByStrBlock _Nonnull)encodePicStr;
/// 解码
-(JobsRetStrByStrBlock _Nonnull)decodePicStr;
#pragma mark —— <AppToolsProtocol> 其他
/// 根据 x 和 y 的绝对值判断主方向
-(JobsRetStrByCGPointBlock _Nonnull)directionByTranslation;
-(JobsRetNSIntegerByPointBlock _Nonnull)directionByPoint;
/// 设置普通文本
-(UIViewModel *)configViewModelWithTitle:(NSString *_Nullable)title
                                subTitle:(NSString *_Nullable)subTitle;
/// 带段落配置的文本
-(UIViewModel *)configViewModelWithAttributeTitle:(NSString *_Nullable)title
                                attributeSubTitle:(NSString *_Nullable)subTitle;
/// 打开游戏
-(jobsByStrBlock _Nonnull)openGameWithUrl;
/// 默认头像👤
-(UIImage *)defaultHeaderImage;
/// 当前语言【字符串形式】
-(NSString *)currentLanguage;
/// 当前语言【枚举形式】
-(HTTPRequestHeaderLanguageType)currentLanguageType;
/// App 升级弹窗：在根控制器下实现，做到覆盖全局的统一
-(void)appUpdateWithData:(CasinoGetiOSNewestVersionModel *_Nonnull)updateData
               sureBlock:(jobsByIDBlock _Nullable)sureBlock
             cancelBlock:(jobsByIDBlock _Nullable)cancelBlock;

-(jobsByHotLabelBlock _Nonnull)actionForHotLabel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_APPTOOLSPROTOCOL_F310A6C4D9 */
