//
//  TABAnimatedDarkModeImpl.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABAnimatedDarkModeImpl.h"

#import <TABAnimated/TABAnimatedProduction.h>
#import <TABAnimated/TABComponentLayer.h>
#import <TABAnimated/TABViewAnimated.h>

#import <TABAnimated/TABAnimatedDarkModeInterface.h>

@implementation TABAnimatedDarkModeImpl

- (void)traitCollectionDidChange:(UITraitCollection *)traitCollection
                     tabAnimated:(TABViewAnimated *)tabAnimated
                 backgroundLayer:(TABComponentLayer *)backgroundLayer
                          layers:(NSArray <TABComponentLayer *> *)layers {
    
    if (@available(iOS 13.0, *)) {
        
        UIColor *animatedBackgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return tabAnimated.darkAnimatedBackgroundColor;
            }else {
                return tabAnimated.animatedBackgroundColor;
            }
        }];

        UIColor *animatedColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return tabAnimated.darkAnimatedColor;
            }else {
                return tabAnimated.animatedColor;
            }
        }];
        
        backgroundLayer.backgroundColor = animatedBackgroundColor.CGColor;
        for (TABComponentLayer *layer in layers) {
            
            layer.backgroundColor = animatedColor.CGColor;
            if (layer.contents && layer.placeholderName && layer.placeholderName.length > 0) {
                layer.contents = (id)[UIImage imageNamed:layer.placeholderName].CGImage;
            }
        }
    }
}

@end
