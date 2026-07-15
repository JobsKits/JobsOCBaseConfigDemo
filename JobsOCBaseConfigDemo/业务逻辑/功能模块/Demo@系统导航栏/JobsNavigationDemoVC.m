//
//  JobsNavigationDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNavigationDemoVC.h"

@interface JobsNavigationDemoVC ()

@end

@implementation JobsNavigationDemoVC
-(void)dealloc{
    NSLog(@"");
}

-(void)loadView{
    [super loadView];
    self.isHiddenNavigationBar = NO;
    self.setupNavigationBarHidden = NO;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(UIColor.lightGrayColor);
    self.setupAppearanceByNavigationBar(self.navigationController.navigationBar); // 1. 外观：背景图、底色、tintColor 等
    [self setupNavigationTitle];                                                  // 2. 标题：普通 + 富文本
    [self setupLeftBackItem];                                                     // 3. 左侧自定义返回键
    [self setupRightItems];                                                       // 4. 右侧自定义按钮
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    if (navigationBar) navigationBar.byHidden(NO);
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 导航栏外观：背景图、底色、tintColor、阴影线
-(jobsByNavigationBarBlock _Nonnull)setupAppearanceByNavigationBar{
    return ^(__kindof UINavigationBar *_Nullable navBar){
        if(!navBar) navBar = UINavigationBar.appearance;
        /// ① tintColor：影响返回箭头、barButtonItem 图标/文字的颜色
        navBar.byTintColor(UIColor.blackColor);
        UIImage *bgImage = @"导航栏背景图".img;
        if (@available(iOS 13.0, *)) {
            jobsMakeNavigationBarAppearance(^(__kindof UINavigationBarAppearance * _Nullable appearance) {
                /// 先设为不透明背景，避免半透明那套乱七八糟的效果
                [appearance configureWithOpaqueBackground];
                /// ② 背景图 + 底色（背景图优先）
                appearance.backgroundImage = bgImage;
             // 背景图（优先级最高）
                appearance.backgroundColor = UIColor.yellowColor; // 底色，在图透明处才可见
                /// ③ 标题文字基础样式（非富文本标题时用这一套）
                appearance.titleTextAttributes = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable dic) {
                    dic[NSForegroundColorAttributeName] = UIColor.redColor;
                    dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
                });
                /// （可选）大标题样式
                appearance.largeTitleTextAttributes = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable dic) {
                    dic[NSForegroundColorAttributeName] = UIColor.cyanColor;
                    dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:30];
                });
                /// （可选）隐藏底部那条黑线
                appearance.shadowColor = UIColor.clearColor;
                // 或者：appearance.shadowImage = [UIImage new];
                /// 应用到当前导航栏
                navBar.standardAppearance = appearance;
                navBar.scrollEdgeAppearance = appearance;
                navBar.compactAppearance = appearance;
                if (@available(iOS 15.0, *)) {
                    navBar.compactScrollEdgeAppearance = appearance;
                }
                /// （可选）启用大标题
                // self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
                // navBar.prefersLargeTitles = YES;
            });
        } else {
            /// iOS 12 及以前的写法
            [navBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
            navBar.barTintColor = UIColor.yellowColor;
            navBar.translucent = NO;
            navBar.titleTextAttributes = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable dic) {
                dic[NSForegroundColorAttributeName] = UIColor.redColor;
                dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
            });
            /// 隐藏底部那条线（可选）
            [navBar setShadowImage:UIImage.new];
        }
    };
}
#pragma mark —— 2. 标题：普通标题 + 富文本标题
-(void)setupNavigationTitle {
    /// 普通标题（会走 titleTextAttributes 的样式）
    self.title = @"系统导航栏 Demo";
    /// 如果你要用富文本标题，就用自定义 titleView 覆盖系统标题
    @jobs_weakify(self)
    self.navigationItem.titleView = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byTextAlignment(NSTextAlignmentCenter)
            .byAttributedString(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                data1.byFont(UIFontWeightRegularSize(JobsWidth(12)))
                     .byTextCor(JobsBlueColor)
                     .byTargetString(@"合理".tr)
                     .byTextBgCor(JobsBrownColor);
                data1.paragraphStyle = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data2) {
                    data2.byAlignment(NSTextAlignmentJustified)
                        .byParagraphSpacing(0) // 段距，取值 float
                        .byParagraphSpacingBefore(0) // 段首空间，取值 float
                        .byFirstLineHeadIndent(0.0) // 首行缩进，取值 float
                        .byHeadIndent(0.0) // 整体缩进(首行除外)，取值 float
                        .byLineSpacing(0); // 行距，取值 float
                });
            }));
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                @jobs_strongify(self)
                data1.byFont(UIFontWeightSemiboldSize(JobsWidth(13)))
                     .byTextCor(JobsWhiteColor)
                     .byTargetString(@"的".tr)
                     .byTextBgCor(JobsBrownColor)
                     .byParagraphStyle(self.defaultParagraphStyle);
            }));
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                @jobs_strongify(self)
                data1.byFont(UIFontWeightUltraLightSize(JobsWidth(14)))
                     .byTextCor(JobsRedColor)
                     .byTargetString(@"语法糖".tr)
                     .byTextBgCor(JobsBrownColor)
                     .byParagraphStyle(self.defaultParagraphStyle);
            }));
        })))
            .byBgColor(UIColor.clearColor)
        .bySizeToFit();
    });
}
#pragma mark —— 左边：自定义返回键
/// 自定义 leftBarButtonItem 后，有些写法会把「右滑返回」手势搞没，可以在需要的控制器里：
/// self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
- (void)setupLeftBackItem {
    // 隐藏系统默认返回按钮（如果当前不是根控制器）
    self.navigationItem.hidesBackButton = YES;
    @jobs_weakify(self)
    self.navigationItem.leftBarButtonItem =
    UIButton
        .jobsInit()
        .bgColorBy(JobsClearColor)
        .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
        .jobsResetImagePadding(1)
        .jobsResetBtnImage(@"chevron.backward".sys_img)
        .jobsResetBtnTitle(@"返回".tr)
        .jobsResetBtnTitleCor(JobsBlackColor)
        .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            NSLog(@"👉 点击了左侧『返回』按钮");
            self.goBack(x);
        })
        .onLongPressGestureBy(^(id data){
            NSLog(@"👉 长按了左侧『返回』按钮");
        })
        .bySize(CGSizeMake(JobsWidth(62), JobsWidth(32)))
        .barBtnItem;
//    UIImage *backImage = @"nav_back".img;
//    if (!backImage) {
//        if (@available(iOS 13.0, *)) {
//            backImage = @"chevron.backward".sys_img;
//        }
//    }
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithImage:backImage
//                                                                           style:UIBarButtonItemStylePlain
//                                                                          target:nil
//                                                                          action:nil]
//        .byRacCommand([RACCommand.alloc initWithSignalBlock:^RACSignal * _Nonnull(id _Nullable input) {
//            @jobs_strongify(self)
//            self.goBack(input);
//            return [RACSignal empty];
//    }]);
}
#pragma mark —— 右边：自定义按钮
- (void)setupRightItems {
    /// 右 1：文字按钮
    /// 右 2：图标按钮（用自定义 UIButton 做 customView）
    @jobs_weakify(self)
    self.navigationItem.rightBarButtonItems = jobsMakeMutArr(^(__kindof NSMutableArray<UIBarButtonItem *> * _Nullable arr) {
        arr.add([UIBarButtonItem.alloc initWithTitle:@"hi"
                                               style:UIBarButtonItemStylePlain
                                              target:nil
                                              action:nil]
                .byRacCommand([RACCommand.alloc initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
                    NSLog(@"👉 点击了右侧『hi』按钮");
                    toastBy(@"点击了右侧『hi』按钮".tr);
                    return [RACSignal empty];
                }]))
        .add(UIButton.jobsInit()
             .bgColorBy(JobsClearColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"bell".sys_img)
             .jobsResetBtnTitle(@"铃".tr)
             .jobsResetBtnTitleCor(JobsBlueColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .onClickBy(^(UIButton *x){
                 @jobs_strongify(self)
                 NSLog(@"👉 点击了右侧『铃铛』按钮");
                 toastBy(@"点击了右侧『铃铛』按钮".tr);
             })
             .onLongPressGestureBy(^(id data){
                 NSLog(@"👉 长按了右侧『铃铛』按钮");
             })
             .bySize(CGSizeMake(JobsWidth(44), JobsWidth(32))).barBtnItem);
    });
}
#pragma mark —— （可选）状态栏样式
// 如果你需要跟导航栏联动改变状态栏文字颜色：
- (UIStatusBarStyle)preferredStatusBarStyle {
    // 深色背景图时，返回 lightContent
    return UIStatusBarStyleLightContent;
}

@end
