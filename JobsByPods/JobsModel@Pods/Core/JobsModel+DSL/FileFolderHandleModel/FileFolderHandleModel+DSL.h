//
//  FileFolderHandleModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FILEFOLDERHANDLEMODEL_DSL_8F883AEC2F94CAC6
#define JOBS_HEADER_GUARD_FILEFOLDERHANDLEMODEL_DSL_8F883AEC2F94CAC6

#if __has_include(<JobsModel/FileFolderHandleModel.h>)
#import <JobsModel/FileFolderHandleModel.h>
#else
#import "FileFolderHandleModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FileFolderHandleModel (DSL)

#pragma mark —— 来自 FileFolderHandleModel
-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(AVAsset * data))byAsset;
-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(AVAudioMix * data))byAudioMix;
-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byInfo;
-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(NSData * data))byData;
-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(UIImage * data))byImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FILEFOLDERHANDLEMODEL_DSL_8F883AEC2F94CAC6 */
