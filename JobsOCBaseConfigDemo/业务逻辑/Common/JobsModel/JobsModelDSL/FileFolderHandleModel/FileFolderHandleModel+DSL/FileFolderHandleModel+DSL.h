//
//  FileFolderHandleModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FILEFOLDERHANDLEMODEL_DSL_2AA53D957B68ECA2
#define JOBS_HEADER_GUARD_FILEFOLDERHANDLEMODEL_DSL_2AA53D957B68ECA2

#import "JobsModel.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FileFolderHandleModel (DSL)

-(JobsRetFileFolderHandleModelByAVAssetPointerBlock _Nonnull)byAsset;
-(JobsRetFileFolderHandleModelByAVAudioMixPointerBlock _Nonnull)byAudioMix;
-(JobsRetFileFolderHandleModelByDicBlock _Nonnull)byInfo;
-(JobsRetFileFolderHandleModelByDataBlock _Nonnull)byData;
-(JobsRetFileFolderHandleModelByImageBlock _Nonnull)byImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FILEFOLDERHANDLEMODEL_DSL_2AA53D957B68ECA2 */
