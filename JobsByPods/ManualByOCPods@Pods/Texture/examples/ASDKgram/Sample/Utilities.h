//
//  Utilities.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Additions)

+ (UIColor *)backgroundColor;
+ (UIColor *)darkBlueColor;
+ (UIColor *)lightBlueColor;

@end

@interface UIImage (Additions)

+ (void)downloadImageForURL:(NSURL *)url completion:(void (^)(UIImage *))block;
- (UIImage *)makeCircularImageWithSize:(CGSize)size backgroundColor:(nullable UIColor *)backgroundColor;

@end

@interface NSString (Additions)

// returns a user friendly elapsed time such as '50s', '6m' or '3w'
+ (NSString *)elapsedTimeStringSinceDate:(NSString *)uploadDateString;

@end

@interface NSAttributedString (Additions)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                          fontSize:(CGFloat)size
                                             color:(nullable UIColor *)color
                                    firstWordColor:(nullable UIColor *)firstWordColor;

@end

NS_ASSUME_NONNULL_END
