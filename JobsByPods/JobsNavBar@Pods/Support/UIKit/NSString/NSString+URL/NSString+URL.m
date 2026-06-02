//
//  NSString+URL.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+URL.h"

@implementation NSString (URL)
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl{
    NSString *s = self.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
    if (!isValue(s)) { return nil; }
    if ([s hasPrefix:@"//"]) { s = @"https:".add(s); }
    // 允许中文与特殊字符
    NSString *encoded = [s stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLFragmentAllowedCharacterSet];
    return [NSURL URLWithString:encoded ?: s];
}
/// NSString => NSURLRequest
-(NSMutableURLRequest *_Nonnull)URLRequest{
    return NSURLRequest.initBy(self.jobsUrl).mutableCopy;
}
/// 返回文件路径相关的NSURL *
/// 增加file://
-(NSURL *_Nonnull)jobsFileUrl{
    return [NSURL fileURLWithPath:self];
}
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl{
    return [UIApplication.sharedApplication canOpenURL:self.jobsUrl];
}
/**

     问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
     解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *_Nonnull)urlProtect{
    if ([self containsString:零宽转义字符]) {
        return self.remove200BMark;
    }else return self;
}

-(NSString *_Nonnull)byHttp{
    return HTTPHeader.add(self).urlProtect;
}

-(NSString *_Nonnull)byHttps{
    return HTTPSHeader.add(self).urlProtect;
}

@end
