//
//  JobsOCMarkdownDocument.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCMarkdownDocument : NSObject

Prop_copy(readonly)NSString *identifier;
Prop_copy(readonly)NSString *title;
Prop_copy(readonly)NSString *relativePath;
Prop_strong(readonly)NSURL *fileURL;
Prop_strong(readonly)NSURL *contentRootURL;

-(instancetype)initWithIdentifier:(NSString *)identifier
                            title:(NSString *)title
                     relativePath:(NSString *)relativePath
                          fileURL:(NSURL *)fileURL
                   contentRootURL:(NSURL *)contentRootURL NS_DESIGNATED_INITIALIZER;

-(instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
