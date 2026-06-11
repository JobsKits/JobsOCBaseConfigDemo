//
//  NSObject+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"
#import <objc/message.h>

@implementation NSObject (Extra)
/// NSBundle
+(NSBundle *_Nullable)mainBundle{
    return NSBundle.mainBundle;
}
/// NSLocale
+(NSLocale *_Nullable)currentLocale{
    return NSLocale.currentLocale;
}
/// UIDevice
+(UIDevice *_Nullable)currentDevice{
    return UIDevice.currentDevice;
}
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
        };return nil;
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
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel{
    @jobs_weakify(self)
    return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
//        data.backgroundImage = @"返回".img
        data.byHighlightBackgroundImage(@"返回".img)
            .byHighlightImage(@"返回".img)
            .byNormalImage(@"返回".img)
            .byBaseBackgroundColor(JobsClearColor.colorWithAlphaComponentBy(0))
            .byTitle(self.viewModel.backBtnTitleModel.text)
            .byFont(self.viewModel.backBtnTitleModel.font)
            .byTitleCor(JobsBlackColor)
            .bySelectedTitleCor(JobsBlackColor)
            .byRoundingCorners(UIRectCornerAllCorners)
            .byImagePlacement(NSDirectionalRectEdgeLeading)
            .byImagePadding(JobsWidth(5));
    });
}

-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable sender) {
        @jobs_strongify(self)
        if ([self respondsToSelector:@selector(jobsBackBlock)]) {
            typedef JobsRetIDByIDBlock _Nullable (*JobsMsgSendBlockByVoid)(id, SEL);
            JobsRetIDByIDBlock block = ((JobsMsgSendBlockByVoid)objc_msgSend)(self, @selector(jobsBackBlock));
            if (block) block(sender);
        }
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
/// Prop_strong()UIViewModel *viewModel;
PROP_STRONG_OBJECT_Default_TYPE(UIViewModel, viewModel, ViewModel)

@end
