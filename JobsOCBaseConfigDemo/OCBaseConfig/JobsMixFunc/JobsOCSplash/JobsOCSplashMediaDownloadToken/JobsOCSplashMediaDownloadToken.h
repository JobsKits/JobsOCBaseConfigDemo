//
//  JobsOCSplashMediaDownloadToken.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 同 URL 下载中的独立订阅；取消或释放只移除此订阅，最后一个离开才取消下载。
@interface JobsOCSplashMediaDownloadToken : NSObject

@property(atomic, assign, readonly, getter=isCancelled)BOOL cancelled;
-(instancetype)initWithIdentifier:(NSUUID *)identifier cancellation:(jobsByVoidBlock)handler;
-(jobsByVoidBlock _Nonnull)cancel;

@end

NS_ASSUME_NONNULL_END
