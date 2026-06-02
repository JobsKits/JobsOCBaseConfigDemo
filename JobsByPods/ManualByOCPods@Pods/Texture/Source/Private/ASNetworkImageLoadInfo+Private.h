//
//  ASNetworkImageLoadInfo+Private.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASNetworkImageLoadInfo.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASNetworkImageLoadInfo ()

- (instancetype)initWithURL:(NSURL *)url
                 sourceType:(ASNetworkImageSourceType)sourceType
         downloadIdentifier:(nullable id)downloadIdentifier
                   userInfo:(nullable id)userInfo;

@end

NS_ASSUME_NONNULL_END
