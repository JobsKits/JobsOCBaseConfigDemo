//
//  _XYColor_PrivateView.m
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "_XYColor_PrivateView.h"

@interface _XYColor_PrivateView ()

@property (nonatomic, strong) NSMutableArray<TraitCollectionCallback> *callbackList;

@end

@implementation _XYColor_PrivateView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)traitCollectionChange:(TraitCollectionCallback)callback {
    if (!callback) { return; }
    [self.callbackList addObject:[callback copy]];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            for (TraitCollectionCallback callback in self.callbackList.copy) {
                callback();
            }
        }
    }
}

- (NSMutableArray<TraitCollectionCallback> *)callbackList {
    if (!_callbackList) {
        _callbackList = NSMutableArray.array;
    }
    return _callbackList;
}

@end
