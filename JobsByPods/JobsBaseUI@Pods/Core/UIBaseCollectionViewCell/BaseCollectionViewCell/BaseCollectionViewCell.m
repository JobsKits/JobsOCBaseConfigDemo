//
//  BaseCollectionViewCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseCollectionViewCell.h"

#import <JobsBaseUI/CALayer+Extra.h>
#import <JobsBaseUI/UICollectionView+JobsRegisterClass.h>

@interface BaseCollectionViewCell ()

@end

@implementation BaseCollectionViewCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— 复写父类相关方法和属性
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    };return self;
}

- (void)drawRect:(CGRect)rect {
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseCollectionViewCell.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)setSelected:(BOOL)selected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseCollectionViewCell.class, @selector(jobsSetSelected)))(self, @selector(jobsSetSelected));
    if (action) action(selected);
}

-(jobsByBOOLBlock _Nonnull)jobsSetSelected{
    @jobs_weakify(self)
    return ^(BOOL selected){
        @jobs_strongify(self)
        if (!self) return;
        [super setSelected:selected];
    };
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaseCollectionViewCell *cell = JobsRegisterDequeueCollectionViewCell(BaseCollectionViewCell);
    return (BaseCollectionViewCell *)cell
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.byLayer(^(CALayer * _Nullable layer) {
                layer
                    .cornerRadiusBy(JobsWidth(8))
                    .borderWidthBy(JobsWidth(1))
                    .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
                    .masksToBoundsBy(YES);
            });
        })
        .byIndexPath(indexPath)
        .byLayer(^(CALayer * _Nullable layer) {
            layer
                .cornerRadiusBy(JobsWidth(8))
                .borderWidthBy(JobsWidth(1))
                .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
                .masksToBoundsBy(YES);
        });
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(351), JobsWidth(200));
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        return self;
    };
}
#pragma mark —— <UIViewModelProtocol> 协议属性合成set & get方法
@synthesize indexPath = _indexPath;
-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
}

-(NSIndexPath *)indexPath{
    return _indexPath;
}
@synthesize index = _index;
-(NSInteger)index{
    return _index;
}

-(void)setIndex:(NSInteger)index{
    _index = index;
}
#pragma mark —— lazyLoad

@end
