//
//  TABSentryView.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABSentryView.h"

@implementation TABSentryView

- (instancetype)init {
    if (self = [super init]) {
        self.layer.name = @"TABSentryViewLayer";
        self.frame = CGRectMake(0, 0, .1, .1);
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (self.traitCollectionDidChangeBack) {
        self.traitCollectionDidChangeBack();
    }
}

@end
