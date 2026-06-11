//
//  NSString+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"
#import <JobsBasePopupView/UIColor+Extra.h>

@implementation NSString (Extra)
/// 获取一行字符串的高度
/// 这个方法仅计算文本本身的高度，不包括行间距等因素
-(JobsRetCGFloatByFontBlock _Nonnull)widthBy{
    @jobs_weakify(self)
    return ^CGFloat(UIFont *_Nullable font){
        @jobs_strongify(self)
        return [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, font.lineHeight)
                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                               attributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            if(font) [data setValue:font forKey:NSFontAttributeName];
        })
                                  context:nil].size.width;
    };
}

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString{
    @jobs_weakify(self)
    return ^BOOL(NSString *data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSString.class]) {
            return [self isEqualToString:data];
        };return NO;
    };
}
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl{
    NSString *checkStr = @"https://".add(@"http://");
    return [self rangeOfString:checkStr].location != NSNotFound;
}
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        @jobs_strongify(self)
        if(!str) str = JobsEmpty;
        // 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([self stringByAppendingString:str]); // 原始字符串不会改变，输出一个新的字符串
    };
}
/// 完整的文件名提取普通文件名和文件后缀名
- (JobsRetFileNameModelByFileFullNameStringBlock _Nonnull)byFileFullName{
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

-(NSString *)pathForResourceWithFullName{
    // 拆分文件名和扩展名
    NSString *name = self.stringByDeletingPathExtension;
    NSString *extension = self.pathExtension;
    // 使用 NSBundle 获取文件路径
    return [NSBundle.mainBundle pathForResource:name ofType:extension];
}
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl{
    NSString *s = self.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
    if (!isValue(s)) { return nil; }
    if ([s hasPrefix:@"//"]) { s = @"https:".add(s); }
    // 允许中文与特殊字符
    NSString *encoded = [s stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLFragmentAllowedCharacterSet];
    return [NSURL URLWithString:encoded ?: s];
}
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSCharacterSet *_Nullable data){
        @jobs_strongify(self)
        return [self stringByTrimmingCharactersInSet:data];
    };
}

-(CAKeyframeAnimation *)makeCAKeyframeAnimationByBlock:(jobsByCAKeyframeAnimationBlock _Nonnull)block{
    CAKeyframeAnimation *animation = self.keyframeAnimation;
    if(block) block(animation);
    return animation;
}
/// 创建CAKeyframeAnimation（关键帧动画）
-(CAKeyframeAnimation *)keyframeAnimation{
    return [CAKeyframeAnimation animationWithKeyPath:self];
}

-(UIColor *)cor{
    return UIColor.jobsCor(self);
}
/// 服务器请求的数据为空值的时候进行替换本地默认值
/// 因为json传输是通过对象包装来进行，所以其实归结起来就是2类，一类是基本数据类型被包装成Number、其他包装成String
/// @param nullableString 进行检查的资源
/// @param replaceString 进行替换的备用文字资源
+(NSString *)nullableString:(id)nullableString
              replaceString:(NSString *)replaceString{

    if (isNull(replaceString)) replaceString = @"No Data".tr;
    if (isNull(nullableString)) nullableString = replaceString;
    /// 只有NSNumber 和 NSString 这两种情况
    if([nullableString isKindOfClass:NSString.class]){
        NSString *str = (NSString *)nullableString;
        /// 过滤特殊字符：空格
        str = [str stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];// 有空格，去除空格
        return str.length == 0 ? replaceString : str;
    }

    if([nullableString isKindOfClass:NSNumber.class])
        return isNull(toStringByID(nullableString)) ? replaceString : toStringByID(nullableString);

    return replaceString;
}
/// OC字符串转NSDate
-(JobsRetDateByDateFormatterBlock _Nonnull)dataByDateFormatter{
    @jobs_weakify(self)
    return ^NSDate *_Nullable(NSDateFormatter *_Nullable data){
        @jobs_strongify(self)
        return [data dateFromString:self];
    };
}
/// 对系统方法 rangeOfString 的二次封装
-(JobsRetRangeByStrBlock _Nonnull)rangeOfString{
    @jobs_weakify(self)
    return ^NSRange(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self rangeOfString:data];
    };
}
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
-(JobsRetStrByStrBlock _Nonnull)initByContentsOfFile{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable filePath){
        NSError *error = nil;
        NSString *string = [NSString.alloc initWithContentsOfFile:filePath
                                                         encoding:NSUTF8StringEncoding
                                                            error:&error];
        if(error){
            JobsLog(@"error = %@",error);
            return nil;
        }else return string;
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

@end
