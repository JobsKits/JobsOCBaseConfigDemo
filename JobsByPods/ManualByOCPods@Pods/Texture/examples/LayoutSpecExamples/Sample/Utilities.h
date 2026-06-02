//
//  Utilities.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Additions)
+ (UIColor *)darkBlueColor;
+ (UIColor *)lightBlueColor;
@end

@interface UIImage (Additions)
- (UIImage *)makeCircularImageWithSize:(CGSize)size withBorderWidth:(CGFloat)width;
+ (UIImage *)imageWithSize:(CGSize)size fillColor:(UIColor *)fillColor shapeBlock:(UIBezierPath *(^)(void))shapeBlock;
@end

@interface NSAttributedString (Additions)
+ (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size color:(UIColor *)color;
@end
