//
//  JobsOCMarkdownResourceLocator.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownResourceLocator.h"

@implementation JobsOCMarkdownResourceLocator

+(JobsRetNSBundleByVoidBlock _Nonnull)runtimeBundle{
    return ^NSBundle *{
        NSString *name = @"JobsOCMarkdownResources";
        NSArray <NSBundle *>*candidates = @[
            NSBundle.mainBundle,
            [NSBundle bundleForClass:self]
        ];
        for (NSBundle *candidate in candidates) {
            NSURL *url = [candidate URLForResource:name withExtension:@"bundle"];
            NSBundle *bundle = url ? [NSBundle bundleWithURL:url] : nil;
            if (bundle) return bundle;
        };return nil;
    };
}

+(JobsRetURLByVoidBlock _Nonnull)templateURL{
    return ^NSURL *_Nullable{
        return [self.runtimeBundle() URLForResource:@"index" withExtension:@"html"];
    };
}

@end
