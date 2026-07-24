//
//  PicToStrStoreSubVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PicToStrStoreSubVC.h"

@interface PicToStrStoreSubVC (){
    UIImage *_picBefore;
    UIImage *_picAfter;
    NSString *_resultStr;// 最原始的图片编码字符串
    NSString *_showStr;  // 对外显示的字符串
}
/// UI
Prop_strong()BaseButton *btn_1;
Prop_strong()BaseButton *btn_2;
Prop_strong()NSMutableArray <NSString *>*richTextMutArr;
Prop_strong()NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
/// Data
Prop_strong()NSMutableArray <UIImage *>*photosImageMutArr;

@end

@implementation PicToStrStoreSubVC
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
            data.byFont(UIFontWeightRegularSize(18));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
    _picBefore = nil;
    _picAfter = nil;
    _resultStr = @"".tr;
    _showStr = @"".tr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsWhiteColor);
    self.makeNavByAlpha(1);
//    [self.bgImageView removeFromSuperview];
    self.btn_1.byAlpha(1);
    self.btn_2.byAlpha(1);
    self.textView.byAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}
/*
 UIImagePNGRepresentation：
 这个方法将UIImage对象转换为PNG格式的NSData对象。
 PNG格式是一种无损压缩格式，因此生成的图像数据保留了原始图像的质量，但文件大小可能会比JPEG格式大。
 PNG格式通常用于需要保留图像透明度、精确颜色和细节的情况，如图标、线条图和图形设计等。

 UIImageJPEGRepresentation：
 这个方法将UIImage对象转换为JPEG格式的NSData对象。
 JPEG格式是一种有损压缩格式，通过牺牲一些图像细节来实现更小的文件大小。
 JPEG格式通常用于照片和图像，因为它可以提供较小的文件大小，而且人眼对于JPEG压缩引起的细节损失不太敏感。
 **/

/*
 在Objective-C中，NSMutableString是可变的字符串类型，而NSString是不可变的字符串类型。
 NSMutableString的copy方法会返回一个不可变的字符串副本，而NSString的copy方法会返回其本身，因为NSString本身就是不可变的。

 在返回字符串时，如果直接返回可变字符串hexString，那么在调用方修改了这个可变字符串，可能会影响到内部的数据。这种行为不太符合设计的期望，因为方法返回的字符串应该是不可变的，以防止意外的修改。
 因此，使用[hexString copy]可以确保返回的是一个不可变的字符串副本，保护了原始数据的安全性，而且调用方可以安心地使用返回的字符串而不必担心意外修改原始数据。

 总之，为了保证代码的健壮性和安全性，将可变对象转换为不可变对象并返回其副本是一种良好的编程实践。
 **/
#pragma mark —— 一些私有方法
/// 输出文字修饰为可对外显示。但是对外还是输出入参字符串
-(JobsRetStrByStrBlock _Nonnull)dataForTextView{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if(data){
    #warning 不可能全部显示完全这个字符串，太长了。渲染到UI会撑爆内存，最终致程序崩溃
            self->_showStr = @"目标图片对应的字符串编码为（只列举一部分）前面几位都是一样的：".tr
                .add([data substringToIndex:1000])
                .add(@"...后面还有很多，就不一一列举了（渲染UI会撑爆内存，最终导致程序崩溃）".tr);
            self.textView.byText(self->_showStr);
        }else @"暂无编码数据！！！".tr.toast();
        return data;
    };
}
/// 输出图片到Btn_1
-(jobsByImageBlock _Nonnull)dataForBtn1ImageView{
    @jobs_weakify(self)
    return ^(UIImage *_Nullable image){
        @jobs_strongify(self)
        if(image){
            self->_picBefore = image;
            self.btn_1.jobsResetBtnImage(self->_picBefore);
        }else @"字符串解码转换失败".tr.toast();
    };
}
/// 输出图片到Btn_2
-(JobsRetImageByImageBlock _Nonnull)dataForBtn2ImageView{
    @jobs_weakify(self)
    return ^__kindof UIImage *_Nonnull(UIImage *_Nullable image){
        @jobs_strongify(self)
        if(image){
            self->_picAfter = image;
            self.btn_2.jobsResetBtnImage(image);
        }else @"字符串解码转换失败".tr.toast();
        return self->_picAfter;
    };
}
#pragma mark —— 图片（图片数据Data）=编码=> 字符串(加盐)
-(JobsRetStrByImageBlock _Nonnull)strForPic{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self )
        NSString *resultStr = @"";
        switch ([self.viewModel.requestParams intValue]) {
            /// 处理 PicToStrStyle_Hexadecimal 分支
            case PicToStrStyle_Hexadecimal:{
                resultStr = self.dataForTextView(self.encodePicStr(data.hexStr));
            }break;
            /// 处理 PicToStrStyle_Base16 分支
            case PicToStrStyle_Base16:{
                resultStr = self.dataForTextView(self.encodePicStr(data.base16Str));
            }break;
            /// 处理 PicToStrStyle_Base32 分支
            case PicToStrStyle_Base32:{
                resultStr = self.dataForTextView(self.encodePicStr(data.base32Str));
            }break;
            /// 处理 PicToStrStyle_Base64 分支
            case PicToStrStyle_Base64:{
                resultStr = self.dataForTextView(self.encodePicStr(data.base64Str));
            }break;
            /// 处理 PicToStrStyle_Base85 分支
            case PicToStrStyle_Base85:{
                resultStr = self.dataForTextView(self.encodePicStr(data.base85Str));
            }break;
            /// 处理 PicToStrStyle_MIME 分支
            case PicToStrStyle_MIME:{
                resultStr = self.dataForTextView(self.encodePicStr(data.MIMEStr));
            }break;
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        };return resultStr;
    };
}
#pragma mark —— 字符串（加盐）=解码=> 图片
-(JobsRetImageByStrBlock _Nonnull)picForStr{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self->_picAfter = nil;
        if(isNull(data)) return nil;
        switch ([self.viewModel.requestParams intValue]) {
            /// 处理 PicToStrStyle_Hexadecimal 分支
            case PicToStrStyle_Hexadecimal:{
                return self.dataForBtn2ImageView(self.decodePicStr(data).imageByHexString);
            }break;
            /// 处理 PicToStrStyle_Base16 分支
            case PicToStrStyle_Base16:{
                return self.dataForBtn2ImageView(self.decodePicStr(data).imageByBase16String);
            }break;
            /// 处理 PicToStrStyle_Base32 分支
            case PicToStrStyle_Base32:{
                return self.dataForBtn2ImageView(self.decodePicStr(data).imageByBase32String);
            }break;
            /// 处理 PicToStrStyle_Base64 分支
            case PicToStrStyle_Base64:{
                return self.dataForBtn2ImageView(self.decodePicStr(data).imageByBase64String);
            }break;
            /// 处理 PicToStrStyle_Base85 分支
            case PicToStrStyle_Base85:{
                return self.dataForBtn2ImageView(self.decodePicStr(data).imageByBase85String);
            }break;
            /// 处理 PicToStrStyle_MIME 分支
            case PicToStrStyle_MIME:{
                return self.dataForBtn2ImageView(self.decodePicStr(data).imageByMIMEString);
            }break;
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        };return self->_picAfter;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)btn_1{
    if(!_btn_1){
        @jobs_weakify(self)
        _btn_1 = BaseButton.jobsInit()
            .bgColorBy(JobsLightGrayColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeNone)
            .jobsResetImagePadding(JobsWidth(10))
            .jobsResetTitlePadding(JobsWidth(10))
            .jobsResetBtnImage(_picBefore ? : JobsLoadBundleImage(@"bundle",@"Others",nil,@"绿色加号"))
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(@"#333333".cor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(25))
            .jobsResetBtnSubTitleFont(UIFontWeightBoldSize(18))
            .jobsResetBtnTitle(@"点击按钮".tr)
            .jobsResetBtnSubTitle(@"选取相册图片".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.bySelected(!x.selected);
                if (self.objBlock) self.objBlock(x);
                /// 调取系统相册
                @jobs_weakify(self)
                [self hx_invokeSysPhotoAlbumSuccessBlock:^(HXPhotoPickerModel *data) {
                    self.photoManager = data.photoManager;
                    [data.photoList hx_requestImageWithOriginal:NO
                                                     completion:^(NSArray<UIImage *> * _Nullable imageArray,
                                                                  NSArray<HXPhotoModel *> * _Nullable errorArray) {
                        @jobs_strongify(self)
                        self.photosImageMutArr = [NSMutableArray arrayWithArray:imageArray];
                        UIImage *image = (UIImage *)self.photosImageMutArr.lastObject;
                        self->_picBefore = image;
                        self.btn_1.jobsResetBtnImage(image);/// 永远值显示最后选择的图
                        self.strForPic(self->_picBefore);
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
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
                make.left.equalTo(self.view).offset(JobsWidth(10));
                make.right.equalTo(self.view).offset(JobsWidth(-10));
                make.height.mas_equalTo(@200);
            });
    };return _btn_1;
}

-(BaseButton *)btn_2{
    if(!_btn_2){
        @jobs_weakify(self)
        _btn_2 = BaseButton.jobsInit()
            .bgColorBy(JobsLightGrayColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeNone)
            .jobsResetImagePadding(JobsWidth(10))
            .jobsResetTitlePadding(JobsWidth(10))
            .jobsResetBtnImage(_picBefore ? : JobsLoadBundleImage(@"bundle",@"Others",nil,@"绿色加号"))
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(@"#333333".cor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(25))
            .jobsResetBtnSubTitleFont(UIFontWeightBoldSize(18))
            .jobsResetBtnTitle(@"点击按钮".tr)
            .jobsResetBtnSubTitle(@"编码转译成图片".tr)
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .jobsResetBtnLayerBorderWidth(JobsWidth(.5f))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.bySelected(!x.selected);
                if (self.objBlock) self.objBlock(x);
                if(isNull(self->_resultStr)){
                    /// 存在于内存里面的编码，转变成图像对外进行输出
                    self.picForStr(self->_resultStr);
                }else @"请先编码图片".tr.toast();
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.btn_1.mas_bottom).offset(JobsWidth(10));
                make.left.equalTo(self.view).offset(JobsWidth(10));
                make.right.equalTo(self.view).offset(JobsWidth(-10));
                make.height.mas_equalTo(@200);
            });
    };return _btn_2;
}
@synthesize textView = _textView;
-(UITextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView
                .byText(@"暂无编码数据！！！".tr)
                .byTextColor(HEXCOLOR(0xB0B0B0))
                .byFont(UIFontSystemFontOfSize(14))
                .byBgColor(JobsLightTextColor)
                .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                    model
                        .byLayerCor(JobsLightGrayColor)
                        .byJobsWidth(.5f);
                }))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(10));
                    make.right.equalTo(self.view).offset(JobsWidth(-10));
                    make.top.equalTo(self.btn_2.mas_bottom).offset(JobsWidth(10));
                    make.bottom.equalTo(self.view).offset(JobsWidth(-20));
                });
        });
    };return _textView;
}

@end
