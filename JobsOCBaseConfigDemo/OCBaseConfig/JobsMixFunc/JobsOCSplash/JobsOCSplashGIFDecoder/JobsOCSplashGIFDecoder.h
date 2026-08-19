//
//  JobsOCSplashGIFDecoder.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashGIFDecoder_h
#define JobsOCSplashGIFDecoder_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <ImageIO/ImageIO.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashGIFDecoder : NSObject

+(nullable UIImage *)imageWithData:(NSData *)data;
+(JobsRetImageByDataBlock _Nonnull)imageWithData;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashGIFDecoder_h */
