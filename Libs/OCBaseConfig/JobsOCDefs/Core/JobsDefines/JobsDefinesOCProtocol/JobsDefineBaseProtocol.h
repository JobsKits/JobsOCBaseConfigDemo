//
//  JobsDefineBaseProtocol.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineBaseProtocol_h
#define JobsDefineBaseProtocol_h

#pragma mark —— BaseProtocol synthesize

#ifndef BaseProtocol_synthesize_lock
#define BaseProtocol_synthesize_lock \
\
@synthesize timer = _timer; \
@synthesize lock = _lock; \
@synthesize recursiveLock = _recursiveLock; \
@synthesize os_lock = _os_lock; \
@synthesize semaphore = _semaphore; \
@synthesize mutex = _mutex; \

#endif /* BaseProtocol_synthesize_lock */

#ifndef BaseProtocol_synthesize_state
#define BaseProtocol_synthesize_state \
\
@synthesize isLock = _isLock; \
@synthesize isRead = _isRead; \
@synthesize becomeFirstResponder = _becomeFirstResponder; \
@synthesize appLanguage = _appLanguage; \
@synthesize lastContentOffset = _lastContentOffset; \

#endif /* BaseProtocol_synthesize_state */

/**
 这里原来塞了一堆 Timer 相关字段，现在 BaseProtocol 里只剩 JS 相关，
 为了不改宏名，仍然叫 BaseProtocol_synthesize_timer，但内容换成 JS 部分
 */
#ifndef BaseProtocol_synthesize_timer
#define BaseProtocol_synthesize_timer \
\
@synthesize userContentCtrl = _userContentCtrl; \
@synthesize scriptMsg = _scriptMsg; \
@synthesize handlerName = _handlerName; \
@synthesize evaluateJavaScript = _evaluateJavaScript; \
@synthesize customUserAgent = _customUserAgent; \
@synthesize completionHandlerBlock = _completionHandlerBlock; \

#endif /* BaseProtocol_synthesize_timer */

#ifndef BaseProtocol_synthesize_data
#define BaseProtocol_synthesize_data \
\
@synthesize urls = _urls; \
@synthesize url = _url; \
@synthesize imageUrl = _imageUrl; \
@synthesize internationalizationKEY = _internationalizationKEY; \
@synthesize jobsDataMutSet = _jobsDataMutSet; \
@synthesize jobsDataMutArr = _jobsDataMutArr; \
@synthesize jobsDataMutDic = _jobsDataMutDic; \
@synthesize cls = _cls; \
@synthesize selector = _selector; \
@synthesize implementation = _implementation; \
@synthesize target = _target; \
@synthesize weak_target = _weak_target; \
@synthesize data = _data; \
@synthesize requestParams = _requestParams; \
@synthesize modelData = _modelData; \
@synthesize value_CGFloat = _value_CGFloat; \
@synthesize value_NSInteger = _value_NSInteger; \
@synthesize value_NSUInteger = _value_NSUInteger; \
@synthesize data_weak = _data_weak; \
@synthesize requestParams_weak = _requestParams_weak; \

#endif /* BaseProtocol_synthesize_data */

#ifndef BaseProtocol_synthesize
#define BaseProtocol_synthesize \
\
BaseProtocol_synthesize_lock \
BaseProtocol_synthesize_state \
BaseProtocol_synthesize_timer \
BaseProtocol_synthesize_data \

#endif /* BaseProtocol_synthesize */

#pragma mark —— BaseProtocol dynamic

#ifndef BaseProtocol_dynamic
#define BaseProtocol_dynamic \
\
@dynamic timer; \
@dynamic lock; \
@dynamic recursiveLock; \
@dynamic os_lock; \
@dynamic semaphore; \
@dynamic mutex; \
\
@dynamic isLock; \
@dynamic isRead; \
@dynamic becomeFirstResponder; \
@dynamic appLanguage; \
@dynamic lastContentOffset; \
\
/* JS 相关 */ \
@dynamic userContentCtrl; \
@dynamic scriptMsg; \
@dynamic handlerName; \
@dynamic evaluateJavaScript; \
@dynamic customUserAgent; \
@dynamic completionHandlerBlock; \
\
/* Data 相关 */ \
@dynamic urls; \
@dynamic url; \
@dynamic imageUrl; \
@dynamic internationalizationKEY; \
@dynamic jobsDataMutSet; \
@dynamic jobsDataMutArr; \
@dynamic jobsDataMutDic; \
@dynamic cls; \
@dynamic selector; \
@dynamic implementation; \
@dynamic target; \
@dynamic weak_target; \
@dynamic data; \
@dynamic requestParams; \
@dynamic modelData; \
@dynamic value_CGFloat; \
@dynamic value_NSInteger; \
@dynamic value_NSUInteger; \
@dynamic data_weak; \
@dynamic requestParams_weak; \

#endif /* BaseProtocol_dynamic */

#endif /* JobsDefineBaseProtocol_h */
