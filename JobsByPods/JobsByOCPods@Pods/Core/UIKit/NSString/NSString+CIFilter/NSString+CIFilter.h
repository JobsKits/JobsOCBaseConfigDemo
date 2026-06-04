//
//  NSString+CIFilter.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CIFILTER_E90DE7C93F
#define JOBS_HEADER_GUARD_NSSTRING_CIFILTER_E90DE7C93F

#import <Foundation/Foundation.h>
#import <JobsByOCPods/NSObject+Extra.h>
#import <JobsByOCPods/NSString+Conversion.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CIFilter)
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode;
/// 制作滤镜
-(CIFilter *_Nonnull)filter;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CIFILTER_E90DE7C93F */
