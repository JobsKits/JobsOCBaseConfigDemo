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

@implementation GXCardViewDemoVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(JobsLabelColor);
        })
        //        self.viewModel.textModel.text = @"GXCardViewDemo".tr;
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.cardView.byAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_cardView reloadData];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
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

- (NSInteger)numberOfCountInCardView:(UITableView *)cardView {
    return self.cellCount;
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
        self.cellCount = 15;
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
    [self.cardView removeTopCardViewFromSwipe:GXCardCellSwipeDirectionLeft];
//    [self.cardView reloadDataFormIndex:2 animated:YES];
}

- (IBAction)rightButtonClick:(id)sender {
    [self.cardView removeTopCardViewFromSwipe:GXCardCellSwipeDirectionRight];
}
#pragma mark —— lazyLoad
-(GXCardView *)cardView{
    if (!_cardView) {
        _cardView = GXCardView.new;
        _cardView.dataSource = self;
        _cardView.delegate = self;
        _cardView.visibleCount = 5;
        _cardView.lineSpacing = 15.0;
        _cardView.interitemSpacing = 10.0;
        _cardView.maxAngle = 15.0;
        _cardView.maxRemoveDistance = 100.0;
    //    _cardView.isRepeat = YES; // 新加入
        [_cardView registerNib:jobsMakeNib(NSStringFromClass(GXCardItemDemoCell.class),
                                           GXCardViewDemoResourceBundle(),
                                           nil)
         forCellReuseIdentifier:@"GXCardViewCell"];
        _cardView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        });
    };return _cardView;
}

@end
