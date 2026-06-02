//
//  FileFolderHandleTool.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/26.
//

#ifndef JOBS_HEADER_GUARD_FILEFOLDERHANDLETOOL_6DFD94FD70
#define JOBS_HEADER_GUARD_FILEFOLDERHANDLETOOL_6DFD94FD70

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FileFolderHandleTool : NSObject

+(JobsRetBOOLByStrBlock _Nonnull)isExistsAtPath;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FILEFOLDERHANDLETOOL_6DFD94FD70 */
