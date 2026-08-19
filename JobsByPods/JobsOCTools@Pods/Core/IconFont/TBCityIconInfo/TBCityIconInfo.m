//
//  TBCityIconInfo.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TBCityIconInfo.h"

@implementation TBCityIconInfo
-(JobsRetTBCityIconInfoByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof TBCityIconInfo *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setText:string];
        return self;
    };
}

-(JobsRetTBCityIconInfoByNSIntegerBlock _Nonnull)bySize{
    @jobs_weakify(self)
    return ^__kindof TBCityIconInfo *_Nullable(NSInteger value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setSize:value];
        return self;
    };
}

-(JobsRetTBCityIconInfoByCorBlock _Nonnull)byColor{
    @jobs_weakify(self)
    return ^__kindof TBCityIconInfo *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setColor:color];
        return self;
    };
}

- (instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    if (self = [super init]) {
        self.byText(text)
            .bySize(size)
            .byColor(color);
    };return self;
}

+ (instancetype)iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    return [[TBCityIconInfo alloc] initWithText:text size:size color:color];
}

@end
