//
//  NSString+Menu.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Menu.h"

@implementation NSString (Menu)

-(JobsRetMenuItemBySELBlock _Nonnull)initMenuItemBy{
    @jobs_weakify(self)
    return ^__kindof UIMenuItem *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        return [UIMenuItem.alloc initWithTitle:self action:data];
    };
}

@end
