//
//  NSString+CIFilter.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CIFILTER_3B3716481C
#define JOBS_HEADER_GUARD_NSSTRING_CIFILTER_3B3716481C

#import <Foundation/Foundation.h>
#import <JobsCustomView/NSObject+Extra.h>
#import <JobsCustomView/NSString+Conversion.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CIFilter)
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode;
/// 制作滤镜
-(CIFilter *_Nonnull)filter;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CIFILTER_3B3716481C */
