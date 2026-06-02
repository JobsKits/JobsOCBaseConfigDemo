//
//  NSString+Extra.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
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
            model.name = components[0];
            model.type = components[1];
        });
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

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString{
    @jobs_weakify(self)
    return ^BOOL(NSString *data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSString.class]) {
            return [self isEqualToString:data];
        }return NO;
    };
}
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
/// 求一个字符串的长度
-(JobsRetCGFloatByFontBlock _Nonnull)lenthByFont{
    @jobs_weakify(self)
    return ^CGFloat(UIFont *_Nullable font){
        @jobs_strongify(self)
        if(!font) font = UIFontSystemFontOfSize(17);
        return [self sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            if(font) [data setValue:font forKey:NSFontAttributeName];
        })].width;
    };
}
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSCharacterSet *_Nullable data){
        @jobs_strongify(self)
        return [self stringByTrimmingCharactersInSet:data];
    };
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
/// 格式化为中国时间
-(JobsRetStrByStrBlock _Nonnull)chinaTime{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSString *_Nullable timeFormatter){
        @jobs_strongify(self)
        return [self timeStampByTimeFormatter:timeFormatter
                                 timeZoneType:TimeZoneTypeCSTChina
                                intervalStyle:intervalByMilliSec];
    };
}
///（字符串）时间戳依据某一规范，格式化为能一目了然的时间（字符串）
/// - Parameters:
///   - timeFormatter: timeFormatter
///   - timeZoneType: 时区
///   - intervalStyle: IntervalStyle
-(NSString *)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                         timeZoneType:(TimeZoneType)timeZoneType
                        intervalStyle:(IntervalStyle)intervalStyle{
    @jobs_weakify(self)
    NSDate *date = nil;
    if (intervalStyle == intervalBySec) {/// 秒级时间戳（10位）
        date = NSDate.initDateBy(self.doubleValue);
    }else if(intervalStyle == intervalByMilliSec){/// 毫秒级时间戳（13位）
        date = NSDate.initDateBy(self.doubleValue / 1000.0);
    }return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
        @jobs_strongify(self)
        data.dateFormat = isNull(timeFormatter) ? @"yyyy-MM-dd HH:mm:ss" : timeFormatter;
        data.timeZone = timeZone(timeZoneType);
    }).date(date);
}
/// 对系统方法 rangeOfString 的二次封装
-(JobsRetRangeByStrBlock _Nonnull)rangeOfString{
    @jobs_weakify(self)
    return ^NSRange(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self rangeOfString:data];
    };
}

@end
