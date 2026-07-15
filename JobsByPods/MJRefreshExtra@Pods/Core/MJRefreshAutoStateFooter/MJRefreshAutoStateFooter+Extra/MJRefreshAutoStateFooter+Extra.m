//
//  MJRefreshAutoStateFooter+Extra.m
//  MJRefreshExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MJRefreshAutoStateFooter+Extra.h"

static inline void MJRefreshExtraApplyStateTitles(MJRefreshAutoStateFooter *view, MJRefreshConfigModel *config) {
    if (!config) return;
    [view setTitle:config.stateIdleTitle forState:MJRefreshStateIdle];
    [view setTitle:config.pullingTitle forState:MJRefreshStatePulling];
    [view setTitle:config.refreshingTitle forState:MJRefreshStateRefreshing];
    [view setTitle:config.willRefreshTitle forState:MJRefreshStateWillRefresh];
    [view setTitle:config.noMoreDataTitle forState:MJRefreshStateNoMoreData];
}

static inline void MJRefreshExtraApplyStateLabelStyle(UILabel *label, MJRefreshConfigModel *config) {
    if (!config) return;
    if (config.font) label.byFont(config.font);
    if (config.textColor) label.byTextCor(config.textColor);
}

static inline void MJRefreshExtraFeedbackIfNeeded(MJRefreshConfigModel *config) {
    if (!config.isShake) return;
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [generator prepare];
        [generator impactOccurred];
    }
}

@implementation MJRefreshAutoStateFooter (Extra)
-(JobsRetMJRefreshAutoStateFooterByRefreshConfigModelBlock _Nonnull)byMJRefreshFooterConfigModel{
    @jobs_weakify(self)
    return ^__kindof MJRefreshAutoStateFooter *_Nullable(MJRefreshConfigModel *_Nullable config){
        @jobs_strongify(self)
        MJRefreshExtraApplyStateTitles(self, config);/// 文字
        MJRefreshExtraApplyStateLabelStyle(self.stateLabel, config);/// 字体和颜色
        self.automaticallyChangeAlpha = config.automaticallyChangeAlpha;
        MJRefreshExtraFeedbackIfNeeded(config);/// 震动特效反馈
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateIdleByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateIdle];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStatePullingByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStatePulling];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateRefreshingByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateRefreshing];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateWillRefreshByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateWillRefresh];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateNoMoreDataByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateNoMoreData];
        return self;
    };
}

@end
