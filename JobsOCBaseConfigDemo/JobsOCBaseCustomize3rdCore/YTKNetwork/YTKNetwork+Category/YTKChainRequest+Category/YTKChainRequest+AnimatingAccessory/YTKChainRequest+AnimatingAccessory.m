//
//  YTKChainRequest+AnimatingAccessory.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "YTKChainRequest+AnimatingAccessory.h"

@implementation YTKChainRequest (AnimatingAccessory)
-(YTKAnimatingRequestAccessory *)animatingRequestAccessory {
    for (id accessory in self.requestAccessories) {
        if ([accessory isKindOfClass:YTKAnimatingRequestAccessory.class]){
            return accessory;
        }
    };return nil;
}

-(UIView *)animatingView {
    return self.animatingRequestAccessory.animatingView;
}

-(void)setAnimatingView:(UIView *)animatingView {
    if (!self.animatingRequestAccessory) {
        [self addAccessory:[YTKAnimatingRequestAccessory accessoryWithAnimatingView:animatingView
                                                                      animatingText:nil]];
    } else {
        self.animatingRequestAccessory.animatingView = animatingView;
    }
}

-(NSString *)animatingText {
    return self.animatingRequestAccessory.animatingText;
}

-(void)setAnimatingText:(NSString *)animatingText {
    if (self.animatingRequestAccessory) {
        self.animatingRequestAccessory.animatingText = animatingText;
    } else {
        [self addAccessory:[YTKAnimatingRequestAccessory accessoryWithAnimatingView:nil
                                                                      animatingText:animatingText]];
    }
}

@end
