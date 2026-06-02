//
//  NSURLSession+AllowAllCertificates.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURLSESSION_ALLOWALLCERTIFICATES_F75AA88AB0
#define JOBS_HEADER_GUARD_NSURLSESSION_ALLOWALLCERTIFICATES_F75AA88AB0

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// Apple 在 WKWebView 中引入了更严格的安全机制，可能会限制加载不在白名单中的外部资源（如 JavaScript 文件或其他外链资源）。
@interface NSURLSession (AllowAllCertificates)

+(BOOL)setAllowsAnyHTTPSCertificateForHost:(NSString *)host;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURLSESSION_ALLOWALLCERTIFICATES_F75AA88AB0 */
