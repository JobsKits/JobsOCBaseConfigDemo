//
//  TBCityIconInfo.h
//  JobsOCBaseConfigDemo
//
//  Created by John Wong on 10/12/14.
//  Copyright (c) 2014 Taodiandian. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "JobsDefineProperty.h"

@interface TBCityIconInfo : NSObject

Prop_copy()NSString *text;
Prop_assign()NSInteger size;
Prop_strong()UIColor *color;

- (instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;
+ (instancetype)iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;

@end
