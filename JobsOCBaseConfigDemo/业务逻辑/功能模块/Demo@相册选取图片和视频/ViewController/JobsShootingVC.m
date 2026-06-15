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
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(16));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //        self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.byBgColor(JobsWhiteColor);
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
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsGreenColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"调取系统相机".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsLog(@"");
                /// 调取系统相机
                [self hx_invokeSysCameraSuccessBlock:^(HXPhotoPickerModel *data) {
                    @jobs_strongify(self)
                    self.imageView.image = data.photoModel.previewPhoto;
                } failBlock:^(HXPhotoPickerModel *data) {
                    @jobs_strongify(self)
                }];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(50));
                make.left.equalTo(self.view).offset(JobsWidth(20));
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(100));
            });
    };return _cameraBtn;
}

-(UIButton *)photoAlbumBtn{
    if(!_photoAlbumBtn){
        @jobs_weakify(self)
        _photoAlbumBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsBlueColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"调取系统相机".tr)
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
                        self.imageView.image = (UIImage *)self.photosImageMutArr.lastObject;/// 永远值显示最后选择的图
                    }];
                } failBlock:^(HXPhotoPickerModel *data) {
    //                @jobs_strongify(self)
                }];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(50));
                make.right.equalTo(self.view).offset(JobsWidth(-20));
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(100));
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
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(200)));
                    make.centerX.equalTo(self.view);
                    make.top.equalTo(self.photoAlbumBtn.mas_bottom).offset(JobsWidth(50));
                });
        });
    };return _imageView;
}

@end
