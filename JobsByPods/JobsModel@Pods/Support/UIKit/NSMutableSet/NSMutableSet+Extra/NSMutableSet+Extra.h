//
//  NSMutableSet+Extra.h
//  FM
//
//  Created by User on 8/6/24.
//

#ifndef NSMutableSet_Extra_h
#define NSMutableSet_Extra_h

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

@interface NSMutableSet (Extra)
/// 阻止向可变集合添加空元素
-(JobsRetMutableSetByIDBlock _Nonnull)add;
-(JobsRetBOOLByIDBlock _Nonnull)containsObject;

@end

NS_ASSUME_NONNULL_END

#endif /* NSMutableSet_Extra_h */
