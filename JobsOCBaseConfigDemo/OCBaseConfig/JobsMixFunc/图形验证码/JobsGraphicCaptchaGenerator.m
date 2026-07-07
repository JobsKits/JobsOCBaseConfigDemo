//
//  JobsGraphicCaptchaGenerator.m
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsGraphicCaptchaGenerator.h"

@implementation JobsGraphicCaptchaGenerator

+(NSArray<NSString *> *)numberCharacters{
    static NSArray<NSString *> *characters = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        characters = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    });return characters;
}

+(NSArray<NSString *> *)lowercaseLetterCharacters{
    static NSArray<NSString *> *characters = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        characters = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",
                       @"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    });return characters;
}

+(NSArray<NSString *> *)uppercaseLetterCharacters{
    static NSArray<NSString *> *characters = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        characters = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",
                       @"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    });return characters;
}

+(NSArray<NSString *> *)chineseCharacters{
    static NSArray<NSString *> *characters = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableArray<NSString *> *arr = NSMutableArray.array;
        for (UniChar c = 0x4E00; c <= 0x9FA5; c++) {
            [arr addObject:[NSString stringWithCharacters:&c length:1]];
        }
        characters = arr.copy;
    });return characters;
}

+(NSArray<NSString *> *)charactersForUnits:(JobsGraphicCaptchaCharacterUnit)units{
    NSMutableArray<NSString *> *characters = NSMutableArray.array;
    if (units & JobsGraphicCaptchaCharacterUnitNumber) {
        [characters addObjectsFromArray:self.numberCharacters];
    }
    if (units & JobsGraphicCaptchaCharacterUnitLowercaseLetter) {
        [characters addObjectsFromArray:self.lowercaseLetterCharacters];
    }
    if (units & JobsGraphicCaptchaCharacterUnitUppercaseLetter) {
        [characters addObjectsFromArray:self.uppercaseLetterCharacters];
    }
    if (units & JobsGraphicCaptchaCharacterUnitChinese) {
        [characters addObjectsFromArray:self.chineseCharacters];
    };return characters.copy;
}

+(NSString *)randomTextByConfig:(JobsGraphicCaptchaConfig *_Nullable)config{
    JobsGraphicCaptchaConfig *captchaConfig = config ? : JobsGraphicCaptchaConfig.defaultConfig;
    NSUInteger length = captchaConfig.length ? : 4;
    NSArray<NSString *> *sourceCharacters = captchaConfig.customCharacters.count ? captchaConfig.customCharacters : [self charactersForUnits:captchaConfig.characterUnits];
    if (!sourceCharacters.count) sourceCharacters = [self charactersForUnits:JobsGraphicCaptchaCharacterUnitDefault];
    NSMutableString *text = NSMutableString.string;
    for (NSUInteger i = 0; i < length; i++) {
        uint32_t index = arc4random_uniform((uint32_t)sourceCharacters.count);
        NSString *character = sourceCharacters[index];
        if (![character isKindOfClass:NSString.class] || !character.length) {
            i--;
            continue;
        }
        [text appendString:character];
    };return text.copy;
}

+(BOOL)validateInput:(NSString *_Nullable)input
             captcha:(NSString *_Nullable)captcha
       caseSensitive:(BOOL)caseSensitive{
    NSString *inputText = [input stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
    NSString *captchaText = [captcha stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
    if (!inputText.length || !captchaText.length) return NO;
    if (caseSensitive) return [inputText isEqualToString:captchaText];
    return [inputText caseInsensitiveCompare:captchaText] == NSOrderedSame;
}

@end
