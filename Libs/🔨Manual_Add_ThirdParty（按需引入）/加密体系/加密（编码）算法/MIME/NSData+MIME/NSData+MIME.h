//
//  NSData+MIME.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_MIME_A5F36B55E3
#define JOBS_HEADER_GUARD_NSDATA_MIME_A5F36B55E3

#import <Foundation/Foundation.h>

#import "JobsByOCPods.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MIME)
#pragma mark —— MIME编码的数据 <==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByMIMEString;
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString;
///【类方法】NSData对象 转换成 以MIME编码的数据
+(JobsRetStrByDataBlock _Nonnull)MIMEStringByImage;
///【实例方法】NSData对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStringByImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_MIME_A5F36B55E3 */
