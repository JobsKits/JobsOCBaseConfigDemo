//
//  JobsDefineRACProtocol.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineRACProtocol_h
#define JobsDefineRACProtocol_h

#ifndef RACProtocol_synthesize
#define RACProtocol_synthesize \
\
@synthesize racDisposable = _racDisposable;\
@synthesize racSubject = _racSubject;\
@synthesize reqSignal = _reqSignal;\
@synthesize actionCommand = _actionCommand;\
@synthesize dataSequence = _dataSequence;\
@synthesize dataConnection = _dataConnection;\
@synthesize mainScheduler = _mainScheduler;\
@synthesize backgroundScheduler = _backgroundScheduler;\
@synthesize dataTuple = _dataTuple;\
@synthesize signalDisposableMap = _signalDisposableMap;\
@synthesize doSthByIDBlock = _doSthByIDBlock;\
@synthesize doSthBlock = _doSthBlock;\

#endif /* RACProtocol_synthesize */

#ifndef RACProtocol_dynamic
#define RACProtocol_dynamic \
\
@dynamic racDisposable;\
@dynamic racSubject;\
@dynamic reqSignal;\
@dynamic actionCommand;\
@dynamic dataSequence;\
@dynamic dataConnection;\
@dynamic mainScheduler;\
@dynamic backgroundScheduler;\
@dynamic dataTuple;\
@dynamic signalDisposableMap;\
@dynamic doSthByIDBlock;\
@dynamic doSthBlock;\

#endif /* RACProtocol_dynamic */

#endif /* JobsDefineRACProtocol_h */
