//
//  NSData+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#import "NSData+Extra.h"

@implementation NSData (YTKNetworkExtraExtra)

-(NSString *)stringByUTF8Encoding{
    return NSString.initByUTF8Data(self);
}

@end
