//
//  NSString+Extra.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
/// OC字符串拼接
/// 字符串是否包含URL【返回YES包含】
/// 清除 SDImage 的图片缓存（用 url 为 key）
/// ⚠️ 这个方法一旦使用，亦会清除掉 placeholderImage
-(jobsBySDWebImageNoParamsBlockBlock _Nonnull)cleanSDImageCache{
    @jobs_weakify(self)
    return ^(SDWebImageNoParamsBlock _Nullable block){
        @jobs_strongify(self)
        if (!self) return;
        [SDImageCache.sharedImageCache removeImageForKey:self withCompletion:block];
    };
}
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard{
    return ^__kindof NSString *_Nullable() {
        @jobs_weakify(self)
        return jobsMakePasteboard(^(__kindof UIPasteboard * _Nullable pasteboard) {
            @jobs_strongify(self)
            pasteboard.byString(self);
            self.jobsToastSuccessMsg(@"复制成功".jobsTr());
        }).string;
    };
}

@end
