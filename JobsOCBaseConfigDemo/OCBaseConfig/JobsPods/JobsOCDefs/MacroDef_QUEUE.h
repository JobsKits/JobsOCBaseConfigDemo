//
//  MacroDef_QUEUE.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef MacroDef_QUEUE_h
#define MacroDef_QUEUE_h

#pragma mark —— 队列相关
/// 异步获取某个队列
#ifndef GET_QUEUE_ASYNC
#define GET_QUEUE_ASYNC(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
    if (block) block();\
} else {\
    dispatch_async(queue, block);\
}
#endif
/// 获取主队列
#ifndef GET_MAIN_QUEUE_ASYNC
#define GET_MAIN_QUEUE_ASYNC(block) GET_QUEUE_ASYNC(dispatch_get_main_queue(), block)
#endif
/// 执行只需运行一次的线程安全代码。要销毁需要重置static dispatch_once_t Tab = 0;
#ifndef OnlyOnceDispatchFunc
#define OnlyOnceDispatchFunc(Tab,Selector)\
static dispatch_once_t Tab;\
dispatch_once(&Tab, ^{\
    Selector\
});
#endif
/// 主线程上延迟执行某个事件
#ifndef DispathdDelaySth
#define DispathdDelaySth(Second,Sth)\
dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(Second * NSEC_PER_SEC));\
dispatch_after(delayTime, dispatch_get_main_queue(), ^{\
    Sth;\
});
#endif
/// 一个Lock 必须引入：BaseProtocol_synthesize
#ifndef JobsLock
#define JobsLock(Locked)\
if(!self.isLock){\
    Locked\
    self.isLock = !self.isLock;\
}
#endif
/// 永远异步丢到主线程（GCD）
#ifndef JobsMainQueue
#define JobsMainQueue(block) \
    dispatch_async(dispatch_get_main_queue(), block)
#endif
/// 永远丢到主线程（NSOperationQueue）
#ifndef JobsMainOperationQueue
#define JobsMainOperationQueue(block)                          \
    do {                                                       \
        [NSOperationQueue.mainQueue addOperationWithBlock:block]; \
    } while (0)
#endif

#endif /* MacroDef_QUEUE_h */
