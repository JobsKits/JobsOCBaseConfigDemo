//
//  NSString+Others.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsLanguageManager.h"
#import "JobsDefineConstString.h"
#import "JobsDefineEnums.h"
#import "JobsDefineConstString.h"
#import "NSObject+Extras.h"
#import "NSString+Check.h"
#import "FileNameModel.h"
#import "JobsStringUtils.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Others)
#pragma mark —— 动画相关
/// 创建CABasicAnimation
-(JobsRetCABasicAnimationByVoidBlock _Nonnull)basicAnimation;
/// 创建CAKeyframeAnimation（关键帧动画）
-(JobsRetCAKeyframeAnimationByVoidBlock _Nonnull)keyframeAnimation;
-(JobsRetCAMediaTimingFunctionByVoidBlock _Nonnull)makeCAMediaTimingFunction;

-(JobsRetCAKeyframeAnimationByjobsByCAKeyframeAnimationBlockBlock _Nonnull)makeCAKeyframeAnimationByBlock;
-(JobsRetCABasicAnimationByjobsByCABasicAnimationBlockBlock _Nonnull)makeCABasicAnimationByBlock;
#pragma mark —— 关于URL
/// 返回网址相关的NSURL *
-(NSURL *)jobsUrl;
-(JobsRetURLByVoidBlock _Nonnull)jobsURL;
/// NSString => NSURLRequest
-(NSMutableURLRequest *)URLRequest;
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest;
/// 返回文件路径相关的NSURL *
/// 增加file://
-(JobsRetURLByVoidBlock _Nonnull)jobsFileUrl;
/// 能否正常打开Url
-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanOpenUrl;
/**
 问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
 解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *)urlProtect;
-(JobsRetStrByVoidBlock _Nonnull)jobsURLProtect;
-(NSString *)byHttp;
-(JobsRetStrByVoidBlock _Nonnull)jobsByHttp;
-(NSString *)byHttps;
-(JobsRetStrByVoidBlock _Nonnull)jobsByHttps;
#pragma mark —— 关于滤镜
/// 根据字符串生成二维码图像
-(JobsRetImageByVoidBlock _Nonnull)createQRcode;
/// 制作滤镜
-(JobsRetCIFilterByVoidBlock _Nonnull)filter;
#pragma mark —— 一些功能性的
-(UIColor *)cor;
-(JobsRetCorByVoidBlock _Nonnull)jobsCor;
-(JobsRetCorByVoidBlock _Nonnull)namedCor;
-(jobsByVoidBlock _Nonnull)toast;
-(NSString *_Nullable)tr;
-(JobsRetStrByVoidBlock _Nonnull)jobsTr;
/// 当前字符串是否被目标字符串以本地化、忽略大小写方式包含
-(JobsRetBOOLByStrBlock _Nonnull)inStr;
/// 输入单词的首字母大写（适用于拼接set方法）
-(JobsRetStrByVoidBlock _Nonnull)capitalizeFirstLetter;
/// 清除SDImage的图片缓存（用url为key）
/// ⚠️ 这个方法一旦使用，亦会清除掉placeholderImage
-(jobsBySDWebImageNoParamsBlockBlock _Nonnull)cleanSDImageCache;
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard;
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
                          andDirection:(JobsDirection)directionStr;
#pragma mark —— 字符串的自定义截取/拼接
/// 截取并返回一个字符串里面冒号前的值，并返回。如果没有冒号，则返回自身
-(JobsRetStrByVoidBlock _Nonnull)substringBeforeColon;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
/// OC 普通字符串+富文本
-(JobsRetAttributedStringByAttributedStringBlock _Nonnull)addByAttributedString;
/// 获取到最后一个字符
-(JobsRetStrByVoidBlock _Nonnull)getLastChars;
/// 获取到最后一个非空格字符
-(JobsRetStrByVoidBlock _Nonnull)getLastValuedChars;
/// 用入参进行分隔字符串对外输出数组
-(JobsRetArrByStrBlock _Nonnull)makeArrBy;
/// 截取字符串方法封装：从本字符串到endString
-(JobsRetStrByStrBlock _Nonnull)subStringTo;
/// 组装set方法名：set+首字母大写+：
-(JobsRetStrByVoidBlock _Nonnull)capitalizeFirstLetterAndPrefixSet;
#pragma mark —— 其他
/// 该文字是否是Debug定义的文字
-(JobsRetBOOLByVoidBlock _Nonnull)isDebugText;
#pragma mark —— 对系统方法的二次封装
/// 取UIStoryboard
-(JobsRetStoryboardByBundleBlock _Nonnull)sbByBundle;
/// 对系统方法 substringFromIndex 的二次封装
-(JobsRetStrByUIntegerBlock _Nonnull)substringFromIndex;
/// 对系统方法 substringToIndex 的二次封装
-(JobsRetStrByUIntegerBlock _Nonnull)substringToIndex;
/// 对系统方法 substringWithRange 的二次封装
-(JobsRetStrByRangeBlock _Nonnull)substringByRange;
/// 对系统方法 rangeOfString 的二次封装
-(JobsRetRangeByStrBlock _Nonnull)rangeOfString;
/// 对系统方法 rangeOfString 的二次封装（当执行参数是本字符串时）
-(JobsRetRangeByVoidBlock _Nonnull)range;
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet;
/// 对系统方法 characterAtIndex 的二次封装
-(JobsRetUnsignedShortByNSUIntegerBlock _Nonnull)characterAtIndex;
/// 对系统方法 stringWithCapacity 的二次封装
+(JobsRetStrByUIntegerBlock _Nonnull)initByCapacity;
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
+(JobsRetStrByStrBlock _Nonnull)initByContentsOfFile;
/// 对系统方法 - (nullable instancetype)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
+(JobsRetStrByURLBlock _Nonnull)initByContentsOfURL;

@end

NS_ASSUME_NONNULL_END
