//
//  SDWebImageModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef SDWebImageModel_h
#define SDWebImageModel_h

#import <Foundation/Foundation.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SDWebImageModel : NSObject

Prop_strong()NSURL *url;
Prop_strong()UIImage *placeholder;
Prop_assign()SDWebImageOptions options;
Prop_copy()SDExternalCompletionBlock completion;
Prop_copy()SDImageLoaderProgressBlock progress;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SDWebImageModel *_Nonnull jobsMakeSDWebImageModel(jobsBySDWebImageModelBlock _Nonnull block){
    SDWebImageModel *data = SDWebImageModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* SDWebImageModel_h */
