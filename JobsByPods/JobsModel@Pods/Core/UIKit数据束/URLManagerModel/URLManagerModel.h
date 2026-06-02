//
//  URLManagerModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef URLManagerModel_h
#define URLManagerModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 建立此类的目的：防止外层调用funcName的时候因为手滑出错不易检查，导致崩溃
@interface URLManagerModel : BaseModel

Prop_copy()NSString *url;
Prop_copy()NSString *funcName;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof URLManagerModel *_Nonnull jobsMakeURLManagerModel(jobsByURLManagerModelBlock _Nonnull block){
    URLManagerModel *data = URLManagerModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* URLManagerModel_h */
