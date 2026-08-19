//
//  TestIrregularViewTestVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TestIrregularViewTestVC.h"

@interface TestIrregularViewTestVC ()

@end

@implementation TestIrregularViewTestVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestIrregularViewTestVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestIrregularViewTestVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.view1(); //右斜边梯形
        self.view2(); //平行四边形
        self.view3(); //左斜边梯形
        self.view4(); //六角形
        self.view5(); //对折形状
        self.view6(); //箭头
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestIrregularViewTestVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestIrregularViewTestVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestIrregularViewTestVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)irregularViewContentOffsetY{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGFloat navBottom = CGRectGetMaxY(self.gk_navigationBar.frame);
        return navBottom > 0 ? navBottom : JobsNavigationBarAndStatusBarHeight(nil);
    };
}
/// 右斜边梯形
-(jobsByVoidBlock _Nonnull)view1{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat contentOffsetY = self.irregularViewContentOffsetY();
        IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
        btn
            .jobsResetBtnTitle(@"按钮".jobsTr())
            .byBgColor([UIColor orangeColor]);
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            x.byBgColor(RGB_COLOR(R, G, B));
        }];
        /// 添加路径关键点array
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 0.f)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 0.f)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 *3/4, 50)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 120)));
        btn.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.view).offset(100 + contentOffsetY);
            make.size.mas_offset(CGSizeMake(120, 50));
        });
    };
}
/// 平行四边形
-(jobsByVoidBlock _Nonnull)view2{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat contentOffsetY = self.irregularViewContentOffsetY();
        IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
        btn
            .jobsResetBtnTitle(@"按钮".jobsTr())
            .byFrame(CGRectMake(120, 100 + contentOffsetY, 120, 50))
            .byBgColor([UIColor greenColor]);
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            x.byBgColor(RGB_COLOR(R, G, B));
        }];
        /// 添加路径关键点array
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 50.f)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 / 4, 0.f)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 0)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 * 3 / 4, 50)));
        btn.addOn(self.view);
    };
}
/// 左斜边梯形
-(jobsByVoidBlock _Nonnull)view3{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat contentOffsetY = self.irregularViewContentOffsetY();
        IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
        btn
            .jobsResetBtnTitle(@"按钮".jobsTr())
            .byFrame(CGRectMake(220, 100 + contentOffsetY, 120, 50))
            .byBgColor([UIColor cyanColor]);
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            x.byBgColor(RGB_COLOR(R, G, B));
        }];btn.addOn(self.view);
        /// 添加路径关键点array
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 / 4, 50.f)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 0.f)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 50)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 50)));
    };
}
/// 六角形
- (jobsByVoidBlock _Nonnull)view4{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat contentOffsetY = self.irregularViewContentOffsetY();
        IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
        btn
            .jobsResetBtnTitle(@"按钮".jobsTr())
            .byFrame(CGRectMake(20, 200 + contentOffsetY, 150, 150))
            .byBgColor([UIColor purpleColor]);
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            x.byBgColor(RGB_COLOR(R, G, B));
        }];btn.addOn(self.view);
        /// 添加路径关键点array
        float viewWidth = btn.frame.size.width;
        CGPoint point1 = CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2), (viewWidth / 4));
        CGPoint point2 = CGPointMake((viewWidth / 2), 0);
        CGPoint point3 = CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                     (viewWidth / 4));
        CGPoint point4 = CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                     (viewWidth / 2) + (viewWidth / 4));
        CGPoint point5 = CGPointMake((viewWidth / 2), viewWidth);
        CGPoint point6 = CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2),
                                     (viewWidth / 2) + (viewWidth / 4));
        /// 添加路径关键点array
        btn.pointMutArr.add(NSValue.byPoint(point1));
        btn.pointMutArr.add(NSValue.byPoint(point2));
        btn.pointMutArr.add(NSValue.byPoint(point3));
        btn.pointMutArr.add(NSValue.byPoint(point4));
        btn.pointMutArr.add(NSValue.byPoint(point5));
        btn.pointMutArr.add(NSValue.byPoint(point6));
    };
}
/// 对折形状
-(jobsByVoidBlock _Nonnull)view5{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat contentOffsetY = self.irregularViewContentOffsetY();
        IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
        btn
            .jobsResetBtnTitle(@"按钮".jobsTr())
            .byFrame(CGRectMake(200, 200 + contentOffsetY, 150, 150))
            .byBgColor([UIColor brownColor]);
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            x.byBgColor(RGB_COLOR(R, G, B));
        }];btn.addOn(self.view);
        /// 添加路径关键点array
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 0.f)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(150, 0)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 150)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(150, 150)));
    };
}
/// 箭头
-(jobsByVoidBlock _Nonnull)view6 {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat contentOffsetY = self.irregularViewContentOffsetY();
        IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
        btn
            .jobsResetBtnTitle(@"按钮".jobsTr())
            .byFrame(CGRectMake(20, 380 + contentOffsetY, 330, 150))
            .byBgColor([UIColor magentaColor]);
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            x.byBgColor(RGB_COLOR(R, G, B));
        }];btn.addOn(self.view);
        /// 添加路径关键点array
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 150)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 150 / 3)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 0)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330, 150 / 2)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 150)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 150 * 2 / 3)));
        btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 150 * 2 / 3)));
    };
}

@end
