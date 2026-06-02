//
//  NSXMLParser+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSXMLParser+Extra.h"

@implementation NSXMLParser (Extra)

+(JobsRetNSXMLParserByNSDataBlock _Nonnull)initBy{
    return ^__kindof NSXMLParser *_Nonnull(__kindof NSData *_Nullable data){
        return [NSXMLParser.alloc initWithData:data];
    };
}

@end
