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
        configuration.timeoutIntervalForResource = 7 * 24 * 60 * 60;
        _wiFiVideoSession = [NSURLSession sessionWithConfiguration:configuration];
        _stateQueue = dispatch_queue_create("com.jobs.splash.video-preload", DISPATCH_QUEUE_SERIAL);
        _videoTasks = NSMutableDictionary.dictionary;
        _videoCompletions = NSMutableDictionary.dictionary;
        _videoRetryAttempts = NSMutableDictionary.dictionary;
        _scheduledVideoRetries = NSMutableSet.set;
        NSArray<NSString *> *pendingURLs = [NSUserDefaults.standardUserDefaults stringArrayForKey:JobsOCSplashPendingVideoURLsKey] ?: @[];
        dispatch_async(_stateQueue, ^{
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
        NSURL *fileURL = self.localFileURLForRemoteURL(remoteURL);
        NSDictionary<NSFileAttributeKey, id> *attributes = [self.fileManager attributesOfItemAtPath:fileURL.path error:nil];
        if (!attributes || [attributes[NSFileSize] unsignedLongLongValue] == 0) {
            [self.fileManager removeItemAtURL:fileURL error:nil];
            return nil;
        };return fileURL;
    };
}

-(nullable NSURLSessionDownloadTask *)download:(NSURL *)remoteURL completion:(JobsOCSplashMediaCacheCompletion)completion {
    NSURL *cachedURL = self.cachedFileURLForRemoteURL(remoteURL);
    if (cachedURL) {
        if (completion) completion(cachedURL, nil);
        return nil;
    }
    NSURLSessionDownloadTask *task = [NSURLSession.sharedSession downloadTaskWithURL:remoteURL completionHandler:^(NSURL *temporaryURL, NSURLResponse *response, NSError *error) {
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
        NSURL *destinationURL = self.localFileURLForRemoteURL(remoteURL);
        NSError *moveError = nil;
        if ([self.fileManager fileExistsAtPath:destinationURL.path]) {
            [self.fileManager removeItemAtURL:destinationURL error:nil];
        }
        [self.fileManager moveItemAtURL:temporaryURL toURL:destinationURL error:&moveError];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(moveError ? nil : destinationURL, moveError);
        });
        (void)response;
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
    NSDictionary<NSFileAttributeKey, id> *attributes = [self.fileManager attributesOfItemAtPath:temporaryURL.path error:error];
    if (!attributes || [attributes[NSFileSize] unsignedLongLongValue] == 0) {
        if (error && !*error) {
            *error = [self downloadErrorWithCode:-2
                                     description:@"Remote video download returned an empty file."];
        };return nil;
    }
    NSURL *destinationURL = self.localFileURLForRemoteURL(remoteURL);
    if ([self.fileManager fileExistsAtPath:destinationURL.path]) {
        [self.fileManager removeItemAtURL:destinationURL error:nil];
    }
    if (![self.fileManager moveItemAtURL:temporaryURL toURL:destinationURL error:error]) return nil;
    return destinationURL;
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
