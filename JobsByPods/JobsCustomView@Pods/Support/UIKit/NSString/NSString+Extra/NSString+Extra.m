//
//  NSString+Extra.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        @jobs_strongify(self)
        if(!str) str = JobsEmpty;
        /// 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([self stringByAppendingString:str]);// 原始字符串不会改变，输出一个新的字符串
    };
}
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl{
    NSString *checkStr = @"https://".add(@"http://");
    return [self rangeOfString:checkStr].location != NSNotFound;
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

@end
