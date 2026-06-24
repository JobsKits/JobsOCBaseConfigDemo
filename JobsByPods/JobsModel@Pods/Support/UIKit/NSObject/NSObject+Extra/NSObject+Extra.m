//
//  NSObject+Extra.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (JobsModelExtra)
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
            if (!data) { return nil; };return [UIImage imageWithData:data scale:UIScreen.mainScreen.scale];
        }else return nil;
    };
}
/// 获取当前时间
-(NSDate *)currentDate{
    return NSDate.date;
}
/**

     NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKey(@"dataMutArr");
     [dataMutArr removeAllObjects];
     [dataMutArr addObjectsFromArray:self.createDataMutArr2];

     // dataMutArr = self.createDataMutArr2; 这一段无效
 */
- (JobsRetIDByIDBlock _Nonnull)valueForKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *key) {
        @jobs_strongify(self)
        id value = nil;
        if ([key isKindOfClass:NSString.class] &&
            [self respondsToSelector:NSSelectorFromString(key)]) {
            @try {
                value = [self valueForKey:key];
            }
            @catch (NSException *exception) {
                JobsLog(@"Exception: %@", exception);
                value = @"nil"; // or handle the exception as needed
            }
        };return value;
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

@end
