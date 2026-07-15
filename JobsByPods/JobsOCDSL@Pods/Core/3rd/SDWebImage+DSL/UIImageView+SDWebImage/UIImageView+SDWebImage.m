//
//  UIImageView+SDWebImage.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIImageView+SDWebImage.h"

@implementation UIImageView (SDWebImage)
-(JobsRetViewByVoidBlock _Nonnull)load {
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nullable(){
        @jobs_strongify(self)
        NSURL *url = Jobs_getAssociatedObject(_imageURL);
        UIImage *placeholder = Jobs_getAssociatedObject(_placeholderImage);
        SDWebImageOptions options = [Jobs_getAssociatedObject(_options) integerValue];
        SDExternalCompletionBlock completion = Jobs_getAssociatedObject(_completed);
        [self sd_setImageWithURL:url
                placeholderImage:placeholder
                         options:options
                       completed:completion];
        return self;
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsRetImageViewByURLBlock imageURL;
JobsKey(_imageURL)
@dynamic imageURL;
-(JobsRetImageViewByURLBlock _Nonnull)imageURL {
    return ^__kindof UIImageView *_Nonnull(NSURL *imageURL) {
        NSURL *url = nil;
        if ([imageURL isKindOfClass:NSString.class]) {
            url = [NSURL URLWithString:(NSString *)imageURL];
        } else if ([imageURL isKindOfClass:NSURL.class]) {
            url = imageURL;
        } else {
            url = [NSURL URLWithString:@""];
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_imageURL, url)
        return self;
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsRetImageViewByImageBlock placeholderImage;
JobsKey(_placeholderImage)
@dynamic placeholderImage;
-(JobsRetImageViewByImageBlock _Nonnull)placeholderImage {
    return ^__kindof UIImageView *_Nonnull(UIImage *placeholderImage) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderImage, placeholderImage)
        return self;
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsRetImageViewBySDWebImageOptionsBlocks options;
JobsKey(_options)
@dynamic options;
-(JobsRetImageViewBySDWebImageOptionsBlocks _Nonnull)options{
    return ^__kindof UIImageView *_Nullable(SDWebImageOptions options) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_options, @(options));
        return self;
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsRetImageViewBySDExternalCompletionBlocks completed;
JobsKey(_completed)
@dynamic completed;
- (JobsRetImageViewBySDExternalCompletionBlocks _Nonnull)completed {
    return ^__kindof UIImageView *_Nullable(SDExternalCompletionBlock completion) {
        Jobs_setAssociatedCOPY_NONATOMIC(_completed,completion);
        return self;
    };
}

@end
