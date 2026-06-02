//
//  ASDefaultImageDownloader.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASImageProtocols.h>

NS_ASSUME_NONNULL_BEGIN

typedef id<ASImageDownloaderProtocol>_Nullable(^ASImageDownloaderProvider)(void);
typedef id<ASImageCacheProtocol>_Nullable(^ASImageCacheProvider)(void);

@interface ASDefaultImageDownloader : NSObject

+ (nullable id<ASImageDownloaderProtocol>)defaultDownloader;
+ (nullable id<ASImageCacheProtocol>)defaultCache;

+ (void)setDefaultDownloaderProvider:(ASImageDownloaderProvider _Nonnull)downloaderProvider
                       cacheProvider:(ASImageCacheProvider _Nonnull)cacheProvider;

@end

NS_ASSUME_NONNULL_END
