//
//  JobsShootingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsShootingVC.h"

@interface JobsShootingVC ()
/// UI
Prop_strong()UIButton *cameraBtn;
Prop_strong()UIButton *photoAlbumBtn;
/// Data
Prop_strong()NSMutableArray <UIImage *>*photosImageMutArr;

@end

@implementation JobsShootingVC
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
            data
                .byTextCor(JobsLabelColor)
                .byText(data.attributedTitle.string)
                .byFont(UIFontWeightSemiboldSize(17));
        })
        .byBgCor(HEXCOLOR(0xF6F8FC))
        .byNavBgCor(JobsWhiteColor);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.cameraBtn.byAlpha(1);
    self.photoAlbumBtn.byAlpha(1);
    self.imageView.byAlpha(1);
}
#pragma mark —— 一些私有方法
/// 选取最后一张你选的图，作为显示
-(void)getImageFromResource:(NSArray <HXPhotoModel *>*)resource{
//    @jobs_weakify(self)
}
#pragma mark —— lazyLoad
-(UIButton *)cameraBtn{
    if(!_cameraBtn){
        @jobs_weakify(self)
        _cameraBtn = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(HEXCOLOR(0x2563EB))
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(JobsWidth(15)))
            .jobsResetBtnTitle(@"调取系统相机".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsLog(@"");
                /// 调取系统相机
                self.objBlock = ^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIImage.class]) {
                        self.imageView.byImage((UIImage *)data);
                    }
                };
                self.invokeSysCamera();
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .byCornerRadius(JobsWidth(24))
            .byClipsToBounds(YES)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(48));
                make.left.equalTo(self.view).offset(JobsWidth(24));
                make.right.equalTo(self.view.mas_centerX).offset(JobsWidth(-7));
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(42));
            });
    };return _cameraBtn;
}

-(UIButton *)photoAlbumBtn{
    if(!_photoAlbumBtn){
        @jobs_weakify(self)
        _photoAlbumBtn = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0x1D4ED8))
            .jobsResetBtnBgCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(JobsWidth(15)))
            .jobsResetBtnTitle(@"调取系统相册".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsLog(@"");
                /// 调取系统相册
                @jobs_weakify(self)
                [self hx_invokeSysPhotoAlbumSuccessBlock:^(HXPhotoPickerModel *data) {
                    self.photoManager = data.photoManager;
                    [data.photoList hx_requestImageWithOriginal:NO
                                                     completion:^(NSArray<UIImage *> * _Nullable imageArray,
                                                                  NSArray<HXPhotoModel *> * _Nullable errorArray) {
                        @jobs_strongify(self)
                        self.photosImageMutArr = [NSMutableArray arrayWithArray:imageArray];
                        self.imageView.byImage((UIImage *)self.photosImageMutArr.lastObject);/// 永远值显示最后选择的图
                    }];
                } failBlock:^(HXPhotoPickerModel *data) {
    //                @jobs_strongify(self)
                }];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .jobsResetBtnLayerBorderCor(HEXCOLOR(0xBFDBFE))
            .jobsResetBtnLayerBorderWidth(JobsWidth(1))
            .byCornerRadius(JobsWidth(24))
            .byClipsToBounds(YES)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(48));
                make.left.equalTo(self.view.mas_centerX).offset(JobsWidth(7));
                make.right.equalTo(self.view).offset(JobsWidth(-24));
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(42));
            });
    };return _photoAlbumBtn;
}
@synthesize imageView = _imageView;
-(UIImageView *)imageView{
    if(!_imageView){
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(@"选择资源➕".img)
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byBgColor(HEXCOLOR(0xEEF4FF))
                .byCornerRadius(JobsWidth(24))
                .byClipsToBounds(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(JobsWidth(-24));
                    make.top.equalTo(self.cameraBtn.mas_bottom).offset(JobsWidth(32));
                    make.height.equalTo(imageView.mas_width).multipliedBy(0.86);
                });
        });
    };return _imageView;
}

@end
