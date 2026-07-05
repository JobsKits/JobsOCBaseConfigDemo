//
//  ASNetworkImageNode+DSL.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ASNETWORKIMAGENODE_DSL_EC9A3059AA
#define JOBS_HEADER_GUARD_ASNETWORKIMAGENODE_DSL_EC9A3059AA

#import <AsyncDisplayKit/AsyncDisplayKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASNetworkImageNode (DSL)

-(instancetype)byInitWithCache:(id<ASImageCacheProtocol> _Nullable)cache
                    downloader:(id<ASImageDownloaderProtocol>)downloader;

-(instancetype)bySetURL:(NSURL * _Nullable)url resetToDefault:(BOOL)reset;

+(JobsRetClassByBOOLBlock _Nonnull)byUseMainThreadDelegateCallbacks;

-(JobsRetNetworkImageNodeByDelegateBlock _Nonnull)byDelegate;
-(JobsRetNetworkImageNodeByImageBlock _Nonnull)byImage;
-(JobsRetNetworkImageNodeByImageBlock _Nonnull)byDefaultImage;
-(JobsRetNetworkImageNodeByURLBlock _Nonnull)byURL;
-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldCacheImage;
-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldRenderProgressImages;
-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldRetryImageDownload;

-(CGFloat)by_currentImageQuality;
-(CGFloat)by_renderedImageQuality;
-(CGFloat)by_downloadProgress;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASNETWORKIMAGENODE_DSL_EC9A3059AA */
