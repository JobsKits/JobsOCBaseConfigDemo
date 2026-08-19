//
//  NSString+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

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

/// 字符串是否包含URL【返回YES包含】
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

-(NSString *)pathForResourceWithFullName{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsPathForResourceWithFullName)))(self, @selector(jobsPathForResourceWithFullName)))();
}

/// 返回网址相关的NSURL *
-(NSURL *)jobsUrl{
    return (((JobsRetURLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsURL)))(self, @selector(jobsURL)))();
}
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
/// 创建CAKeyframeAnimation（关键帧动画）
-(JobsRetCAKeyframeAnimationByVoidBlock _Nonnull)keyframeAnimation{
    @jobs_weakify(self)
    return ^CAKeyframeAnimation *{
        @jobs_strongify(self)
        if (!self) return nil;
        return [CAKeyframeAnimation animationWithKeyPath:self];
    };
}

-(JobsRetCAKeyframeAnimationByjobsByCAKeyframeAnimationBlockBlock _Nonnull)makeCAKeyframeAnimationByBlock{
    @jobs_weakify(self)
    return ^CAKeyframeAnimation *(jobsByCAKeyframeAnimationBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        CAKeyframeAnimation *animation = self.keyframeAnimation();
        if(block) block(animation);
        return animation;
    };
}
/// 服务器请求的数据为空值的时候进行替换本地默认值
/// 因为json传输是通过对象包装来进行，所以其实归结起来就是2类，一类是基本数据类型被包装成Number、其他包装成String
/// @param nullableString 进行检查的资源
/// @param replaceString 进行替换的备用文字资源
+(NSString *)nullableString:(id)nullableString
              replaceString:(NSString *)replaceString{
    if (isNull(replaceString)) replaceString = @"No Data".jobsTr();
    if (isNull(nullableString)) nullableString = replaceString;
    /// 只有NSNumber 和 NSString 这两种情况
    if([nullableString isKindOfClass:NSString.class]){
        NSString *str = (NSString *)nullableString;
        /// 过滤特殊字符：空格
        str = str.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);// 有空格，去除空格
        return str.length == 0 ? replaceString : str;
    }
    if([nullableString isKindOfClass:NSNumber.class])
        return isNull(toStringByID(nullableString)) ? replaceString : toStringByID(nullableString);
    return replaceString;
}

-(NSData *)UTF8Encoding{
    return (((JobsRetDataByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsUTF8Encoding)))(self, @selector(jobsUTF8Encoding)))();
}

-(JobsRetDataByVoidBlock _Nonnull)jobsUTF8Encoding{
    @jobs_weakify(self)
    return ^NSData *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self dataUsingEncoding:NSUTF8StringEncoding];
    };
}
/// OC字符串拼接
@end
