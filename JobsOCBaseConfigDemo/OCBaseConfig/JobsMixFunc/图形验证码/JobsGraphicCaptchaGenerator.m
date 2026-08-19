//
//  JobsGraphicCaptchaGenerator.m
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsGraphicCaptchaGenerator.h"

@interface JobsGraphicCaptchaGenerator ()

+(JobsRetNSArrayNSStringByNSStringBlock _Nonnull)characterArrayByString;

@end

@implementation JobsGraphicCaptchaGenerator
+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)numberCharacters{
    return ^NSArray<NSString *> *{
        static NSArray<NSString *> *characters = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            characters = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
        });return characters;
    };
}

+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)lowercaseLetterCharacters{
    return ^NSArray<NSString *> *{
        static NSArray<NSString *> *characters = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            characters = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",
                           @"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
        });return characters;
    };
}

+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)uppercaseLetterCharacters{
    return ^NSArray<NSString *> *{
        static NSArray<NSString *> *characters = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            characters = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",
                           @"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
        });return characters;
    };
}

+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)simplifiedChineseCharacters{
    return ^NSArray<NSString *> *{
        static NSArray<NSString *> *characters = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            characters = self.characterArrayByString(@"汉语龙国风云书画网车门东乐气万与专业长时见学习爱宝贝发后会里这来");
        });return characters;
    };
}

+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)traditionalChineseCharacters{
    return ^NSArray<NSString *> *{
        static NSArray<NSString *> *characters = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            characters = self.characterArrayByString(@"漢語龍國風雲書畫網車門東樂氣萬與專業長時見學習愛寶貝發後會裡這來");
        });return characters;
    };
}

+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)chineseCharacters{
    return ^NSArray<NSString *> *{
        return [self.simplifiedChineseCharacters() arrayByAddingObjectsFromArray:self.traditionalChineseCharacters()];
    };
}

+(JobsRetNSArrayNSStringByNSStringBlock _Nonnull)characterArrayByString{
    return ^NSArray<NSString *> *(NSString * string){
        NSMutableArray<NSString *> *characters = NSMutableArray.array;
        [string enumerateSubstringsInRange:NSMakeRange(0, string.length)
                                   options:NSStringEnumerationByComposedCharacterSequences
                                usingBlock:^(NSString *substring,
                                             NSRange substringRange,
                                             NSRange enclosingRange,
                                             BOOL *stop) {
            if (substring.length) [characters addObject:substring];
        }];return characters.copy;
    };
}

+(JobsRetNSArrayNSStringByJobsGraphicCaptchaCharacterUnitBlock _Nonnull)charactersForUnits{
    return ^NSArray<NSString *> *(JobsGraphicCaptchaCharacterUnit units){
        NSMutableArray<NSString *> *characters = NSMutableArray.array;
        if (units & JobsGraphicCaptchaCharacterUnitNumber) {
            [characters addObjectsFromArray:self.numberCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitLowercaseLetter) {
            [characters addObjectsFromArray:self.lowercaseLetterCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitUppercaseLetter) {
            [characters addObjectsFromArray:self.uppercaseLetterCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitSimplifiedChinese) {
            [characters addObjectsFromArray:self.simplifiedChineseCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitTraditionalChinese) {
            [characters addObjectsFromArray:self.traditionalChineseCharacters()];
        };return characters.copy;
    };
}

+(JobsRetNSArrayNSArrayNSStringByJobsGraphicCaptchaCharacterUnitBlock _Nonnull)characterGroupsForUnits{
    return ^NSArray<NSArray<NSString *> *> *(JobsGraphicCaptchaCharacterUnit units){
        NSMutableArray<NSArray<NSString *> *> *groups = NSMutableArray.array;
        if (units & JobsGraphicCaptchaCharacterUnitNumber) {
            [groups addObject:self.numberCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitLowercaseLetter) {
            [groups addObject:self.lowercaseLetterCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitUppercaseLetter) {
            [groups addObject:self.uppercaseLetterCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitSimplifiedChinese) {
            [groups addObject:self.simplifiedChineseCharacters()];
        }
        if (units & JobsGraphicCaptchaCharacterUnitTraditionalChinese) {
            [groups addObject:self.traditionalChineseCharacters()];
        };return groups.copy;
    };
}

+(JobsRetNSArrayNSStringByNSArrayNSStringBlock _Nonnull)validCharactersFromCharacters{
    return ^NSArray<NSString *> *(NSArray<NSString *> * characters){
        NSMutableArray<NSString *> *validCharacters = NSMutableArray.array;
        for (id character in characters) {
            if ([character isKindOfClass:NSString.class] && [character length]) {
                [validCharacters addObject:character];
            }
        };return validCharacters.copy;
    };
}

+(JobsRetNSStringByNSArrayNSStringBlock _Nonnull)randomCharacterFromCharacters{
    return ^NSString *(NSArray<NSString *> * characters){
        if (!characters.count) return @"";
        for (NSUInteger i = 0; i < characters.count; i++) {
            NSString *character = characters[arc4random_uniform((uint32_t)characters.count)];
            if ([character isKindOfClass:NSString.class] && character.length) return character;
        };return @"";
    };
}

+(jobsByNSMutableArrayBlock _Nonnull)shuffleMutableCharacters{
    return ^(NSMutableArray * characters){
        for (NSUInteger i = characters.count; i > 1; i--) {
            NSUInteger index = arc4random_uniform((uint32_t)i);
            [characters exchangeObjectAtIndex:i - 1
                            withObjectAtIndex:index];
        }
    };
}

+(NSArray<NSArray<NSString *> *> *)randomGroupCombinationFromGroups:(NSArray<NSArray<NSString *> *> *)groups
                                                             length:(NSUInteger)length
                                                         groupCount:(NSUInteger)groupCount{
    if (groups.count < 2 || length < 2) return @[];
    NSMutableArray<NSArray<NSString *> *> *shuffledGroups = groups.mutableCopy;
    self.shuffleMutableCharacters(shuffledGroups);
    NSUInteger maxGroupCount = MIN(length, shuffledGroups.count);
    NSUInteger targetGroupCount = groupCount ? groupCount : maxGroupCount;
    NSUInteger finalGroupCount = MIN(targetGroupCount, maxGroupCount);
    if (finalGroupCount < 2) return @[];
    return [shuffledGroups subarrayWithRange:NSMakeRange(0, finalGroupCount)];
}

+(NSString *)randomTextByCharacters:(NSArray<NSString *> *)characters
                              length:(NSUInteger)length{
    NSMutableString *text = NSMutableString.string;
    for (NSUInteger i = 0; i < length; i++) {
        NSString *character = self.randomCharacterFromCharacters(characters);
        if (!character.length) break;
        [text appendString:character];
    };return text.copy;
}

+(NSString *)randomMixedTextByGroups:(NSArray<NSArray<NSString *> *> *)groups
                              length:(NSUInteger)length
                          groupCount:(NSUInteger)groupCount{
    NSArray<NSArray<NSString *> *> *selectedGroups = [self randomGroupCombinationFromGroups:groups
                                                                                     length:length
                                                                                 groupCount:groupCount];
    if (!selectedGroups.count) return @"";
    NSMutableArray<NSString *> *characters = NSMutableArray.array;
    NSMutableArray<NSString *> *sourceCharacters = NSMutableArray.array;
    for (NSArray<NSString *> *group in selectedGroups) {
        NSString *character = self.randomCharacterFromCharacters(group);
        if (character.length) [characters addObject:character];
        [sourceCharacters addObjectsFromArray:group];
    }
    while (characters.count < length) {
        NSString *character = self.randomCharacterFromCharacters(sourceCharacters);
        if (!character.length) break;
        [characters addObject:character];
    }
    self.shuffleMutableCharacters(characters);
    return [characters componentsJoinedByString:@""];
}

+(JobsRetNSStringByJobsGraphicCaptchaConfigBlock _Nonnull)randomTextByConfig{
    return ^NSString *(JobsGraphicCaptchaConfig *_Nullable config){
        JobsGraphicCaptchaConfig *captchaConfig = config ? : JobsGraphicCaptchaConfig.defaultConfig();
        NSUInteger length = captchaConfig.length ? : 4;
        if (captchaConfig.customCharacters.count) {
            NSArray<NSString *> *customCharacters = self.validCharactersFromCharacters(captchaConfig.customCharacters);
            NSArray<NSString *> *sourceCharacters = customCharacters.count ? customCharacters : self.charactersForUnits(JobsGraphicCaptchaCharacterUnitDefault);
            return [self randomTextByCharacters:sourceCharacters
                                         length:length];
        }
        NSArray<NSArray<NSString *> *> *groups = self.characterGroupsForUnits(captchaConfig.characterUnits);
        if (!groups.count) groups = self.characterGroupsForUnits(JobsGraphicCaptchaCharacterUnitDefault);
        if (captchaConfig.mixedGroupCount > 1 && groups.count > 1) {
            NSUInteger requiredLength = MIN(captchaConfig.mixedGroupCount, groups.count);
            if (length < requiredLength) length = requiredLength;
            NSString *mixedText = [self randomMixedTextByGroups:groups
                                                         length:length
                                                     groupCount:captchaConfig.mixedGroupCount];
            if (mixedText.length) return mixedText;
        }
        NSArray<NSString *> *sourceCharacters = self.charactersForUnits(captchaConfig.characterUnits);
        if (!sourceCharacters.count) sourceCharacters = self.charactersForUnits(JobsGraphicCaptchaCharacterUnitDefault);
        return [self randomTextByCharacters:sourceCharacters
                                     length:length];
    };
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
