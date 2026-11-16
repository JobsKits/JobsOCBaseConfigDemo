//
//  ReturnByUnCertainParameters.h
//  JobsBlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#ifndef ReturnByUnCertainParameters_h
#define ReturnByUnCertainParameters_h
/// 第一个参数写：有多少个实际参数
/// 返回对象
typedef id _Nullable(^JobsRetIDByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef NSNumber *_Nullable(^JobsRetNSNumberByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
/// 返回基本数据类型
typedef NSInteger(^JobsRetNSIntegerByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef NSUInteger(^JobsRetNSUIntegerByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef float(^JobsRetFloatByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef CGFloat(^JobsRetCGFloatByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
/// 返回结构体
typedef CGSize(^JobsRetCGSizeByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef CGRect(^JobsRetCGRectByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef CGPoint(^JobsRetCGPointByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);

#endif /* ReturnByUnCertainParameters_h */