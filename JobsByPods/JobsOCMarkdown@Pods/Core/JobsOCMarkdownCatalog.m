//
//  JobsOCMarkdownCatalog.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownCatalog.h"

NSErrorDomain const JobsOCMarkdownCatalogErrorDomain = @"com.jobs.markdown.catalog";

@implementation JobsOCMarkdownCatalog

-(instancetype)initWithBundleURL:(NSURL *)bundleURL
                            error:(NSError **)error{
    NSURL *manifestURL = [bundleURL URLByAppendingPathComponent:@"manifest.json"];
    NSData *data = [NSData dataWithContentsOfURL:manifestURL
                                        options:0
                                          error:error];
    if (!data) {
        if (error && !*error) {
            *error = [self.class errorWithCode:JobsOCMarkdownCatalogErrorManifestNotFound
                                   description:[NSString stringWithFormat:@"未找到 Markdown 清单：%@", manifestURL.path]];
        };return nil;
    }
    NSDictionary *manifest = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:error];
    if (![manifest isKindOfClass:NSDictionary.class]) {
        if (error && !*error) {
            *error = [self.class errorWithCode:JobsOCMarkdownCatalogErrorInvalidManifest
                                   description:[NSString stringWithFormat:@"Markdown 清单格式无效：%@", manifestURL.path]];
        };return nil;
    }
    if (self = [super init]) {
        _projectName = [manifest[@"projectName"] isKindOfClass:NSString.class] ? [manifest[@"projectName"] copy] : @"";
        _generatedAt = [manifest[@"generatedAt"] isKindOfClass:NSString.class] ? [manifest[@"generatedAt"] copy] : @"";
        _rootURL = [bundleURL URLByAppendingPathComponent:@"Documents" isDirectory:YES];
        _missingResources = [manifest[@"missingResources"] isKindOfClass:NSArray.class]
            ? [manifest[@"missingResources"] copy]
            : @[];
        NSMutableArray <JobsOCMarkdownDocument *>*documents = NSMutableArray.array;
        for (NSDictionary *item in manifest[@"documents"]) {
            if (![item isKindOfClass:NSDictionary.class]) continue;
            NSString *identifier = [item[@"id"] isKindOfClass:NSString.class] ? item[@"id"] : @"";
            NSString *title = [item[@"title"] isKindOfClass:NSString.class] ? item[@"title"] : @"";
            NSString *relativePath = [item[@"relativePath"] isKindOfClass:NSString.class] ? item[@"relativePath"] : @"";
            NSString *resourcePath = [item[@"resourcePath"] isKindOfClass:NSString.class] ? item[@"resourcePath"] : @"";
            if (!identifier.length || !relativePath.length || !resourcePath.length) continue;
            [documents addObject:[[JobsOCMarkdownDocument alloc]
                                  initWithIdentifier:identifier
                                  title:title.length ? title : relativePath.lastPathComponent.stringByDeletingPathExtension
                                  relativePath:relativePath
                                  fileURL:[bundleURL URLByAppendingPathComponent:resourcePath]
                                  contentRootURL:_rootURL]];
        }
        _documents = documents.copy;
    };return self;
}

+(instancetype)bundledCatalogWithError:(NSError **)error{
    return [self bundledCatalogInBundle:NSBundle.mainBundle
                                  named:@"JobsMarkdownDocuments"
                                  error:error];
}

+(instancetype)bundledCatalogInBundle:(NSBundle *)bundle
                                 named:(NSString *)name
                                 error:(NSError **)error{
    NSURL *bundleURL = [bundle URLForResource:name withExtension:@"bundle"];
    if (!bundleURL) {
        if (error) {
            *error = [self errorWithCode:JobsOCMarkdownCatalogErrorBundleNotFound
                             description:[NSString stringWithFormat:@"未找到 %@.bundle，请确认 Markdown 文档打包阶段已经执行。", name]];
        };return nil;
    };return [[self alloc] initWithBundleURL:bundleURL error:error];
}

-(JobsOCMarkdownDocument *)documentWithRelativePath:(NSString *)relativePath{
    NSString *normalizedPath = (relativePath.stringByRemovingPercentEncoding ?: relativePath);
    normalizedPath = [normalizedPath stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
    for (JobsOCMarkdownDocument *document in self.documents) {
        if ([document.relativePath isEqualToString:normalizedPath]) return document;
    };return nil;
}

-(JobsOCMarkdownDocument *)documentWithFileURL:(NSURL *)fileURL{
    NSURL *normalizedURL = fileURL.standardizedURL;
    for (JobsOCMarkdownDocument *document in self.documents) {
        if ([document.fileURL.standardizedURL isEqual:normalizedURL]) return document;
    };return nil;
}

+(NSError *)errorWithCode:(JobsOCMarkdownCatalogErrorCode)code
              description:(NSString *)description{
    return [NSError errorWithDomain:JobsOCMarkdownCatalogErrorDomain
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey : description ?: @""}];
}

@end
