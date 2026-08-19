//
//  FMGameCVCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FMGameCVCell.h"

@interface FMGameCVCell ()

Prop_strong()GoodsClassModel *goodsClsModel;
Prop_assign(class)SourceType sourceType;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN FMGameCVCell
@interface FMGameCVCell (JobsPropertyDSLSetterAutogen_1b05ab0d16)
+(void)setSourceType:(SourceType)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END FMGameCVCell

@implementation FMGameCVCell
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FMGameCVCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FMGameCVCell.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    JobsRetViewModelByVoidBlock action = ((JobsRetViewModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FMGameCVCell.class, @selector(jobsGetViewModel)))(self, @selector(jobsGetViewModel));
    return action ? action() : nil;
}

-(JobsRetViewModelByVoidBlock _Nonnull)jobsGetViewModel{
    @jobs_weakify(self)
    return ^UIViewModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.viewModel;
    };
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    FMGameCVCell *cell = JobsRegisterDequeueCollectionViewCell(FMGameCVCell);
    return (FMGameCVCell *)cell
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.layerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                model.byMasksToBounds(YES)
                     .byLayerCor(RGBA_COLOR(255, 225, 144, 1))
                     .byJobsWidth(JobsWidth(1))
                     .byCornerRadiusValue(JobsWidth(8));
            }));
        })
        .byIndexPath(indexPath)
        .byLayer(^(CALayer * _Nullable layer) {
            layer
                .cornerRadiusBy(JobsWidth(15))
                .borderWidthBy(JobsWidth(1))
                .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
                .masksToBoundsBy(YES);
        });
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        if([model isKindOfClass:UIViewModel.class]){
            self.byViewModel(model);
            self.button.jobsResetBtnImage(self.viewModel.image);
            self.button.jobsResetBtnTitle(self.viewModel.text);
            self.imageView.byImage(self.viewModel.bgImage);
            self.imageView
                    .imageURL(self.viewModel.imageUrl)
                    .placeholderImage(self.viewModel.bgImage)
                    .options(self.jobsMakeSDWebImageOptions())
                    .completed(^(UIImage * _Nullable image,
                                 NSError * _Nullable error,
                                 SDImageCacheType cacheType,
                                 NSURL * _Nullable imageURL) {
                        if (error) {
                            JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                        } else {
                            JobsLog(@"图片加载成功");
                        }
                    }).load();
        }
        if([model isKindOfClass:GoodsClassModel.class]){
            self.goodsClsModel = model;
            self.button.jobsResetBtnImage(self.goodsClsModel.image);
            self.button.jobsResetBtnTitle(self.goodsClsModel.text);
            self.imageView
                    .imageURL(self.goodsClsModel.imageUrl)
                    .placeholderImage(self.goodsClsModel.bgImage)
                    .options(self.jobsMakeSDWebImageOptions())
                    .completed(^(UIImage * _Nullable image,
                                 NSError * _Nullable error,
                                 SDImageCacheType cacheType,
                                 NSURL * _Nullable imageURL) {
                        if (error) {
                            JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                        } else {
                            JobsLog(@"图片加载成功");
                        }
                    }).load();
        };return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    @jobs_weakify(self)
    return ^CGSize(NSNumber *_Nullable data){
        @jobs_strongify(self)
        FMGameCVCell.bySourceType(data.integerValue);
        switch (self.sourceType) {
            /// 来自首页
            case SourceType_Home:
                return CGSizeMake(JobsWidth(88), JobsWidth(123));
                break;
            /// 来自收藏
            case SourceType_Favorite:
                return CGSizeMake(JobsWidth(108), JobsWidth(142));
                break;
            /// 未匹配已知分支时执行兜底处理
            default:
                return CGSizeZero;
                break;
        }
    };
}
@dynamic sourceType;
static SourceType _sourceType;
+(SourceType)sourceType{
    return _sourceType;
}

+(void)setSourceType:(SourceType)type {
    _sourceType = type;
}
#pragma mark —— lazyLoad
@synthesize imageView = _imageView;
-(__kindof UIImageView *)imageView{
    if(!_imageView){
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.addOn(self.contentView).byAdd(^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self.contentView);
                switch (FMGameCVCell.sourceType) {
                    /// 来自首页
                    case SourceType_Home:
                        make.height.mas_equalTo(JobsWidth(88));
                        break;
                    /// 来自收藏
                    case SourceType_Favorite:
                        make.height.mas_equalTo(JobsWidth(108));
                        break;
                    /// 未匹配已知分支时执行兜底处理
                    default:
                        make.height.mas_equalTo(JobsWidth(0));
                        break;
                }
            });
        });
    };return _imageView;
}
@synthesize button = _button;
-(__kindof UIButton *)button{
    if(!_button){
        _button = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
//            .jobsResetBtnImage(self.viewModel.image)
            .jobsResetBtnBgCor(@"#FF0000".jobsCor())
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(bayonRegular(JobsWidth(12)))
//            .jobsResetBtnTitle(self.viewModel.text)
            .onClickBy(^(UIButton *x){
                JobsLog(@"");
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.contentView).byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(33));
                make.bottom.left.right.equalTo(self.contentView);
            });
    };return _button;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN FMGameCVCell
+(JobsRetFMGameCVCellBySourceTypeBlock _Nonnull)bySourceType{
    @jobs_weakify(self)
    return ^Class _Nullable(SourceType data){
        @jobs_strongify(self)
        [self setSourceType:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END FMGameCVCell
@end
