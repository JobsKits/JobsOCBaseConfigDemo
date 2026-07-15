//
//  NSURLRequest+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSURLRequest+Extra.h"

@implementation NSURLRequest (Extra)
+(JobsRetURLRequestByURLBlock _Nonnull)initBy{
    return ^__kindof NSURLRequest *_Nullable(NSURL *_Nullable url){
        return [NSURLRequest requestWithURL:url];
    };
}

@end
