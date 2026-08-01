//
//  JobsOCMarkdownDocument.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownDocument.h"

@implementation JobsOCMarkdownDocument

-(instancetype)initWithIdentifier:(NSString *)identifier
                            title:(NSString *)title
                     relativePath:(NSString *)relativePath
                          fileURL:(NSURL *)fileURL
                   contentRootURL:(NSURL *)contentRootURL{
    if (self = [super init]) {
        _identifier = identifier.copy;
        _title = title.copy;
        _relativePath = relativePath.copy;
        _fileURL = fileURL;
        _contentRootURL = contentRootURL;
    };return self;
}

-(BOOL)isEqual:(id)object{
    if (self == object) return YES;
    if (![object isKindOfClass:JobsOCMarkdownDocument.class]) return NO;
    return [self.identifier isEqualToString:((JobsOCMarkdownDocument *)object).identifier];
}

-(NSUInteger)hash{
    return self.identifier.hash;
}

@end
