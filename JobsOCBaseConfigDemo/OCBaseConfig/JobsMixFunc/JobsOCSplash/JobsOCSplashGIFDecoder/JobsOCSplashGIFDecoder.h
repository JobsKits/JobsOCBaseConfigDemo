//
//  JobsOCSplashGIFDecoder.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashGIFDecoder_h
#define JobsOCSplashGIFDecoder_h

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashGIFDecoder : NSObject

+(nullable UIImage *)imageWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashGIFDecoder_h */
