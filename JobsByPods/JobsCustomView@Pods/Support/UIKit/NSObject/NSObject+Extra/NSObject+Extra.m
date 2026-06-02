//
//  NSObject+Extra.m
//  JobsCustomView
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
            UIImpactFeedbackGenerator *generator = UIImpactFeedbackGenerator.initMediumStyleBy(view);
            [generator impactOccurred];
        } else if (@available(iOS 10.0, *)) {
            UIImpactFeedbackGenerator *generator = UIImpactFeedbackGenerator.initByMediumStyle;
            [generator prepare];
            [generator impactOccurred];
        } else {
            AudioServicesPlaySystemSound(1520);
        }
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

-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers{
    return ^id _Nullable(NSData *_Nullable data){
        if(data){
            NSError *error = nil;
            id jsonData = [NSJSONSerialization JSONObjectWithData:data.copy
                                                          options:NSJSONReadingMutableContainers
                                                            error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}

-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions{
    return ^id _Nullable(NSData *_Nullable data){
        if(data){
            NSError *error = nil;
            id jsonData = [NSJSONSerialization JSONObjectWithData:data.copy
                                                          options:kNilOptions
                                                            error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}

-(JobsRetDataByStrBlock _Nonnull)initByContentsOfFile{
    return ^NSData *_Nullable(__kindof NSString *_Nullable path){
        return NSData.dataByContentsOfFile(path);
    };
}
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull key,id _Nullable value) {
        @jobs_strongify(self)
        [self setValue:value forKey:key];
    };
}

@end
