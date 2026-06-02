//
//  NSData+Extra.m
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSData+Extra.h"

@implementation NSData (Extra)

-(NSString *)stringByUTF8Encoding{
    return NSString.initByUTF8Data(self);
}

@end
