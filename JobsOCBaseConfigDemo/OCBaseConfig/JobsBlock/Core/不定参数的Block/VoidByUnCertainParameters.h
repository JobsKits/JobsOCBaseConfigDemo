//
//  VoidByUnCertainParameters.h
//  JobsBlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef VoidByUnCertainParameters_h
#define VoidByUnCertainParameters_h
/// 第一个参数写：有多少个实际参数
typedef void(^jobsDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef void(^jobsByStringAndNSUIntegerBlock)(Jobs_String_NSUInteger_Arguments);

#endif /* VoidByUnCertainParameters_h */
