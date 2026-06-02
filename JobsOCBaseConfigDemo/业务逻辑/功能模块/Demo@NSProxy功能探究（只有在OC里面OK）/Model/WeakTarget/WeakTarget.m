//
//  WeakTarget.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "WeakTarget.h"

@implementation WeakTarget

+(instancetype)withTarget:(id)target {
    WeakTarget *w = WeakTarget.new;
    w.target = target;
    return w;
}

@end
