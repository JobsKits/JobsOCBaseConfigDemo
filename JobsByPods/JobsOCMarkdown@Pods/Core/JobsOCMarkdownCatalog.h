//
//  JobsOCMarkdownCatalog.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsOCMarkdownDocument.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSErrorDomain const JobsOCMarkdownCatalogErrorDomain;

typedef NS_ERROR_ENUM(JobsOCMarkdownCatalogErrorDomain, JobsOCMarkdownCatalogErrorCode) {
    JobsOCMarkdownCatalogErrorBundleNotFound = 1,
    JobsOCMarkdownCatalogErrorManifestNotFound,
    JobsOCMarkdownCatalogErrorInvalidManifest
};

@interface JobsOCMarkdownCatalog : NSObject

Prop_copy(readonly)NSString *projectName;
Prop_copy(readonly)NSString *generatedAt;
Prop_strong(readonly)NSURL *rootURL;
Prop_copy(readonly)NSArray <JobsOCMarkdownDocument *>*documents;
Prop_copy(readonly)NSArray <NSString *>*missingResources;

-(nullable instancetype)initWithBundleURL:(NSURL *)bundleURL
                                    error:(NSError **)error NS_DESIGNATED_INITIALIZER;
+(nullable instancetype)bundledCatalogWithError:(NSError **)error;
+(nullable instancetype)bundledCatalogInBundle:(NSBundle *)bundle
                                          named:(NSString *)name
                                          error:(NSError **)error;
-(nullable JobsOCMarkdownDocument *)documentWithRelativePath:(NSString *)relativePath;
-(nullable JobsOCMarkdownDocument *)documentWithFileURL:(NSURL *)fileURL;

-(instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
