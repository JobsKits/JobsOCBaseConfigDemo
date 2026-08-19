//
//  MasonryVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MasonryVC.h"

@interface MasonryVC ()
/// UI
Prop_strong()MSMineView2 *view2;
Prop_strong()UIView *demo2ContainerView;
Prop_strong()NSMutableArray <UILabel *>*demo1LabelMutArr;
Prop_strong()NSMutableArray <UIView *>*demo2ItemViewMutArr;

@end

@implementation MasonryVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            //    self.viewModel.textModel.text = @"消息详情页".jobsTr();
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
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        //    [self demo1];
        //    [self demo2];
        //    [self demo3];
            self.demo4();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
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

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MasonryVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— 一些私有方法
/// 不用Masonry，直接用frame来实现：根据字符串，一行4个元素，自动提行
-(jobsByVoidBlock _Nonnull)demo1{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        // 设置标签容器的初始位置
        CGFloat containerX = 20;
        CGFloat containerY = 100;
        // 设置标签容器的宽度
        CGFloat containerWidth = self.view.frame.size.width - 2 * containerX;
        // 设置标签高度和间距
        __block CGFloat tagHeight = 30;
        __block CGFloat tagSpacing = 10;
        // 初始化当前行的x坐标和y坐标
        __block CGFloat currentX = containerX;
        __block CGFloat currentY = containerY;
        __block CGSize tagSize = CGSizeZero;
        // 遍历标签名称并创建标签
        for (NSString *tagName in jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(@"标签1".jobsTr())
            .add(@"标签2".jobsTr())
            .add(@"标签3".jobsTr())
            .add(@"标签4".jobsTr())
            .add(@"标签5".jobsTr())
            .add(@"标签6".jobsTr())
            .add(@"标签7".jobsTr())
            .add(@"标签8".jobsTr())
            .add(@"标签9".jobsTr())
            .add(@"标签10".jobsTr());
        })) {
            UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(tagName)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byLabelBlock(^(__kindof UILabel * _Nullable data) {
                        // 根据标签文本计算标签宽度
                        tagSize = [data sizeThatFits:CGSizeMake(containerWidth, tagHeight)];
                        // 如果当前行放不下该标签，则换行
                        if (currentX + tagSize.width > containerWidth) {
                            currentX = containerX;
                            currentY += tagHeight + tagSpacing;
                        }
                    })
                    .byBgColor(JobsSecondarySystemBackgroundColor)
                    .byCornerRadius(5.0)
                    .byClipsToBounds(YES)
                    .byFrame(CGRectMake(currentX, currentY, tagSize.width, tagHeight))
                    .addOn(self.view);
            });
            [self.demo1LabelMutArr addObject:label];
            currentX += tagSize.width + tagSpacing;/// 更新当前行的x坐标
        }
    };
}
/**

 用Masonry实现类似于UICollectionView的效果：
 1、父视图中的每一个子元素类似于UICollectionViewCell，我可以自定义这些元素的宽高
 2、可以统一的自定义定制每个元素之间的横向和纵向间距
 3、整个父容器的四个角必须紧贴元素，不能超出父视图容器
 4、然后实现横向等距离排布，与纵向等距离排布
 5、如果排布下来发现我之前自定义的间距会使得这些元素超出父容器，那么重新计算这个间距，使得子元素不超过父视图容器，并统一使用
 6、可以自定义元素的个数
 */
-(jobsByVoidBlock _Nonnull)demo2{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        // 创建父视图容器
        self.demo2ContainerView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 20, 100, 20)); // 设置四个边界紧贴父视图
        });
        [self.view layoutIfNeeded];
        JobsLog(@"ddd = %f",CGRectGetWidth(self.demo2ContainerView.frame));
        [self.demo2ItemViewMutArr removeAllObjects];
        // 自定义子元素的宽高
        CGFloat itemWidth = 50.0; // 自行设定子元素的宽度
        CGFloat itemHeight = 60.0; // 自行设定子元素的高度
        // 自定义横向和纵向间距
        CGFloat horizontalSpacing = 10.0;
        CGFloat verticalSpacing = 10.0;
        // 自定义子元素的数量
        NSInteger itemCount = 19;
        // 计算每行每列的数量
        NSInteger columns = floor((CGRectGetWidth(self.demo2ContainerView.frame) - horizontalSpacing) / (itemWidth + horizontalSpacing));
        NSInteger rows = ceil((CGFloat)itemCount / columns); // 确保行数能容纳所有子元素
        // 重新计算横向和纵向间距
        horizontalSpacing = (CGRectGetWidth(self.demo2ContainerView.frame) - columns * itemWidth) / (columns - 1);
        verticalSpacing = (CGRectGetHeight(self.demo2ContainerView.frame) - rows * itemHeight) / (rows - 1);
        for (NSInteger row = 0; row < rows; row++) {
            for (NSInteger column = 0; column < columns; column++) {
                NSInteger index = row * columns + column;
                if (index < itemCount) {
                    UIView *itemView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                        view
                            .byBgColor(UIColor.blueColor) // 子元素背景色为蓝色
                            .addOn(self.demo2ContainerView)
                            .byAdd(^(MASConstraintMaker *make) {
                                make.width.equalTo(@(itemWidth)); // 设置子元素宽度
                                make.height.equalTo(@(itemHeight)); // 设置子元素高度
                                // 计算子元素的位置
                                make.left.equalTo(self.demo2ContainerView.mas_left).offset(column * (itemWidth + horizontalSpacing));
                                make.top.equalTo(self.demo2ContainerView.mas_top).offset(row * (itemHeight + verticalSpacing));
                            });
                    });
                    [self.demo2ItemViewMutArr addObject:itemView];
                }
            }
        }
    };
}
/**
 
 用Masonry实现类似于UICollectionView的效果：
 1、父视图中的每一个子元素类似于UICollectionViewCell，我可以自定义这些元素的宽高（每个子元素的宽为30 ，高为50）
 2、可以统一的自定义定制每个元素之间的横向和纵向间距
 3、对于整个子元素来讲，不能超出父视图容器，这个是大前提
 4、对于父视图容器来讲，左上角和右上角必须紧贴元素。而左下角和右下角是不需要紧贴子元素，完全一个个自动排布而来
 4、实现横向等距离排布，与纵向等距离排布
 5、优先使用我之前自定义的纵向和横向间距，只有当超出父视图容器的时候，才会重新计算间距值，摒弃我之前自定义的间距值
 */
-(jobsByVoidBlock _Nonnull)demo3{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        //Ai失败
    };
}
/// Masonry 动画
-(jobsByVoidBlock _Nonnull)demo4{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.view2.byAlpha(1);
    };
}
#pragma mark —— lazyLoad
-(UIView *)demo2ContainerView{
    if (!_demo2ContainerView) {
        _demo2ContainerView = jobsMakeView(^(UIView *object){});
        _demo2ContainerView.byBgColor(UIColor.redColor);
    };return _demo2ContainerView;
}

-(NSMutableArray<UILabel *> *)demo1LabelMutArr{
    if (!_demo1LabelMutArr) {
        _demo1LabelMutArr = NSMutableArray.array;
    };return _demo1LabelMutArr;
}

-(NSMutableArray<UIView *> *)demo2ItemViewMutArr{
    if (!_demo2ItemViewMutArr) {
        _demo2ItemViewMutArr = NSMutableArray.array;
    };return _demo2ItemViewMutArr;
}

-(MSMineView2 *)view2{
    if(!_view2){
        @jobs_weakify(self)
        _view2 = MSMineView2.alloc.init;
        _view2.jobsRichViewByModel(nil);
        _view2.addOn(self.view);
        [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(28)));
            make.right.equalTo(self.view).offset(JobsWidth(-10));
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
        }];
        [self.view setNeedsUpdateConstraints];
        UIView.jobsAnimateWithCompletion(0.5,
            ^{
            @jobs_strongify(self)
            [self.view layoutIfNeeded];
        },
            ^(BOOL finished) {
            @jobs_strongify(self)
            [self->_view2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(MSMineView2.viewSizeByModel(nil));
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
            }];
            [self.view setNeedsUpdateConstraints];
            UIView.jobsAnimate(0.5,
                ^{
                [self.view layoutIfNeeded];
            });
        });
        _view2.cornerCutToCircleWithCornerRadius(MSMineView2.viewSizeByModel(nil).height / 2);
    };return _view2;
}

@end
