//
//  NSObject+Image.m
//  WHToastExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Image.h"

@implementation NSObject (Image)
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

@end
