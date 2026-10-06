//
//  JobsOCSplashMediaCache.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashMediaCache.h"

static NSString * const JobsOCSplashPendingVideoURLsKey = @"JobsOCSplash.pendingVideoURLs";

@interface JobsOCSplashMediaCache ()

Prop_strong() NSFileManager *fileManager;
Prop_strong() NSURL *directoryURL;
Prop_strong() NSURLSession *wiFiVideoSession;
Prop_strong() dispatch_queue_t stateQueue;
Prop_strong() NSMutableDictionary<NSString *, NSURLSessionDownloadTask *> *videoTasks;
Prop_strong() NSMutableDictionary<NSString *, NSMutableArray *> *videoCompletions;
Prop_strong() NSMutableDictionary<NSString *, NSNumber *> *videoRetryAttempts;
Prop_strong() NSMutableSet<NSString *> *scheduledVideoRetries;
@property(nonatomic, strong)NSMutableDictionary<NSString *, NSMutableDictionary *> *imageTransfers;

-(jobsByURLBlock _Nonnull)startVideoDownload;
-(nullable NSURL *)persistDownloadedFile:(NSURL *)temporaryURL
                            forRemoteURL:(NSURL *)remoteURL
                                   error:(NSError **)error;
-(void)handleVideoDownloadForRemoteURL:(NSURL *)remoteURL
                               fileURL:(nullable NSURL *)fileURL
                                 error:(nullable NSError *)error;
-(JobsRetNSTimeIntervalByNSIntegerBlock _Nonnull)retryDelayForAttempt;
-(jobsByURLBlock _Nonnull)addPendingVideoURL;
-(jobsByURLBlock _Nonnull)removePendingVideoURL;
-(NSError *)downloadErrorWithCode:(NSInteger)code description:(NSString *)description;
-(JobsRetURLByURLBlock _Nonnull)localFileURLForRemoteURL;
-(JobsRetStrByStrBlock _Nonnull)stableHash;
-(jobsByURLBlock _Nonnull)trimCacheKeepingURL;

@end

@implementation JobsOCSplashMediaCache
+(JobsRetIDByVoidBlock _Nonnull)shared {
    return ^id{
        static JobsOCSplashMediaCache *cache = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cache = JobsOCSplashMediaCache.alloc.init;
        });
        return cache;
    };
}

-(instancetype)init {
    if (self = [super init]) {
        _fileManager = NSFileManager.defaultManager;
        NSURL *cachesURL = [_fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].firstObject;
        _directoryURL = [cachesURL URLByAppendingPathComponent:@"JobsOCSplash" isDirectory:YES];
        [_fileManager createDirectoryAtURL:_directoryURL withIntermediateDirectories:YES attributes:nil error:nil];
        NSURLSessionConfiguration *configuration = NSURLSessionConfiguration.defaultSessionConfiguration;
        configuration.allowsCellularAccess = NO;
        if (@available(iOS 11.0, *)) configuration.waitsForConnectivity = YES;
        configuration.networkServiceType = NSURLNetworkServiceTypeBackground;
        configuration.timeoutIntervalForRequest = 60;
        configuration.timeoutIntervalForResource = 30 * 60;
        _wiFiVideoSession = [NSURLSession sessionWithConfiguration:configuration];
        _stateQueue = dispatch_queue_create("com.jobs.splash.video-preload", DISPATCH_QUEUE_SERIAL);
        _videoTasks = NSMutableDictionary.dictionary;
        _videoCompletions = NSMutableDictionary.dictionary;
        _videoRetryAttempts = NSMutableDictionary.dictionary;
        _scheduledVideoRetries = NSMutableSet.set;
        _imageTransfers = NSMutableDictionary.dictionary;
        NSArray<NSString *> *pendingURLs = [NSUserDefaults.standardUserDefaults stringArrayForKey:JobsOCSplashPendingVideoURLsKey] ?: @[];
        dispatch_async(_stateQueue, ^{
            self.trimCacheKeepingURL(nil);
            for (NSString *URLString in pendingURLs) {
                NSURL *remoteURL = [NSURL URLWithString:URLString];
                if (!remoteURL) continue;
                if (self.cachedFileURLForRemoteURL(remoteURL)) {
                    self.removePendingVideoURL(remoteURL);
                } else {
                    self.startVideoDownload(remoteURL);
                }
            }
        });
    };return self;
}

-(jobsByVoidBlock _Nonnull)resumePendingVideoPreloads {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    };
}

-(JobsRetURLByURLBlock _Nonnull)cachedFileURLForRemoteURL{
    @jobs_weakify(self)
    return ^NSURL *(NSURL *remoteURL){
        @jobs_strongify(self)
        if (!self) return nil;
        @synchronized (self) {
            NSURL *fileURL = self.localFileURLForRemoteURL(remoteURL);
            NSDictionary<NSFileAttributeKey, id> *attributes = [self.fileManager attributesOfItemAtPath:fileURL.path error:nil];
            NSDate *modified = attributes[NSFileModificationDate];
            BOOL expired = modified && [NSDate.date timeIntervalSinceDate:modified] > 7 * 24 * 60 * 60;
            if (!attributes || [attributes[NSFileSize] unsignedLongLongValue] == 0 || expired) {
                [self.fileManager removeItemAtURL:fileURL error:nil];
                return nil;
            }
            return fileURL;
        }
    };
}

-(nullable JobsOCSplashMediaDownloadToken *)downloadImage:(NSURL *)remoteURL completion:(JobsOCSplashMediaCacheCompletion)completion{
    if (!remoteURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(nil, [self downloadErrorWithCode:-1 description:@"图片 URL 不能为空"]);
        });
        return nil;
    }
    NSString *key = remoteURL.absoluteString;
    NSUUID *identifier = NSUUID.UUID;
    NSString *subscriptionKey = identifier.UUIDString;
    @jobs_weakify(self)
    JobsOCSplashMediaDownloadToken *token = [[JobsOCSplashMediaDownloadToken alloc]
        initWithIdentifier:identifier cancellation:^{
            @jobs_strongify(self)
            if (!self) return;
            dispatch_async(self.stateQueue, ^{
                NSMutableDictionary *transfer = self.imageTransfers[key];
                NSMutableDictionary *subscribers = transfer[@"subscribers"];
                [subscribers removeObjectForKey:subscriptionKey];
                if (transfer && !subscribers.count) {
                    [self.imageTransfers removeObjectForKey:key];
                    NSURLSessionDownloadTask *task = transfer[@"task"];
                    [task cancel];
                }
            });
        }];
    __weak JobsOCSplashMediaDownloadToken *weakToken = token;
    JobsOCSplashMediaCacheCompletion subscriber = ^(NSURL *URL, NSError *error) {
        JobsOCSplashMediaDownloadToken *owner = weakToken;
        if (!owner || owner.isCancelled) return;
        if (completion) completion(URL, error);
    };
    dispatch_async(self.stateQueue, ^{
        if (token.isCancelled) return;
        NSMutableDictionary *transfer = self.imageTransfers[key];
        if (transfer) {
            transfer[@"subscribers"][subscriptionKey] = [subscriber copy];
            return;
        }
        NSUUID *transferIdentifier = NSUUID.UUID;
        transfer = [@{@"identifier":transferIdentifier,
                      @"subscribers":[NSMutableDictionary dictionaryWithObject:[subscriber copy] forKey:subscriptionKey]} mutableCopy];
        self.imageTransfers[key] = transfer;
        NSURLSessionDownloadTask *task = [self download:remoteURL completion:^(NSURL *URL, NSError *error) {
            dispatch_async(self.stateQueue, ^{
                NSMutableDictionary *finishedTransfer = self.imageTransfers[key];
                if (![finishedTransfer[@"identifier"] isEqual:transferIdentifier]) return;
                [self.imageTransfers removeObjectForKey:key];
                NSArray *callbacks = [finishedTransfer[@"subscribers"] allValues];
                dispatch_async(dispatch_get_main_queue(), ^{
                    for (JobsOCSplashMediaCacheCompletion callback in callbacks) {
                        callback(URL, error);
                    }
                });
            });
        }];
        if (task) transfer[@"task"] = task;
    });
    return token;
}

-(nullable NSURLSessionDownloadTask *)download:(NSURL *)remoteURL completion:(JobsOCSplashMediaCacheCompletion)completion {
    NSURL *cachedURL = self.cachedFileURLForRemoteURL(remoteURL);
    if (cachedURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(cachedURL, nil);
        });
        return nil;
    }
    NSURLSessionDownloadTask *task = [NSURLSession.sharedSession downloadTaskWithURL:remoteURL completionHandler:^(NSURL *temporaryURL, NSURLResponse *response, NSError *error) {
        if (!error && [response isKindOfClass:NSHTTPURLResponse.class]) {
            NSInteger status = ((NSHTTPURLResponse *)response).statusCode;
            if (status < 200 || status > 299) {
                error = [self downloadErrorWithCode:status description:@"远程图片 HTTP 状态失败"];
            } else if (response.MIMEType.length &&
                       ![response.MIMEType.lowercaseString hasPrefix:@"image/"] &&
                       ![response.MIMEType.lowercaseString isEqualToString:@"application/octet-stream"]) {
                error = [self downloadErrorWithCode:-3 description:@"远程图片 Content-Type 无效"];
            }
        }
        if (!error && temporaryURL) {
            NSData *data = [NSData dataWithContentsOfURL:temporaryURL options:NSDataReadingMappedIfSafe error:&error];
            CGImageSourceRef source = data.length && data.length <= 16 * 1024 * 1024 ?
                CGImageSourceCreateWithData((__bridge CFDataRef)data, nil) : nil;
            size_t count = source ? CGImageSourceGetCount(source) : 0;
            BOOL valid = count > 0 && count <= 120;
            uint64_t pixels = 0;
            for (size_t index = 0; valid && index < count; index++) {
                NSDictionary *properties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(source, index, nil));
                uint64_t width = [properties[(NSString *)kCGImagePropertyPixelWidth] unsignedLongLongValue];
                uint64_t height = [properties[(NSString *)kCGImagePropertyPixelHeight] unsignedLongLongValue];
                valid = width > 0 && height > 0 && width <= 8192 && height <= 8192 &&
                    width * height <= 24 * 1024 * 1024 - pixels;
                if (valid) pixels += width * height;
            }
            CGImageRef decoded = valid ? CGImageSourceCreateImageAtIndex(source, 0, nil) : nil;
            if (!decoded) {
                error = [self downloadErrorWithCode:-3 description:@"远程图片内容无效或超出大小限制"];
            }
            if (decoded) CGImageRelease(decoded);
            if (source) CFRelease(source);
        }
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) completion(nil, error);
            });
            return;
        }
        if (!temporaryURL) {
            NSError *emptyError = [NSError errorWithDomain:@"JobsOCSplash.Download" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Remote media download returned no file."}];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) completion(nil, emptyError);
            });
            return;
        }
        NSError *moveError = nil;
        NSURL *destinationURL = [self persistDownloadedFile:temporaryURL forRemoteURL:remoteURL error:&moveError];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(moveError ? nil : destinationURL, moveError);
        });
    }];
    task.resume;
    return task;
}

-(void)preloadVideo:(NSURL *)remoteURL completion:(jobsByURLBlock)completion {
    NSURL *cachedURL = self.cachedFileURLForRemoteURL(remoteURL);
    if (cachedURL) {
        dispatch_async(self.stateQueue, ^{
            self.removePendingVideoURL(remoteURL);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(cachedURL);
        });
        return;
    }
    dispatch_async(self.stateQueue, ^{
        self.addPendingVideoURL(remoteURL);
        if (completion) {
            NSMutableArray *completions = self.videoCompletions[remoteURL.absoluteString];
            if (!completions) {
                completions = NSMutableArray.array;
                self.videoCompletions[remoteURL.absoluteString] = completions;
            }
            [completions addObject:[completion copy]];
        }
        NSString *key = remoteURL.absoluteString;
        if (self.videoTasks[key] || [self.scheduledVideoRetries containsObject:key]) return;
        self.startVideoDownload(remoteURL);
    });
}

-(jobsByURLBlock _Nonnull)startVideoDownload{
    @jobs_weakify(self)
    return ^(NSURL * remoteURL){
        @jobs_strongify(self)
        if (!self) return;
        NSString *key = remoteURL.absoluteString;
        if (self.videoTasks[key]) return;
        NSURLSessionDownloadTask *task = [self.wiFiVideoSession downloadTaskWithURL:remoteURL
                                                                 completionHandler:^(NSURL *temporaryURL, NSURLResponse *response, NSError *error) {
            NSError *resultError = error;
            if (!resultError && [response isKindOfClass:NSHTTPURLResponse.class]) {
                NSInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
                if (statusCode < 200 || statusCode > 299) {
                    resultError = [self downloadErrorWithCode:statusCode
                                                  description:[NSString stringWithFormat:@"Remote video returned HTTP %ld.", (long)statusCode]];
                }
            }
            NSURL *fileURL = nil;
            if (!resultError && temporaryURL) {
                fileURL = [self persistDownloadedFile:temporaryURL
                                         forRemoteURL:remoteURL
                                                error:&resultError];
            } else if (!resultError) {
                resultError = [self downloadErrorWithCode:-1
                                              description:@"Remote video download returned no file."];
            }
            dispatch_async(self.stateQueue, ^{
                [self handleVideoDownloadForRemoteURL:remoteURL
                                              fileURL:fileURL
                                                error:resultError];
            });
        }];
        self.videoTasks[key] = task;
        task.resume;
    };
}

-(nullable NSURL *)persistDownloadedFile:(NSURL *)temporaryURL
                            forRemoteURL:(NSURL *)remoteURL
                                   error:(NSError **)error {
    @synchronized (self) {
        NSDictionary<NSFileAttributeKey, id> *attributes = [self.fileManager attributesOfItemAtPath:temporaryURL.path error:error];
        if (!attributes || [attributes[NSFileSize] unsignedLongLongValue] == 0 ||
            [attributes[NSFileSize] unsignedLongLongValue] > 128 * 1024 * 1024) {
            if (error && !*error) {
                *error = [self downloadErrorWithCode:-2
                                         description:@"媒体文件为空或超过单文件 128 MiB 限制"];
            };return nil;
        }
        NSURL *destinationURL = self.localFileURLForRemoteURL(remoteURL);
        NSURL *stagingURL = [self.directoryURL URLByAppendingPathComponent:[@".stage-" stringByAppendingString:NSUUID.UUID.UUIDString]];
        if (![self.fileManager copyItemAtURL:temporaryURL toURL:stagingURL error:error]) {
            [self.fileManager removeItemAtURL:stagingURL error:nil];
            return nil;
        }
        if (rename(stagingURL.fileSystemRepresentation, destinationURL.fileSystemRepresentation) != 0) {
            int failure = errno;
            [self.fileManager removeItemAtURL:stagingURL error:nil];
            if (error) *error = [NSError errorWithDomain:NSPOSIXErrorDomain code:failure userInfo:nil];
            return nil;
        }
        self.trimCacheKeepingURL(destinationURL);
        return destinationURL;
    }
}

-(jobsByURLBlock _Nonnull)trimCacheKeepingURL{
    @jobs_weakify(self)
    return ^(NSURL *keptURL) {
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
            NSArray<NSURL *> *files = [self.fileManager contentsOfDirectoryAtURL:self.directoryURL
                                                    includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
            NSMutableArray<NSDictionary *> *candidates = NSMutableArray.array;
            long double total = 0;
            NSDate *now = NSDate.date;
            for (NSURL *file in files) {
                NSDictionary *attributes = [self.fileManager attributesOfItemAtPath:file.path error:nil];
                if (![attributes[NSFileType] isEqualToString:NSFileTypeRegular]) continue;
                uint64_t size = [attributes[NSFileSize] unsignedLongLongValue];
                NSDate *modified = attributes[NSFileModificationDate] ?: NSDate.distantPast;
                if (![file isEqual:keptURL] &&
                    (!size || size > 128 * 1024 * 1024 || [now timeIntervalSinceDate:modified] > 7 * 24 * 60 * 60)) {
                    [self.fileManager removeItemAtURL:file error:nil];
                    continue;
                }
                total += size;
                [candidates addObject:@{@"URL":file, @"size":@(size), @"date":modified}];
            }
            [candidates sortUsingComparator:^NSComparisonResult(NSDictionary *left, NSDictionary *right) {
                return [left[@"date"] compare:right[@"date"]];
            }];
            for (NSDictionary *candidate in candidates) {
                if (total <= 256 * 1024 * 1024) break;
                NSURL *file = candidate[@"URL"];
                if ([file isEqual:keptURL]) continue;
                if ([self.fileManager removeItemAtURL:file error:nil]) {
                    total -= [candidate[@"size"] unsignedLongLongValue];
                }
            }
        }
    };
}

-(void)handleVideoDownloadForRemoteURL:(NSURL *)remoteURL
                               fileURL:(NSURL *)fileURL
                                 error:(NSError *)error {
    NSString *key = remoteURL.absoluteString;
    [self.videoTasks removeObjectForKey:key];
    if (fileURL && !error) {
        [self.videoRetryAttempts removeObjectForKey:key];
        [self.scheduledVideoRetries removeObject:key];
        self.removePendingVideoURL(remoteURL);
        NSArray *completions = [self.videoCompletions[key] copy] ?: @[];
        [self.videoCompletions removeObjectForKey:key];
        dispatch_async(dispatch_get_main_queue(), ^{
            for (jobsByURLBlock completion in completions) {
                completion(fileURL);
            }
        });
        return;
    }
    NSInteger attempt = self.videoRetryAttempts[key].integerValue + 1;
    BOOL terminalHTTP = [error.domain isEqualToString:@"JobsOCSplash.VideoPreload"] &&
        error.code >= 400 && error.code < 500 && error.code != 408 && error.code != 429;
    if (terminalHTTP || attempt >= 5 || error.code == NSURLErrorCancelled) {
        [self.videoRetryAttempts removeObjectForKey:key];
        [self.scheduledVideoRetries removeObject:key];
        self.removePendingVideoURL(remoteURL);
        NSArray *completions = self.videoCompletions[key].copy ?: @[];
        [self.videoCompletions removeObjectForKey:key];
        dispatch_async(dispatch_get_main_queue(), ^{
            for (jobsByURLBlock completion in completions) completion(nil);
        });
        return;
    }
    self.videoRetryAttempts[key] = @(attempt);
    [self.scheduledVideoRetries addObject:key];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.retryDelayForAttempt(attempt) * NSEC_PER_SEC)),
                   self.stateQueue, ^{
        [self.scheduledVideoRetries removeObject:key];
        NSURL *cachedURL = self.cachedFileURLForRemoteURL(remoteURL);
        if (cachedURL) {
            [self handleVideoDownloadForRemoteURL:remoteURL fileURL:cachedURL error:nil];
        } else {
            self.startVideoDownload(remoteURL);
        }
    });
}

-(JobsRetNSTimeIntervalByNSIntegerBlock _Nonnull)retryDelayForAttempt{
    @jobs_weakify(self)
    return ^NSTimeInterval(NSInteger attempt){
        @jobs_strongify(self)
        if (!self) return (NSTimeInterval){0};
        NSInteger exponent = MIN(MAX(0, attempt - 1), 6);
        NSTimeInterval delay = 5;
        for (NSInteger index = 0; index < exponent; index++) {
            delay *= 2;
        };return MIN(300, delay);
    };
}

-(jobsByURLBlock _Nonnull)addPendingVideoURL{
    @jobs_weakify(self)
    return ^(NSURL * remoteURL){
        @jobs_strongify(self)
        if (!self) return;
        NSMutableOrderedSet<NSString *> *pendingURLs = [NSMutableOrderedSet orderedSetWithArray:
                                                        [NSUserDefaults.standardUserDefaults stringArrayForKey:JobsOCSplashPendingVideoURLsKey] ?: @[]];
        [pendingURLs addObject:remoteURL.absoluteString];
        [NSUserDefaults.standardUserDefaults setObject:[pendingURLs.array sortedArrayUsingSelector:@selector(compare:)]
                                                forKey:JobsOCSplashPendingVideoURLsKey];
    };
}

-(jobsByURLBlock _Nonnull)removePendingVideoURL{
    @jobs_weakify(self)
    return ^(NSURL * remoteURL){
        @jobs_strongify(self)
        if (!self) return;
        NSMutableOrderedSet<NSString *> *pendingURLs = [NSMutableOrderedSet orderedSetWithArray:
                                                        [NSUserDefaults.standardUserDefaults stringArrayForKey:JobsOCSplashPendingVideoURLsKey] ?: @[]];
        [pendingURLs removeObject:remoteURL.absoluteString];
        [NSUserDefaults.standardUserDefaults setObject:[pendingURLs.array sortedArrayUsingSelector:@selector(compare:)]
                                                forKey:JobsOCSplashPendingVideoURLsKey];
    };
}

-(NSError *)downloadErrorWithCode:(NSInteger)code description:(NSString *)description {
    return [NSError errorWithDomain:@"JobsOCSplash.VideoPreload"
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey: description}];
}

-(JobsRetURLByURLBlock _Nonnull)localFileURLForRemoteURL{
    @jobs_weakify(self)
    return ^NSURL *(NSURL * remoteURL){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *fileExtension = remoteURL.pathExtension.length ? remoteURL.pathExtension : @"data";
        return [[self.directoryURL URLByAppendingPathComponent:self.stableHash(remoteURL.absoluteString)] URLByAppendingPathExtension:fileExtension];
    };
}

-(JobsRetStrByStrBlock _Nonnull)stableHash{
    @jobs_weakify(self)
    return ^NSString *(NSString * value){
        @jobs_strongify(self)
        if (!self) return nil;
        uint64_t hash = 14695981039346656037ULL;
        const char *string = value.UTF8String;
        while (*string) {
            hash ^= (uint64_t)(unsigned char)(*string++);
            hash *= 1099511628211ULL;
        };return [NSString stringWithFormat:@"%llx", hash];
    };
}

@end
