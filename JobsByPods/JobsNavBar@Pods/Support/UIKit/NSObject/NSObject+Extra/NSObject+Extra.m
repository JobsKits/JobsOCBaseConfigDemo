//
//  NSObject+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)
/// 震动特效反馈
+(jobsByViewBlock _Nonnull)feedbackGenerator{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view) {
        @jobs_strongify(self)
        if(!view && [self isKindOfClass:UIView.class]) view = (UIView *)self;
        if(!view && [self isKindOfClass:UIViewController.class]) {
            UIViewController *vc = (UIViewController *)self;
            view = vc.view;
        }
        if (@available(iOS 17.5, *)) {
            /// iOS 17.5 及以上使用新的 API
            UIImpactFeedbackGenerator *generator = UIImpactFeedbackGenerator.initMediumStyleBy(view);
            [generator impactOccurred];
        } else if (@available(iOS 10.0, *)) {
            /// iOS 10.0 - 17.4 使用旧的初始化方法
            UIImpactFeedbackGenerator *generator = UIImpactFeedbackGenerator.initByMediumStyle;
            [generator prepare];
            [generator impactOccurred];
        } else {
            /// iOS 10.0 以下，使用系统音效反馈
            AudioServicesPlaySystemSound(1520);
        }
    };
}
/// 播放自定义本地声音
/// fileName 全文件名 包含后缀
-(jobsByStrBlock)playSoundEffect{
    return ^(NSString *_Nullable fileFullName){
        FileNameModel *fileNameModel = fileFullName.byFileFullName(fileFullName);
        SystemSoundID soundID;
        /// 得到音效文件的地址
        NSString *soundFilePath = fileNameModel.name.add(fileNameModel.type).pathForResourceWithFullName;
        /// 生成系统音效id
        OSStatus errorCode = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundFilePath.jobsUrl, &soundID);
        if (errorCode) {
            JobsLog(@"create sound failed");
            return;
        }
        /// 播放系统音效
        AudioServicesPlaySystemSound(soundID);
    };
}
/// 获取本地普通图像
-(nullable UIImage *)img{
    if([self isKindOfClass:NSString.class]){
        NSString *SELF = (NSString *)self;
        NSString *raw = [SELF stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        if (!isValue(raw)) { return nil; }
        // 1) 拒绝网络：同步接口不触网
        if (SELF.isContainsUrl) { return nil; }
        // 2) dataURL: data:image/png;base64,xxxx
        if ([raw hasPrefix:@"data:image/"]) {
            UIImage *img = self.imageByDataURL(raw);
            if (!img && isValue(self)) {
                JobsLog(@"dataURL 解码失败：%@", self);
            };return img;
        }
        // 3) Bundle 命名图片
        UIImage *named = [UIImage imageNamed:raw];
        if (named) { return named; }
        // 4) 绝对/相对路径文件
        if ([raw hasPrefix:@"/"] ||
            [raw containsString:@".png"] ||
            [raw containsString:@".jpg"] ||
            [raw containsString:@".jpeg"] ||
            [raw containsString:@".webp"] ||
            [raw containsString:@".gif"]) {
            UIImage *fileImg = [UIImage imageWithContentsOfFile:raw];
            if (fileImg) { return fileImg; }
        }

        if (!named && isValue(self)) {
            JobsLog(@"文件名为%@的图片获取失败，请检查", self);
        }return nil;
    }else return nil;
}

-(JobsRetImageByStrBlock _Nonnull)imageByDataURL{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(__kindof NSString *_Nullable dataURL){
        @jobs_strongify(self)
        if([self isKindOfClass:NSString.class]){
            // 形如：data:image/png;base64,iVBORw0KGgo...
            NSRange comma = [dataURL rangeOfString:@","];
            if (comma.location == NSNotFound) { return nil; }
            NSString *b64 = [dataURL substringFromIndex:comma.location + 1];
            NSData *data = [NSData.alloc initWithBase64EncodedString:b64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            if (!data) { return nil; }
            return [UIImage imageWithData:data scale:UIScreen.mainScreen.scale];
        }else return nil;
    };
}

-(UIColor *)cor{
    return UIColor.jobsCor(self);
}
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel{
    @jobs_weakify(self)
    return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
//        data.backgroundImage = @"返回".img
        data.highlightBackgroundImage = @"返回".img;
        data.highlightImage = @"返回".img;
        data.normalImage = @"返回".img;
        data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
        data.title = self.viewModel.backBtnTitleModel.text;
        data.font = self.viewModel.backBtnTitleModel.font;
        data.titleCor = JobsBlackColor;
        data.selectedTitleCor = JobsBlackColor;
        data.roundingCorners = UIRectCornerAllCorners;
        data.imagePlacement = NSDirectionalRectEdgeLeading;
        data.imagePadding = JobsWidth(5);
    });
}
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull key,id _Nullable value) {
        @jobs_strongify(self)
        [self setValue:value forKey:key];
    };
}

-(JobsRetDataByStrBlock _Nonnull)initByContentsOfFile{
    return ^NSData *_Nullable(__kindof NSString *_Nullable path){
        return NSData.dataByContentsOfFile(path);
    };
}

-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions{
    return ^id _Nullable(NSData *_Nullable data){
        if(data){
            NSError *error = nil;
            NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data.copy
                                                               options:kNilOptions
                                                                 error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}

-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers{
    return ^id _Nullable(NSData *_Nullable data){
        if(data){
            NSError *error = nil;
            NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data.copy
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}

-(JobsRetDataByDicBlock _Nonnull)JSONWritingPrettyPrinted{
    return ^NSData *_Nullable(__kindof NSDictionary *_Nullable data){
        if(data){
            NSError *error = nil;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data.copy
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}

-(MJRefreshConfigModel *_Nullable)mjHeaderDefaultConfig{
    return jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
        data.stateIdleTitle = @"下拉可以刷新".tr;
        data.pullingTitle = @"下拉可以刷新".tr;
        data.refreshingTitle = @"松开立即刷新".tr;
        data.willRefreshTitle = @"刷新数据中".tr;
        data.noMoreDataTitle = @"下拉可以刷新".tr;
        data.automaticallyChangeAlpha = YES;
    });
}

-(MJRefreshConfigModel *_Nonnull)refreshHeaderDataBy:(JobsRetIDByIDBlock _Nonnull)loadBlock{
    return self.mjHeaderDefaultConfig.byLoadBlock(loadBlock);
}

-(MJRefreshConfigModel *_Nullable)mjFooterDefaultConfig{
    return jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
        data.stateIdleTitle = @"".tr;
        data.pullingTitle = @"".tr;
        data.refreshingTitle = @"".tr;
        data.willRefreshTitle = @"".tr;
        data.noMoreDataTitle = @"".tr;
        data.automaticallyChangeAlpha = YES;
    });
}

-(MJRefreshConfigModel *_Nonnull)refreshFooterDataBy:(JobsRetIDByIDBlock _Nonnull)loadBlock{
    return self.mjFooterDefaultConfig.byLoadBlock(loadBlock);
}

-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable sender) {
        @jobs_strongify(self)
        if ([self respondsToSelector:@selector(jobsBackBlock)]) {
            JobsRetIDByIDBlock block = [self valueForKey:@"jobsBackBlock"];
            if (block) block(sender);
        }

        UIViewController *vc = nil;
        if ([self isKindOfClass:UIViewController.class]) {
            vc = (UIViewController *)self;
        }else if ([self isKindOfClass:UIView.class]){
            UIResponder *responder = ((UIView *)self).nextResponder;
            while (responder && ![responder isKindOfClass:UIViewController.class]) {
                responder = responder.nextResponder;
            }
            vc = (UIViewController *)responder;
        }

        if (vc.navigationController) {
            [vc.navigationController popViewControllerAnimated:YES];
        }else if (vc.presentingViewController){
            [vc dismissViewControllerAnimated:YES completion:nil];
        }
    };
}

-(DeviceOrientation)getDeviceOrientation{
    UIInterfaceOrientation orientation = UIInterfaceOrientationUnknown;
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        if (![scene isKindOfClass:UIWindowScene.class]) continue;
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        orientation = windowScene.interfaceOrientation;
        if (orientation != UIInterfaceOrientationUnknown) break;
    }

    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            return DeviceOrientationLandscape;
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
            return DeviceOrientationPortrait;
        default:
            return DeviceOrientationUnknown;
    }
}

-(JobsReturnNavBarConfigByStringBlock _Nullable)makeNav0ByTitle{
    @jobs_weakify(self)
    return ^JobsNavBarConfig *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        return jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable config) {
            config.viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.Alpha = 1;
                viewModel.navBgCor = JobsClearColor;
                viewModel.navBgImage = @"".img;
                viewModel.titleImage = @"BLuckyRedLogo".img;
            });
            config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                buttonModel.normalImage = @"全局返回箭头".img;
                buttonModel.highlightImage = @"全局返回箭头".img;
                buttonModel.title = string;
                buttonModel.titleFont = bayonRegular(18);
                buttonModel.titleCor = @"#E20808".cor;
                buttonModel.imagePlacement = NSDirectionalRectEdgeLeading;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.clickEventBlock = ^id(__kindof UIButton *_Nullable x){
                    @jobs_strongify(self)
                    x.selected = !x.selected;
                    UIViewController *vc = [self isKindOfClass:UIViewController.class] ? (UIViewController *)self : nil;
                    [vc.navigationController popViewControllerAnimated:YES];
                    return nil;
                };
                buttonModel.longPressGestureEventBlock = ^id(__kindof UIButton *_Nullable x){
                    return nil;
                };
            }));
        });
    };
}
/// Prop_strong()UIViewModel *viewModel;
PROP_STRONG_OBJECT_Default_TYPE(UIViewModel, viewModel, ViewModel)

@end
