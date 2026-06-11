//
//  JobsBlock+SDWebImage.h
//  JobsBlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#ifndef JobsBlock_SDWebImage_h
#define JobsBlock_SDWebImage_h

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#ifndef JobsSDWebImageButtonBlock
#define JobsSDWebImageButtonBlock
typedef __kindof UIButton * _Nullable (^JobsRetButBySDWebImageOptionsBlocks)(SDWebImageOptions options);
typedef __kindof UIButton * _Nullable (^JobsRetButBySDExternalCompletionBlocks)(SDExternalCompletionBlock _Nullable completionBlock);
typedef __kindof UIButton * _Nullable (^JobsRetButBySDImageLoaderProgressBlocks)(SDImageLoaderProgressBlock _Nullable progressBlock);
#endif /* JobsSDWebImageButtonBlock */

#ifndef JobsSDWebImageImageViewBlock
#define JobsSDWebImageImageViewBlock
typedef __kindof UIImageView * _Nullable (^JobsRetImageViewBySDWebImageOptionsBlocks)(SDWebImageOptions options);
typedef __kindof UIImageView * _Nullable (^JobsRetImageViewBySDExternalCompletionBlocks)(SDExternalCompletionBlock _Nullable completionBlock);
typedef __kindof UIImageView * _Nullable (^JobsRetImageViewBySDImageLoaderProgressBlocks)(SDImageLoaderProgressBlock _Nullable progressBlock);
#endif /* JobsSDWebImageImageViewBlock */

#endif /* JobsBlock_SDWebImage_h */
