//
//  LOTAnimationMJRefreshFooter.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LOTAnimationMJRefreshFooter.h"

#import "UIView+Measure.h"

static const CGFloat OffsetBetweenStateLabelAndAnimationView = 5;//StateLabel 和 AnimationView 之间的间距

@interface LOTAnimationMJRefreshFooter ()

Prop_strong()LOTAnimationView *animationView;

-(jobsByVoidBlock _Nonnull)jobsBeginRefreshing;
-(jobsByVoidBlock _Nonnull)jobsEndRefreshing;

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LOTAnimationView
@interface LOTAnimationView (JobsLocalPropertyDSLAutogen_14f9cade7b)
-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byMj_x;
-(JobsRetLOTAnimationViewByCGSizeBlock _Nonnull)bySizer;
-(void)setLoopAnimation:(BOOL)data;
-(void)setMj_x:(CGFloat)data;
-(void)setSizer:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LOTAnimationView

@implementation LOTAnimationMJRefreshFooter
- (void)prepare{
    [super prepare];
    self.animationView.byAlpha(1);
    self.gifView.byAlpha(0);//屏蔽掉父类的gifView控件，否则将会有Gif图和Lottie动画一起出现
    @jobs_weakify(self)
    self.endRefreshingCompletionBlock = ^{
        @jobs_strongify(self)
        self.updateStateLabelText();
    };
    self.stateLabel.byFont(UIFontWeightRegularSize(14));
    self.updateStateLabelText();
}
// 执行重新给子视图布局的时候
- (void)placeSubviews{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LOTAnimationMJRefreshFooter.class, @selector(jobsPlaceSubviews)))(self, @selector(jobsPlaceSubviews)))();
}

- (jobsByVoidBlock _Nonnull)jobsPlaceSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super placeSubviews];
        self.stateLabel.byMj_w(self.stateLabel.mj_textWidth);
        self.stateLabel.byCenter(self.mj_w / 2.0 + 15, self.mj_h / 2.0 + 0.0);
        self.animationView.byMj_x(self.stateLabel.mj_x - OffsetBetweenStateLabelAndAnimationView - self.animationView.mj_w);
        self.animationView.byCenterY(self.stateLabel.centerY);
    };
}
// 更新状态文案
- (jobsByVoidBlock _Nonnull)updateStateLabelText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self setTitle:self.refreshConfigModel.stateIdleTitle
              forState:MJRefreshStateIdle];/// 普通闲置状态
        [self setTitle:self.refreshConfigModel.pullingTitle
              forState:MJRefreshStatePulling];/// 松开就可以进行刷新的状态
        [self setTitle:self.refreshConfigModel.refreshingTitle
              forState:MJRefreshStateRefreshing];/// 正在刷新中的状态
        [self setTitle:self.refreshConfigModel.willRefreshTitle
              forState:MJRefreshStateWillRefresh];/// 即将刷新的状态
        [self setTitle:self.refreshConfigModel.noMoreDataTitle
              forState:MJRefreshStateNoMoreData];/// 所有数据加载完毕，没有更多的数据了
    };
}
/**
 MJRefreshStateIdle,   //   普通闲置状态
 MJRefreshStatePulling,   //   松开就可以进行刷新的状态
 MJRefreshStateRefreshing,   //   正在刷新中的状态
 MJRefreshStateWillRefresh,   //   即将刷新的状态
 MJRefreshStateNoMoreData   //   所有数据加载完毕，没有更多的数据了
 */
- (void)setState:(MJRefreshState)state{
    MJRefreshCheckState;
    switch (state) {
        /// 刷新完毕
        case MJRefreshStateIdle:
            [self.animationView stop];
            break;
        /// 下拉达到可触发刷新
        case MJRefreshStatePulling:
            [self.animationView play];
            break;
        /// 松手可以刷新
        case MJRefreshStateRefreshing:
            [self.animationView play];
            break;
        /// 处理 MJRefreshStateWillRefresh 分支
        case MJRefreshStateWillRefresh:
            break;
        /// 处理 MJRefreshStateNoMoreData 分支
        case MJRefreshStateNoMoreData:
            break;
        /// 未匹配已知分支时执行兜底处理
        default:
            break;
    }
}

- (void)beginRefreshing{
    [super beginRefreshing];
    if (self.objBlock) self.objBlock(@(RefreshingType_BeginRefreshing));
}
-(jobsByVoidBlock _Nonnull)jobsBeginRefreshing{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self beginRefreshing];
    };
}

- (void)endRefreshing{
    [super endRefreshing];
    if (self.objBlock) self.objBlock(@(RefreshingType_EndRefreshing));
}
-(jobsByVoidBlock _Nonnull)jobsEndRefreshing{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self endRefreshing];
    };
}
#pragma mark —— lazyLoad
- (LOTAnimationView *)animationView{
    if (!_animationView) {
        NSString *filePaths = JobsBundleImagePath(nil,
                                                   @"JsonRes",
                                                   nil,
                                                   @"下拉刷新.json");
        _animationView = [LOTAnimationView animationWithFilePath:filePaths];
        _animationView.byLoopAnimation(YES);
        _animationView.bySizer(self.lOTAnimationViewSize);
        [self addSubview:_animationView];
    };return _animationView;
}

-(CGSize)lOTAnimationViewSize{
    if (jobsZeroSizeValue(_lOTAnimationViewSize)) {
        _lOTAnimationViewSize = CGSizeMake(30, 30);
    };return _lOTAnimationViewSize;
}

-(MJRefreshConfigModel *)refreshConfigModel{
    if (!_refreshConfigModel) {
        _refreshConfigModel = MJRefreshConfigModel.new;
    };return _refreshConfigModel;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN LOTAnimationView
@implementation LOTAnimationView (JobsLocalPropertyDSLAutogen_14f9cade7b)
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byMj_x{
    @jobs_weakify(self)
    return ^__kindof LOTAnimationView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setMj_x:data];
        return self;
    };
}

-(JobsRetLOTAnimationViewByCGSizeBlock _Nonnull)bySizer{
    @jobs_weakify(self)
    return ^__kindof LOTAnimationView * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setSizer:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END LOTAnimationView
