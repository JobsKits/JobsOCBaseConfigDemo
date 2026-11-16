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
    JobsRetBOOLByIDBlock action = ((JobsRetBOOLByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocument.class, @selector(jobsIsEqual)))(self, @selector(jobsIsEqual));
    return action ? action(object) : NO;
}

-(JobsRetBOOLByIDBlock _Nonnull)jobsIsEqual{
    @jobs_weakify(self)
    return ^BOOL(id object){
        @jobs_strongify(self)
        if (!self) return NO;
        if (self == object) return YES;
        if (![object isKindOfClass:JobsOCMarkdownDocument.class]) return NO;
        return [self.identifier isEqualToString:((JobsOCMarkdownDocument *)object).identifier];
    };
}

-(NSUInteger)hash{
    JobsRetNSUIntegerByVoidBlock action = ((JobsRetNSUIntegerByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocument.class, @selector(jobsHash)))(self, @selector(jobsHash));
    return action ? action() : (NSUInteger){0};
}

-(JobsRetNSUIntegerByVoidBlock _Nonnull)jobsHash{
    @jobs_weakify(self)
    return ^NSUInteger{
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        return self.identifier.hash;
    };
}

@end
