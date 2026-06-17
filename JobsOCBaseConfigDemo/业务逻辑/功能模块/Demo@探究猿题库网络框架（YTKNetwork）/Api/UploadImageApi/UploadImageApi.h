//
//  UploadImageApi.h
//  JobsOCBaseConfigDemo
//
//  Created by tangqiao on 8/7/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBaseApi.h"
#import "JobsDefineProperty.h"

@interface UploadImageApi : JobsBaseApi

+(JobsRetIDByImageBlock)initByImage;
-(instancetype)initWithImage:(UIImage *)image;
-(NSString *)responseImageId;

@end
