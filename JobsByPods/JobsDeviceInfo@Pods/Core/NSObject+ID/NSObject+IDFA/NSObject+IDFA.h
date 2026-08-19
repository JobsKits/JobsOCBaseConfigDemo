//
//  NSObject+IDFA.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_IDFA_DCABCBE309
#define JOBS_HEADER_GUARD_NSOBJECT_IDFA_DCABCBE309

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <AdSupport/AdSupport.h> // 提供广告标识符 IDFA 访问能力，通常需结合 ATT 授权状态判断是否可用。

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (IDFA)
/**
 全名：advertisingIdentifier
 
 来源：iOS6.0及以后

 说明：直译就是广告id， 在同一个设备上的所有App都会取到相同的值，是苹果专门给各广告提供商用来追踪用户而设的，用户可以在 设置|隐私|广告追踪 里重置此id的值，或限制此id的使用，故此id有可能会取不到值，但好在Apple默认是允许追踪的，而且一般用户都不知道有这么个设置，所以基本上用来监测推广效果，是戳戳有余了。

 注意：由于idfa会出现取不到的情况，故绝不可以作为业务分析的主id，来识别用户。
 */
-(JobsRetStrByVoidBlock _Nonnull)IDFA;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_IDFA_DCABCBE309 */
