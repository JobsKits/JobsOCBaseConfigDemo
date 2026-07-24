//
//  UICollectionView+EmptyData.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionView+EmptyData.h"

JobsKey(JobsCollectionViewEmptyDataReloadingKey)
@implementation UICollectionView (EmptyData)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(UICollectionView.class, @selector(reloadData));
        Method swizzledMethod = class_getInstanceMethod(UICollectionView.class, @selector(jobsReloadData));
        if (originalMethod && swizzledMethod) {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

-(void)jobsReloadData{
    if ([Jobs_getAssociatedObject(JobsCollectionViewEmptyDataReloadingKey) boolValue]) return;
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsCollectionViewEmptyDataReloadingKey, @YES)
    [self jobsReloadData];
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsCollectionViewEmptyDataReloadingKey, @NO)
    switch (self.jobsEmptyViewType) {
        /// 处理 JobsEmptyViewTypeLabel 分支
        case JobsEmptyViewTypeLabel:{
            self.showEmptyLabelBy(self.textModelEmptyData);
        }break;
        /// 处理 JobsEmptyViewTypeButton 分支
        case JobsEmptyViewTypeButton:{
            self.showEmptyButtonBy(self.buttonModelEmptyData);
        }break;
        /// 处理 JobsEmptyViewTypeCustomView 分支
        case JobsEmptyViewTypeCustomView:{
            self.showEmptyViewBy(self.emptyDataView);
        }break;
        /// 未匹配已知分支时执行兜底处理
        default:break;
    }
}
#pragma mark —— 一些私有方法
-(BOOL)hasData{
    NSInteger numberOfSections = self.numberOfSections;
    BOOL hasData = NO;
    for (NSInteger section = 0; section < numberOfSections; section++) {
        if ([self numberOfItemsInSection:section] > 0) {
            hasData = YES;
            break;
        }
    };return hasData;
}

-(JobsRetViewByViewBlock _Nonnull)showEmptyViewBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *view){
        @jobs_strongify(self)
        if(self.hasData){
            self.cleanSubviewBy(UIView.class);
            return self;
        }else{
            self.cleanSubviewBy(UIView.class);
            view.byFrame(self.bounds);
            self.addSubview(view);
            return self;
        }
    };
}

-(JobsRetViewByButtonModelBlock _Nonnull)showEmptyButtonBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIButtonModel *model){
        @jobs_strongify(self)
        if(self.hasData){
            self.cleanSubviewBy(UIView.class);
            return self;
        }else{
            jobsMakeBaseView(^(__kindof BaseView *_Nullable view) {
                @jobs_strongify(self)
                view.byFrame(self.bounds);
                self.cleanSubviewBy(UIView.class);
                self.addSubview(view);
                view.addSubview(UIButton.initByButtonModel(model ? : jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.byTitle(@"No Datas".tr)
                        .byTitleCor(JobsWhiteColor)
                        .byTitleFont(bayonRegular(JobsWidth(30)))
                        .byNormalImage(@"暂无数据".img)
                        .byBaseBackgroundColor(JobsClearColor.colorWithAlphaComponentBy(0));
                })).setMasonryBy(^(MASConstraintMaker *make){
                    @jobs_strongify(self)
                    make.centerX.equalTo(self).offset(model.jobsOffsetX);
                    make.centerY.equalTo(self).offset(model.jobsOffsetY);
                    make.width.equalTo(self);
                }));
            });
            return self;
        }
    };
}

-(JobsRetViewByTextModelBlock _Nonnull)showEmptyLabelBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UITextModel *model){
        @jobs_strongify(self)
        if(self.hasData){
            self.cleanSubviewBy(UIView.class);
            return self;
        }else{
            jobsMakeBaseView(^(__kindof BaseView *_Nullable view) {
                @jobs_strongify(self)
                view.byFrame(self.bounds);
                self.cleanSubviewBy(UIView.class);
                self.addSubview(view);
                jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                    label
                        .byTextAlignment(model.textAlignment ? : NSTextAlignmentCenter)
                        .byTextCor(model.textCor ? : JobsRedColor)
                        .byText(isValue(model.text) ? model.text : @"No Datas".tr)
                        .makeLabelByShowingType(UILabelShowingType_05)
                        .addOn(view)
                        .byAdd(^(MASConstraintMaker *make){
                            @jobs_strongify(self)
                            make.center.equalTo(self);
                            make.width.equalTo(self);
                        });
                });
            });
            return self;
        }
    };
}

@end
