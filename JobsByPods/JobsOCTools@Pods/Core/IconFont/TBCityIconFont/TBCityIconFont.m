//
//  TBCityIconFont.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TBCityIconFont.h"

@implementation TBCityIconFont
static NSString *_fontName;

+(jobsByURLBlock _Nonnull)registerFontWithURL{
    return ^(NSURL * url){
        NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
        CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
        CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
        CGDataProviderRelease(fontDataProvider);
        CTFontManagerRegisterGraphicsFont(newFont, nil);
        CGFontRelease(newFont);
    };
}

+ (UIFont *)fontWithSize:(CGFloat)size {
    return ((((JobsRetUIFontByCGFloatBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(TBCityIconFont.class, @selector(fontWithSize)))(self, @selector(fontWithSize))))(size);
}
+(JobsRetUIFontByCGFloatBlock _Nonnull)fontWithSize{
    return ^UIFont *(CGFloat size){
        UIFont *font = [UIFont fontWithName:self.fontName() size:size];
        if (font == nil) {
            NSURL *fontFileUrl = [NSBundle.mainBundle URLForResource:self.fontName() withExtension:@"ttf"];
            self.registerFontWithURL(fontFileUrl);
            font = [UIFont fontWithName:self.fontName() size:size];
            NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
        };return font;
    };
}

+(jobsByStrBlock _Nonnull)setFontName{
    return ^(NSString * fontName){
        _fontName = fontName;
    };
}

+ (JobsRetStrByVoidBlock _Nonnull)fontName {
    return ^NSString *_Nullable{
        return _fontName ? : @"iconfont";
    };
}

@end
