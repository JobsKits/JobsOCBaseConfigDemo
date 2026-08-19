//
//  GXCardViewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GXCardViewDemoVC.h"

static NSBundle *GXCardViewDemoResourceBundle(void) {
    NSArray<NSBundle *> *sourceBundles = @[
        [NSBundle bundleForClass:GXCardItemDemoCell.class] ?: NSBundle.mainBundle,
        NSBundle.mainBundle
    ];
    for (NSBundle *sourceBundle in sourceBundles) {
        NSURL *bundleURL = [sourceBundle URLForResource:@"JobsOCToolsCore" withExtension:@"bundle"];
        NSBundle *resourceBundle = bundleURL ? [NSBundle bundleWithURL:bundleURL] : nil;
        if (resourceBundle) return resourceBundle;
    }
    NSBundle *classBundle = [NSBundle bundleForClass:GXCardItemDemoCell.class];
    return classBundle ?: NSBundle.mainBundle;
}

@interface GXCardViewDemoVC ()
/// UI
//@property(nonatomic,weak)IBOutlet GXCardView *cardView;
Prop_strong()GXCardView *cardView;
Prop_assign()NSInteger cellCount;

@end

@implementation GXCardView (JobsDemoDSL)

-(JobsRetGXCardViewByIDBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.dataSource = data;
        return self;
    };
}

-(JobsRetGXCardViewByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}

-(JobsRetGXCardViewByNSIntegerBlock _Nonnull)byVisibleCount{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.visibleCount = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byLineSpacing{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.lineSpacing = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byInteritemSpacing{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.interitemSpacing = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byMaxAngle{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.maxAngle = data;
        return self;
    };
}

-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byMaxRemoveDistance{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.maxRemoveDistance = data;
        return self;
    };
}

-(JobsRetGXCardViewByBOOLBlock _Nonnull)byRepeat{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.isRepeat = data;
        return self;
    };
}

-(JobsRetGXCardViewByIDBlocks _Nonnull)byRegisterCell{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(jobsByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self) return nil;
        if (block) block(self);
        return self;
    };
}

-(JobsRetGXCardViewByBOOLBlock _Nonnull)reloadDataAnimated{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self reloadDataAnimated:data];
        return self;
    };
}

-(JobsRetGXCardViewByBOOLBlock _Nonnull)reloadMoreDataAnimated{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self reloadMoreDataAnimated:data];
        return self;
    };
}

-(JobsRetGXCardViewByNSIntegerBlock _Nonnull)removeTopCardViewFromSwipe{
    @jobs_weakify(self)
    return ^__kindof GXCardView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        [self removeTopCardViewFromSwipe:(GXCardCellSwipeDirection)data];
        return self;
    };
}

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN GXCardViewDemoVC
@interface GXCardViewDemoVC (JobsPropertyDSLSetterAutogen_c9db6dc1ad)
-(void)setCellCount:(NSInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END GXCardViewDemoVC

@implementation GXCardViewDemoVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byTextCor(JobsLabelColor);
            })
            //        self.viewModel.textModel.text = @"GXCardViewDemo".jobsTr();
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);    self.cellCount = 10;
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.cardView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        [_cardView reloadData];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}
#pragma mark —— GXCardViewDataSource
- (GXCardViewCell *)cardView:(GXCardView *)cardView
           cellForRowAtIndex:(NSInteger)index {
    GXCardItemDemoCell *cell = [cardView dequeueReusableCellWithIdentifier:@"GXCardViewCell"];
    cell.byBgColor(JobsYellowColor);
    cell.numberLabel.byText([NSString stringWithFormat:@"%ld", (long)index]);
    cell.leftLabel.byHidden(YES);
    cell.rightLabel.byHidden(YES);
    cell.layer.byCornerRadius(12.0);
    return cell;
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)numberOfCountInCardView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * cardView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.cellCount;
    };
}
#pragma mark —— GXCardViewDelegate
- (void)cardView:(GXCardView *)cardView
didRemoveLastCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index {
    if (!cardView.isRepeat) {
        [cardView reloadDataAnimated:YES];
    }
}

- (void)cardView:(GXCardView *)cardView
   didRemoveCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index
       direction:(GXCardCellSwipeDirection)direction {
    JobsLog(@"didRemoveCell forRowAtIndex = %ld, direction = %ld", index, direction);
    if (!cardView.isRepeat && index == 8) {
        self.byCellCount(15);
        [cardView reloadMoreDataAnimated:YES];
    }
}

- (void)cardView:(GXCardView *)cardView
  didDisplayCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index {
    JobsLog(@"didDisplayCell forRowAtIndex = %ld", index);
}

- (void)cardView:(GXCardView *)cardView
     didMoveCell:(GXCardViewCell *)cell
    forMovePoint:(CGPoint)point
       direction:(GXCardCellSwipeDirection)direction {
    GXCardItemDemoCell *dcell = (GXCardItemDemoCell*)cell;
    dcell.leftLabel.byHidden(!(direction == GXCardCellSwipeDirectionRight));
    dcell.rightLabel.byHidden(!(direction == GXCardCellSwipeDirectionLeft));
    JobsLog(@"move point = %@,  direction = %ld", NSStringFromCGPoint(point), direction);
}

- (IBAction)leftButtonClick:(id)sender {
    jobsByIDBlock action = ((jobsByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsLeftButtonClick)))(self, @selector(jobsLeftButtonClick));
    if (action) action(sender);
}

-(jobsByIDBlock _Nonnull)jobsLeftButtonClick{
    @jobs_weakify(self)
    return ^(id sender){
        @jobs_strongify(self)
        if (!self) return;
            [self.cardView removeTopCardViewFromSwipe:GXCardCellSwipeDirectionLeft];
        //    [self.cardView reloadDataFormIndex:2 animated:YES];
    };
}

- (IBAction)rightButtonClick:(id)sender {
    jobsByIDBlock action = ((jobsByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GXCardViewDemoVC.class, @selector(jobsRightButtonClick)))(self, @selector(jobsRightButtonClick));
    if (action) action(sender);
}

-(jobsByIDBlock _Nonnull)jobsRightButtonClick{
    @jobs_weakify(self)
    return ^(id sender){
        @jobs_strongify(self)
        if (!self) return;
        [self.cardView removeTopCardViewFromSwipe:GXCardCellSwipeDirectionRight];
    };
}
#pragma mark —— lazyLoad
-(GXCardView *)cardView{
    if (!_cardView) {
        _cardView = GXCardView.new
            .byDataSource(self)
            .byDelegate(self)
            .byVisibleCount(5)
            .byLineSpacing(15.0)
            .byInteritemSpacing(10.0)
            .byMaxAngle(15.0)
            .byMaxRemoveDistance(100.0)
            .byRegisterCell(^(__kindof GXCardView *view) {
                [view registerNib:jobsMakeNib(NSStringFromClass(GXCardItemDemoCell.class),
                                              GXCardViewDemoResourceBundle(),
                                              nil)
                 forCellReuseIdentifier:@"GXCardViewCell"];
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view);
            });
    };return _cardView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN GXCardViewDemoVC
-(JobsRetGXCardViewDemoVCByNSIntegerBlock _Nonnull)byCellCount{
    @jobs_weakify(self)
    return ^__kindof GXCardViewDemoVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCellCount:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END GXCardViewDemoVC
@end
