//
//  ASBasicImageDownloaderInternal.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

@interface ASBasicImageDownloaderContext : NSObject

+ (ASBasicImageDownloaderContext *)contextForURL:(NSURL *)URL;

@property (nonatomic, readonly) NSURL *URL;
@property (nonatomic, weak) NSURLSessionTask *sessionTask;

- (BOOL)isCancelled;
- (void)cancel;

@end
