//
//  JSValue+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JSValue+Extra.h"

@implementation JSValue (Extra)
/// 随时传入一段 JavaScript 代码，并获取执行的结果
-(JobsRetJSValueByStrBlock _Nonnull)evaluateScript{
    return ^JSValue *_Nullable(NSString *_Nullable jsCode){
        return [JSContext.alloc.init evaluateScript:jsCode];
    };
}

@end
