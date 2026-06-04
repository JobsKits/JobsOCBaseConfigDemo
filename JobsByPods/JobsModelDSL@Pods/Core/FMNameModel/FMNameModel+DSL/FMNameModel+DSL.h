//
//  FMNameModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FMNAMEMODEL_DSL_17606A718F0C4D6C
#define JOBS_HEADER_GUARD_FMNAMEMODEL_DSL_17606A718F0C4D6C

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMNameModel (DSL)

-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byFirstNameTF;
-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byMiddleNameTF;
-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byLastNameTF;
-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byIdTypeTF;
-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byIdNumberTF;
-(JobsRetFMNameModelByStrBlock _Nonnull)byFirstName;
-(JobsRetFMNameModelByStrBlock _Nonnull)byMiddleName;
-(JobsRetFMNameModelByStrBlock _Nonnull)byLastName;
-(JobsRetFMNameModelByStrBlock _Nonnull)byIdType;
-(JobsRetFMNameModelByStrBlock _Nonnull)byIdNumber;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FMNAMEMODEL_DSL_17606A718F0C4D6C */
