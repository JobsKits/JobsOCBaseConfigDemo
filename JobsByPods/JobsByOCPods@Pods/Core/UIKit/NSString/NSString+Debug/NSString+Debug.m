//
//  NSString+Debug.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Debug.h"

@implementation NSString (Debug)
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText{
    return self.isEqualToString(TextModelDataString.tr);
}

@end
