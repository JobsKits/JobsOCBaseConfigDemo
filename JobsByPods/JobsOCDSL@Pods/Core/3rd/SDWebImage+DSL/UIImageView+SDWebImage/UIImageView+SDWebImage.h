//
//  UIImageView+SDWebImage.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

@interface UIImageView (SDWebImage)

Prop_copy(readonly,nonnull)JobsRetViewByVoidBlock load;
Prop_copy(readonly,nonnull)JobsRetImageViewByURLBlock imageURL;
Prop_copy(readonly,nonnull)JobsRetImageViewByImageBlock placeholderImage;
Prop_copy(readonly,nonnull)JobsRetImageViewBySDWebImageOptionsBlocks options;
Prop_copy(readonly,nonnull)JobsRetImageViewBySDExternalCompletionBlocks completed;

@end

NS_ASSUME_NONNULL_END
