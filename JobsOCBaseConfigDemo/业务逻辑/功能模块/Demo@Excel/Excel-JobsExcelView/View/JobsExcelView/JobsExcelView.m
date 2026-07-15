//
//  JobsExcelView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsExcelView.h"

@interface JobsExcelView()
/// UI
Prop_strong()BaseButton *titleBtn;
Prop_strong()JobsExcelLeftListView *leftListView;
Prop_strong()JobsExcelTopHeadView *headView;
Prop_strong()JobsExcelContentView *contentView;
Prop_strong()UIImageView *bgImageView;
/// Data
Prop_strong()JobsExcelConfigureViewModel *excelConfigureDatas;

@end

@implementation JobsExcelView{
    CGFloat itemW;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetViewByIDBlock _Nonnull)JobsRichViewByModel{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(JobsExcelConfigureViewModel *_Nullable data){
        @jobs_strongify(self)
        self.jobsRichViewByModel(data);
        return self;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable data) {
        @jobs_strongify(self)
        if(data) self.excelConfigureDatas = data;
        self->itemW = self.excelConfigureDatas.itemW;
        self.bgImageView.byAlpha(1);
        self.titleBtn.byAlpha(1);
        self.headView.byAlpha(1);
        self.leftListView.byAlpha(1);
        self.contentView.byAlpha(1);
    };
}

-(jobsByIDBlock _Nonnull)update{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable data) {
        @jobs_strongify(self)
        self.headView.jobsRichViewByModel(data);
        self.leftListView.jobsRichViewByModel(data);
        self.contentView.jobsRichViewByModel(data);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsRealWidth() - JobsWidth(100), JobsRealHeight() / 2);
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if(!_bgImageView){
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView *_Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(@"投注记录".img)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self);
                    make.left.equalTo(self);
                    make.width.mas_equalTo(self->itemW);
                    make.height.mas_equalTo(self.excelConfigureDatas.itemH);
                });
        });
    };return _bgImageView;
}

-(BaseButton *)titleBtn{
    if(!_titleBtn){
        @jobs_weakify(self)
        _titleBtn = BaseButton
            .initByButtonModel(self.excelConfigureDatas.data_00)
            .addOn(self.bgImageView)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.equalTo(self);
                make.left.equalTo(self);
                make.width.mas_equalTo(self->itemW);
                make.height.mas_equalTo(self.excelConfigureDatas.itemH);
            });
    };return _titleBtn;
}

- (JobsExcelLeftListView *)leftListView{
    if (!_leftListView) {
        @jobs_weakify(self)
        _leftListView = JobsExcelLeftListView.new;
        _leftListView
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleBtn.mas_bottom).offset(0);
                make.left.equalTo(self);
                make.width.mas_equalTo(self->itemW);
                make.bottom.equalTo(self);
            });
        _leftListView.jobsRichViewByModel(self.excelConfigureDatas);
        // 取消之前的订阅，避免多次重复订阅
        _leftListView.racDisposable.byDispose();
        _leftListView.byRacDisposable(
            RACObserve(_leftListView.excelConfigureData, VerticalScrollValue)
                .bySubscribeNext(^(id value) {
                    @jobs_strongify(self)
                    if (!self) return;
                    NSValue *scrollValue = (NSValue *)value;
                    self.contentView.tableView.contentOffset = scrollValue.CGPointValue;
                })
        );
    };return _leftListView;
}

-(JobsExcelTopHeadView *)headView{
    if (!_headView) {
        @jobs_weakify(self)
        _headView = JobsExcelTopHeadView.new;
        _headView
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleBtn);
                make.left.equalTo(self.titleBtn.mas_right).offset(0);
                make.right.equalTo(self);
                make.height.equalTo(self.titleBtn);
            });
        _headView.jobsRichViewByModel(self.excelConfigureDatas);
        // 取消之前的订阅，避免多次重复订阅
        _headView.racDisposable.byDispose();
        _headView.byRacDisposable(
            RACObserve(_headView.excelConfigureData, HorizontalScrollValue)
                .bySubscribeNext(^(id value) {
                    @jobs_strongify(self)
                    if (!self) return;
                    NSValue *scrollValue = (NSValue *)value;
                    self.contentView.configureContentOffSet(scrollValue.CGPointValue);
                })
        );
    };return _headView;
}

-(JobsExcelContentView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = JobsExcelContentView.new;
        _contentView
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.leftListView);
                make.left.equalTo(self.headView);
                make.right.equalTo(self);
                make.bottom.equalTo(self);
            });
        _contentView.jobsRichViewByModel(self.excelConfigureDatas);
        // 取消之前的订阅，避免多次重复订阅
        _contentView.racDisposable.byDispose();
        _contentView.byRacDisposable(
            RACCompoundDisposable.new
                .byAddDisposable(
                    _contentView.excelConfigureData.verticalScrollSignal
                        .bySubscribeNext(^(id value) {
                            @jobs_strongify(self)
                            if (!self) return;
                            NSValue *scrollValue = (NSValue *)value;
                            self.leftListView.tableView.contentOffset = scrollValue.CGPointValue;
                        })
                )
                .byAddDisposable(
                    _contentView.excelConfigureData.horizontalScrollSignal
                        .bySubscribeNext(^(id value) {
                            @jobs_strongify(self)
                            if (!self) return;
                            NSValue *scrollValue = (NSValue *)value;
                            self.headView.collectionView.contentOffset = scrollValue.CGPointValue;
                        })
                )
        );
    };return _contentView;
}

-(JobsExcelConfigureViewModel *)excelConfigureDatas{
    if(!_excelConfigureDatas){
        _excelConfigureDatas = jobsMakeExcelConfigureViewModel(^(JobsExcelConfigureViewModel * _Nullable data) {
        });
    };return _excelConfigureDatas;
}

@end

