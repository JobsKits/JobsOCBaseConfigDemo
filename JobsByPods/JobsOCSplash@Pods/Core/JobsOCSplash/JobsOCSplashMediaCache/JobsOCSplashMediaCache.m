//
//  JobsOCSplashMediaCache.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashMediaCache.h"

@interface JobsOCSplashMediaCache ()

Prop_strong() NSFileManager *fileManager;
Prop_strong() NSURL *directoryURL;

@end

@implementation JobsOCSplashMediaCache

+(instancetype)shared {
    static JobsOCSplashMediaCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = JobsOCSplashMediaCache.alloc.init;
    });
    return cache;
}

-(instancetype)init {
    if (self = [super init]) {
        _fileManager = NSFileManager.defaultManager;
        NSURL *cachesURL = [_fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].firstObject;
        _directoryURL = [cachesURL URLByAppendingPathComponent:@"JobsOCSplash" isDirectory:YES];
        [_fileManager createDirectoryAtURL:_directoryURL withIntermediateDirectories:YES attributes:nil error:nil];
    };return self;
}

-(nullable NSURL *)cachedFileURLForRemoteURL:(NSURL *)remoteURL {
    NSURL *fileURL = [self localFileURLForRemoteURL:remoteURL];
    return [self.fileManager fileExistsAtPath:fileURL.path] ? fileURL : nil;
}

-(nullable NSURLSessionDownloadTask *)download:(NSURL *)remoteURL completion:(JobsOCSplashMediaCacheCompletion)completion {
    NSURL *cachedURL = [self cachedFileURLForRemoteURL:remoteURL];
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

        NSURL *destinationURL = [self localFileURLForRemoteURL:remoteURL];
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
    [task resume];
    return task;
}

-(NSURL *)localFileURLForRemoteURL:(NSURL *)remoteURL {
    NSString *fileExtension = remoteURL.pathExtension.length ? remoteURL.pathExtension : @"data";
    return [[self.directoryURL URLByAppendingPathComponent:[self stableHash:remoteURL.absoluteString]] URLByAppendingPathExtension:fileExtension];
}

-(NSString *)stableHash:(NSString *)value {
    uint64_t hash = 14695981039346656037ULL;
    const char *string = value.UTF8String;
    while (*string) {
        hash ^= (uint64_t)(unsigned char)(*string++);
        hash *= 1099511628211ULL;
    };return [NSString stringWithFormat:@"%llx", hash];
}

@end
