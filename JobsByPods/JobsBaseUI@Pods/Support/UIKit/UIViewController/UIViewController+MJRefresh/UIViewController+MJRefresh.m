//
//  UIViewController+MJRefresh.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+MJRefresh.h"

@implementation UIViewController (MJRefresh)
/*
 * 相关继承关系图谱 4个header + 9个Footer ;已经实现的👌
    MJRefreshGifHeader  👌 ->MJRefreshStateHeader->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshNormalHeader 👌->MJRefreshStateHeader->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshStateHeader 👌->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshHeader 👌->MJRefreshComponent->UIView
 
    MJRefreshAutoGifFooter  👌 ->MJRefreshAutoStateFooter->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoNormalFooter  👌 ->MJRefreshAutoStateFooter->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoStateFooter ->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoFooter ->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackGifFooter ->MJRefreshBackStateFooter->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackNormalFooter  👌 ->MJRefreshBackStateFooter->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackStateFooter ->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackFooter ->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshFooter->MJRefreshComponent->UIView
 *
 */
#pragma mark —— BaseViewProtocol
///KVO 监听 MJRefresh + 震动特效反馈
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    if ([object isEqual:self.mjRefreshGifHeader] &&
        self.mjRefreshGifHeader.state == MJRefreshStatePulling) {
        NSObject.feedbackGenerator(nil);
    }else if (([object isEqual:self.mjRefreshAutoGifFooter] ||
               [object isEqual:self.mjRefreshBackNormalFooter] ||
               [object isEqual:self.mjRefreshAutoNormalFooter]) && (self.mjRefreshAutoGifFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshBackNormalFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshAutoNormalFooter.state == MJRefreshStatePulling)
             ) {
        NSObject.feedbackGenerator(nil);
    }else{}
}
#pragma mark —— Prop_strong()MJRefreshConfigModel *refreshConfigHeader;//头部的配置信息
JobsKey(_refreshConfigHeader)
@dynamic refreshConfigHeader;
-(MJRefreshConfigModel *)refreshConfigHeader{
    MJRefreshConfigModel *RefreshConfigHeader = Jobs_getAssociatedObject(_refreshConfigHeader);
    if (!RefreshConfigHeader) {
        RefreshConfigHeader = MJRefreshConfigModel.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigHeader, RefreshConfigHeader)
    }return RefreshConfigHeader;
}

-(void)setRefreshConfigHeader:(MJRefreshConfigModel *)refreshConfigHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigHeader, refreshConfigHeader)
}
#pragma mark —— Prop_strong()MJRefreshConfigModel *refreshConfigFooter;//尾部的配置信息
JobsKey(_refreshConfigFooter)
@dynamic refreshConfigFooter;
-(MJRefreshConfigModel *)refreshConfigFooter{
    MJRefreshConfigModel *RefreshConfigFooter = Jobs_getAssociatedObject(_refreshConfigFooter);
    if (!RefreshConfigFooter) {
        RefreshConfigFooter = MJRefreshConfigModel.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigFooter, RefreshConfigFooter)
    }return RefreshConfigFooter;
}

-(void)setRefreshConfigFooter:(MJRefreshConfigModel *)refreshConfigFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigFooter, refreshConfigFooter)
}
/**
 MJRefreshStateIdle,   //   普通闲置状态
 MJRefreshStatePulling,   //   松开就可以进行刷新的状态
 MJRefreshStateRefreshing,   //   正在刷新中的状态
 MJRefreshStateWillRefresh,   //   即将刷新的状态
 MJRefreshStateNoMoreData   //   所有数据加载完毕，没有更多的数据了
 */
#pragma mark —— MJRefreshHeader
#pragma mark —— Prop_strong()LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader;
JobsKey(_lotAnimMJRefreshHeader)
@dynamic lotAnimMJRefreshHeader;
-(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader = Jobs_getAssociatedObject(_lotAnimMJRefreshHeader);
    if (!lotAnimMJRefreshHeader) {
        lotAnimMJRefreshHeader = self.view.LOTAnimationMJRefreshHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_lotAnimMJRefreshHeader, lotAnimMJRefreshHeader)
    }return lotAnimMJRefreshHeader;
}

-(void)setLotAnimMJRefreshHeader:(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lotAnimMJRefreshHeader, lotAnimMJRefreshHeader)
}
#pragma mark —— Prop_strong()MJRefreshNormalHeader *mjRefreshNormalHeader;
JobsKey(_mjRefreshNormalHeader)
@dynamic mjRefreshNormalHeader;
-(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    MJRefreshNormalHeader *MjRefreshNormalHeader = Jobs_getAssociatedObject(_mjRefreshNormalHeader);
    if (!MjRefreshNormalHeader) {
        MjRefreshNormalHeader = self.view.MJRefreshNormalHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshNormalHeader, MjRefreshNormalHeader);
    }return MjRefreshNormalHeader;
}

-(void)setMjRefreshNormalHeader:(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshNormalHeader, mjRefreshNormalHeader);
}
#pragma mark —— Prop_strong()MJRefreshStateHeader *mjRefreshStateHeader;
JobsKey(_mjRefreshStateHeader)
@dynamic mjRefreshStateHeader;
-(MJRefreshStateHeader *)mjRefreshStateHeader{
    MJRefreshStateHeader *MjRefreshStateHeader = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshStateHeader) {
        MjRefreshStateHeader = self.view.MJRefreshStateHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshStateHeader, MjRefreshStateHeader)
    }return MjRefreshStateHeader;
}

-(void)setMjRefreshStateHeader:(MJRefreshStateHeader *)mjRefreshStateHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshStateHeader, mjRefreshStateHeader)
}
#pragma mark —— Prop_strong()MJRefreshHeader *mjRefreshHeader;
JobsKey(_mjRefreshHeader)
@dynamic mjRefreshHeader;
-(MJRefreshHeader *)mjRefreshHeader{
    MJRefreshHeader *MjRefreshHeader = Jobs_getAssociatedObject(_mjRefreshHeader);
    if (!MjRefreshHeader) {
        MjRefreshHeader = self.view.MJRefreshHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshHeader, MjRefreshHeader)
    }return MjRefreshHeader;
}

-(void)setMjRefreshHeader:(MJRefreshHeader *)mjRefreshHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshHeader, mjRefreshHeader)
}
#pragma mark —— Prop_strong()MJRefreshGifHeader *mjRefreshGifHeader;
JobsKey(_mjRefreshGifHeader)
@dynamic mjRefreshGifHeader;
-(MJRefreshGifHeader *)mjRefreshGifHeader{
    MJRefreshGifHeader *MjRefreshGifHeader = Jobs_getAssociatedObject(_mjRefreshGifHeader);
    if (!MjRefreshGifHeader) {
        MjRefreshGifHeader = self.view.MJRefreshGifHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshGifHeader, MjRefreshGifHeader)
    }return MjRefreshGifHeader;
}

-(void)setMjRefreshGifHeader:(MJRefreshGifHeader *)mjRefreshGifHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshGifHeader, mjRefreshGifHeader)
}
#pragma mark —— MJRefreshFooter
#pragma mark —— Prop_strong()MJRefreshAutoGifFooter *mjRefreshAutoGifFooter;
JobsKey(_mjRefreshAutoGifFooter)
@dynamic mjRefreshAutoGifFooter;
-(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    MJRefreshAutoGifFooter *MjRefreshAutoGifFooter = Jobs_getAssociatedObject(_mjRefreshAutoGifFooter);
    if (!MjRefreshAutoGifFooter) {
        MjRefreshAutoGifFooter = self.view.MJRefreshAutoGifFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoGifFooter, MjRefreshAutoGifFooter)
    }return MjRefreshAutoGifFooter;
}

-(void)setMjRefreshAutoGifFooter:(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoGifFooter, mjRefreshAutoGifFooter)
}
#pragma mark —— Prop_strong()MJRefreshBackNormalFooter *mjRefreshBackNormalFooter;
JobsKey(_mjRefreshBackNormalFooter)
@dynamic mjRefreshBackNormalFooter;
-(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    MJRefreshBackNormalFooter *MjRefreshBackNormalFooter = Jobs_getAssociatedObject(_mjRefreshBackNormalFooter);
    if (!MjRefreshBackNormalFooter) {
        MjRefreshBackNormalFooter = self.view.MJRefreshBackNormalFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackNormalFooter, MjRefreshBackNormalFooter)
    }return MjRefreshBackNormalFooter;
}

-(void)setMjRefreshBackNormalFooter:(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackNormalFooter, mjRefreshBackNormalFooter)
}
#pragma mark —— Prop_strong()MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter;
JobsKey(_mjRefreshAutoNormalFooter)
@dynamic mjRefreshAutoNormalFooter;
-(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    MJRefreshAutoNormalFooter *MjRefreshAutoNormalFooter = Jobs_getAssociatedObject(_mjRefreshAutoNormalFooter);
    if (!MjRefreshAutoNormalFooter) {
        MjRefreshAutoNormalFooter = self.view.MJRefreshAutoNormalFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoNormalFooter, MjRefreshAutoNormalFooter)
    }return MjRefreshAutoNormalFooter;
}

-(void)setMjRefreshAutoNormalFooter:(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoNormalFooter, mjRefreshAutoNormalFooter)
}
#pragma mark —— Prop_strong()MJRefreshAutoStateFooter *mjRefreshAutoStateFooter;
JobsKey(_mjRefreshAutoStateFooter)
@dynamic mjRefreshAutoStateFooter;
-(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    MJRefreshAutoStateFooter *MjRefreshAutoStateFooter = Jobs_getAssociatedObject(_mjRefreshAutoStateFooter);
    if (!MjRefreshAutoStateFooter) {
        MjRefreshAutoStateFooter = self.view.MJRefreshAutoStateFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoStateFooter, MjRefreshAutoStateFooter)
    }return MjRefreshAutoStateFooter;
}

-(void)setMjRefreshAutoStateFooter:(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoStateFooter, mjRefreshAutoStateFooter)
}
#pragma mark —— Prop_strong()MJRefreshAutoFooter *mjRefreshAutoFooter;
JobsKey(_mjRefreshAutoFooter)
@dynamic mjRefreshAutoFooter;
-(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    MJRefreshAutoFooter *MjRefreshAutoFooter = Jobs_getAssociatedObject(_mjRefreshAutoFooter);
    if (!MjRefreshAutoFooter) {
        MjRefreshAutoFooter = self.view.MJRefreshAutoFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoFooter, MjRefreshAutoFooter)
    }return MjRefreshAutoFooter;
}

-(void)setMjRefreshAutoFooter:(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoFooter, mjRefreshAutoFooter)
}
#pragma mark —— Prop_strong()MJRefreshBackGifFooter *mjRefreshBackGifFooter;
JobsKey(_mjRefreshBackGifFooter)
@dynamic mjRefreshBackGifFooter;
-(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    MJRefreshBackGifFooter *MjRefreshBackGifFooter = Jobs_getAssociatedObject(_mjRefreshBackGifFooter);
    if (!MjRefreshBackGifFooter) {
        MjRefreshBackGifFooter = self.view.MJRefreshBackGifFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackGifFooter, MjRefreshBackGifFooter)
    }return MjRefreshBackGifFooter;
}

-(void)setMjRefreshBackGifFooter:(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackGifFooter, mjRefreshBackGifFooter)
}
#pragma mark —— Prop_strong()MJRefreshBackStateFooter *mjRefreshBackStateFooter;
JobsKey(_mjRefreshBackStateFooter)
@dynamic mjRefreshBackStateFooter;
-(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    MJRefreshBackStateFooter *MjRefreshBackStateFooter = Jobs_getAssociatedObject(_mjRefreshBackStateFooter);
    if (!MjRefreshBackStateFooter) {
        MjRefreshBackStateFooter = self.view.MJRefreshBackStateFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackStateFooter, MjRefreshBackStateFooter)
    }return MjRefreshBackStateFooter;
}

-(void)setMjRefreshBackStateFooter:(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackStateFooter, mjRefreshBackStateFooter)
}
#pragma mark —— Prop_strong()MJRefreshBackFooter *mjRefreshBackFooter;
JobsKey(_mjRefreshBackFooter)
@dynamic mjRefreshBackFooter;
-(MJRefreshBackFooter *)mjRefreshBackFooter{
    MJRefreshBackFooter *MjRefreshBackFooter = Jobs_getAssociatedObject(_mjRefreshBackFooter);
    if (!MjRefreshBackFooter) {
        MjRefreshBackFooter = self.view.MJRefreshBackFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackFooter, MjRefreshBackFooter)
    }return MjRefreshBackFooter;
}

-(void)setMjRefreshBackFooter:(MJRefreshBackFooter *)mjRefreshBackFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackFooter, mjRefreshBackFooter)
}
#pragma mark —— Prop_strong()MJRefreshFooter *mjRefreshFooter;
JobsKey(_mjRefreshFooter)
@dynamic mjRefreshFooter;
-(MJRefreshFooter *)mjRefreshFooter{
    MJRefreshFooter *MjRefreshFooter = Jobs_getAssociatedObject(_mjRefreshFooter);
    if (!MjRefreshFooter) {
        MjRefreshFooter = self.view.MJRefreshFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshFooter, MjRefreshFooter)
    }return MjRefreshFooter;
}

-(void)setMjRefreshFooter:(MJRefreshFooter *)mjRefreshFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshFooter, mjRefreshFooter)
}

@end
