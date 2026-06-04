//
//  UITextFieldModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef UITextFieldModel_h
#define UITextFieldModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

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

@interface UITextFieldModel : BaseModel <UITextFieldProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UITextFieldModel *_Nonnull jobsMakeTextFieldModel(jobsByTextFieldModelBlock _Nonnull block){
    UITextFieldModel *data = UITextFieldModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* UITextFieldModel_h */
