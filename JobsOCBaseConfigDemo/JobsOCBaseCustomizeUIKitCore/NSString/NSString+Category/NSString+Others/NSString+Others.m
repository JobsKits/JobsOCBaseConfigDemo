//
//  NSString+Others.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Others.h"

@implementation NSString (Others)
#pragma mark —— 动画相关
/// 创建CABasicAnimation
/// 创建CAKeyframeAnimation（关键帧动画）
#pragma mark —— 关于URL
/// 返回网址相关的NSURL *
-(NSURL *)jobsUrl{
    return (((JobsRetURLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsURL)))(self, @selector(jobsURL)))();
}
/// NSString => NSURLRequest
-(NSMutableURLRequest *)URLRequest{
    return (((JobsRetMutableURLRequestByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsURLRequest)))(self, @selector(jobsURLRequest)))();
}

/// 返回文件路径相关的NSURL *
/// 增加file://
///  能否正常打开Url
/**
 问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
 解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *)urlProtect{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsURLProtect)))(self, @selector(jobsURLProtect)))();
}

-(NSString *)byHttp{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsByHttp)))(self, @selector(jobsByHttp)))();
}

-(NSString *)byHttps{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsByHttps)))(self, @selector(jobsByHttps)))();
}

#pragma mark —— 关于滤镜
/// 根据字符串生成二维码图像
/// 制作滤镜
#pragma mark —— 一些功能性的
-(UIColor *)cor{
    return (((JobsRetCorByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsCor)))(self, @selector(jobsCor)))();
}

/// 国际化
-(NSString *_Nullable)tr{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsTr)))(self, @selector(jobsTr)))();
}

/// 输入单词的首字母大写（适用于拼接set方法）
-(JobsRetStrByVoidBlock _Nonnull)capitalizeFirstLetter{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if(self.length){
            return self.substringToIndex(1).uppercaseString
                .add(self.substringFromIndex(1));
        }else return self;
    };
}
/// 清除SDImage的图片缓存（用url为key）
/// ⚠️ 这个方法一旦使用，亦会清除掉placeholderImage
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
/// OC字符串的文本改变方向
/// @param aView 文本的控件
/// @param aRect 控件的尺寸
/// @param aFont 文字的字号
/// @param aColor 文字的颜色
/// @param directionStr  文字显示的方向
-(CAShapeLayer *_Nonnull)animateOnView:(__kindof UIView *_Nonnull)aView
                                atRect:(CGRect)aRect
                               forFont:(UIFont *)aFont
                             withColor:(UIColor *_Nonnull)aColor
                          andDirection:(JobsDirection)directionStr{
    // 创建文字路径
    UIBezierPath *path = [UIBezierPath bezierPathWithText:self
                                                     font:aFont
                                         andWithDirection:directionStr];
    // 创建路径图层
    return jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
        layer
            .byPath(path.CGPath)
            .byStrokeColor(aColor.CGColor)
            .byFillColor(aColor.CGColor)
            .byLineWidth(1.0f)
            .byLineJoin(kCALineJoinBevel)
            .byFrame(aRect)
            .byBounds(CGPathGetBoundingBox(path.CGPath))
            .byGeometryFlipped(NO);
        aView.layer.addSublayer(layer);
    });
}
#pragma mark —— 字符串的自定义截取/拼接
/// 截取并返回一个字符串里面冒号前的值，并返回。如果没有冒号，则返回自身
-(JobsRetStrByVoidBlock _Nonnull)substringBeforeColon{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSRange range = self.rangeOfString(@":");
        if (range.location != NSNotFound) {
            return self.substringToIndex(range.location);
        } else return self; // 如果没有找到冒号，则返回原始字符串
    };
}
/// OC字符串拼接
/// OC 普通字符串+富文本
-(JobsRetAttributedStringByAttributedStringBlock _Nonnull)addByAttributedString{
    @jobs_weakify(self)
    return ^__kindof NSAttributedString *_Nullable(__kindof NSAttributedString *_Nonnull aString) {
        @jobs_strongify(self)
        return NSMutableAttributedString.initByString(self).add(aString);
    };
}
/// 获取到最后一个字符
-(JobsRetStrByVoidBlock _Nonnull)getLastChars{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.substringFromIndex(self.length - 1);
    };
}
/// 获取到最后一个非空格字符
-(JobsRetStrByVoidBlock _Nonnull)getLastValuedChars{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet).getLastChars();
    };
}
/// 用入参进行分隔字符串对外输出数组
-(JobsRetArrByStrBlock _Nonnull)makeArrBy{
    @jobs_weakify(self)
    return ^ __kindof NSArray <NSString *>*_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self componentsSeparatedByString:data];
    };
}
/// 截取字符串方法封装：从本字符串到endString
/// 组装set方法名：set+首字母大写+：
-(JobsRetStrByVoidBlock _Nonnull)capitalizeFirstLetterAndPrefixSet{
    return ^__kindof NSString *_Nullable(){
        if (!self.length) return self; /// 如果字符串为空，直接返回
        /// 获取字符串的首字母并大写
        NSString *capitalizedFirstLetter = self.substringToIndex(1).uppercaseString;
        NSString *restOfString = self.substringFromIndex(1);
        /// 拼接大写的首字母和其余部分
        NSString *capitalizedString = capitalizedFirstLetter.add(restOfString);
        /// 在前面加上 "set"
        return @"set".add(capitalizedString).jobsPureString();
    };
}
#pragma mark —— 其他
/// 该文字是否是Debug定义的文字
#pragma mark —— 对系统方法的二次封装
/// 取UIStoryboard
/// 对系统方法 substringFromIndex 的二次封装
/// 对系统方法 substringToIndex 的二次封装
/// 对系统方法 substringWithRange 的二次封装
/// 对系统方法 rangeOfString 的二次封装
/// 对系统方法 rangeOfString 的二次封装（当执行参数是本字符串时）
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
/// 对系统方法 characterAtIndex 的二次封装
/// 对系统方法 stringWithCapacity 的二次封装
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
/// 对系统方法 - (nullable instancetype)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
@end
