//
//  JobsResponseModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsResponseModel_h
#define JobsResponseModel_h

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
/// 后端按照标准格式返回的最外层的数据。通常我们锚定data进行解析
@interface JobsResponseModel : NSObject

Prop_assign()HTTPResponseCode code;
Prop_copy()NSString *msg;
Prop_strong()id data;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsResponseModel_h */
