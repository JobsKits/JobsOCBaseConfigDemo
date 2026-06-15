//
//  NSString+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (JobsByOCPodsExtra)

-(UIColor *)cor{
    return UIColor.jobsCor(self);
}
/// 图片URL路径补齐
-(NSString *_Nullable)imageURLPlus{
    if(!This.BaseUrl_Image || !This.BaseUrl) return self;
    if(!self.containsString(HTTP) && isValue(self)){
        return (isValue(This.BaseUrl_Image) ? This.BaseUrl_Image : This.BaseUrl).add(self);
    }else return self;
}
/// 一般的URL路径补齐
-(NSString *_Nullable)normalURLPlus{
    if(!This.BaseUrl_Image) return self;
    if(!self.containsString(HTTP) && isValue(self)){
        return This.BaseUrl_Image.add(self);
    }else return self;
}
/// 清除 SDImage 的图片缓存（用 url 为 key）
/// ⚠️ 这个方法一旦使用，亦会清除掉 placeholderImage
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock _Nullable)block{
    [SDImageCache.sharedImageCache removeImageForKey:self withCompletion:block];
}
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard{
    return ^__kindof NSString *_Nullable() {
        @jobs_weakify(self)
        return jobsMakePasteboard(^(__kindof UIPasteboard * _Nullable pasteboard) {
            @jobs_strongify(self)
            pasteboard.string = self;
            self.jobsToastSuccessMsg(@"复制成功".tr);
        }).string;
    };
}
/// 完整的文件名提取普通文件名和文件后缀名
- (JobsRetFileNameModelByStrBlock _Nonnull)byFileFullName{
    return ^FileNameModel *_Nonnull(NSString *_Nullable fileFullName) {
        return jobsMakeFileNameModel(^(FileNameModel * _Nonnull model) {
            /// 使用 "." 分割文件名，获取文件名和文件类型
            NSArray<NSString *> *components = [fileFullName componentsSeparatedByString:@"."];
            if (components.count != 2) {
                JobsLog(@"文件名格式错误: %@", fileFullName);
                return;
            }
            model.byName(components[0])
                 .byType(components[1]);
        });
    };
}

@end
