//
//  NSString+Extra.m
//  JobsMakes
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"
#import <JobsMakes/UIColor+Extra.h>

@implementation NSString (JobsMakesExtra)
-(UIColor *)cor{
    return UIColor.jobsCor(self);
}

@end
