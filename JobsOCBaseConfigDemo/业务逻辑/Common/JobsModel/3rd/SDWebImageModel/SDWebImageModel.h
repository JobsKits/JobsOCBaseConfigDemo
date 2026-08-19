//
//  SDWebImageModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef SDWebImageModel_h

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#define SDWebImageModel_h

#import <Foundation/Foundation.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

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
