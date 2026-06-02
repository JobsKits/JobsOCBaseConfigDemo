//
//  TABAnimationManagerImpl.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABAnimationManagerImpl.h"

#import <TABAnimated/TABViewAnimated.h>
#import <TABAnimated/UIView+TABControlModel.h>
#import <TABAnimated/TABAnimated.h>

#import <TABAnimated/TABClassicAnimationImpl.h>
#import <TABAnimated/TABShimmerAnimationImpl.h>
#import <TABAnimated/TABDropAnimationImpl.h>
#import <TABAnimated/TABBinAnimationImpl.h>

@interface TABAnimationManagerImpl()

@property (nonatomic, weak) UIView *controlView;

@end

@implementation TABAnimationManagerImpl

- (void)setControlView:(UIView *)controlView {
    _controlView = controlView;
    [self _bindDecorater];
}

- (void)_bindDecorater {
    TABViewAnimated *_tabAnimated = _controlView.tabAnimated;
    if (_tabAnimated.decorator) return;
    
    if (_tabAnimated.superAnimationType == TABViewSuperAnimationTypeDefault) {
        if([TABAnimated sharedAnimated].animationType == TABAnimationTypeOnlySkeleton) {
            _tabAnimated.decorator = TABClassicAnimationImpl.new;
        }else if ([TABAnimated sharedAnimated].animationType == TABAnimationTypeShimmer) {
            _tabAnimated.decorator = TABShimmerAnimationImpl.new;
        }else if ([TABAnimated sharedAnimated].animationType == TABAnimationTypeDrop) {
            _tabAnimated.decorator = TABDropAnimationImpl.new;
        }else if ([TABAnimated sharedAnimated].animationType == TABAnimationTypeBinAnimation) {
            _tabAnimated.decorator = TABBinAnimationImpl.new;
        }
    }else if(_tabAnimated.superAnimationType == TABViewSuperAnimationTypeOnlySkeleton) {
        _tabAnimated.decorator = TABClassicAnimationImpl.new;
    }else if(_tabAnimated.superAnimationType == TABViewSuperAnimationTypeShimmer) {
        _tabAnimated.decorator = TABShimmerAnimationImpl.new;
    }else if (_tabAnimated.superAnimationType == TABViewSuperAnimationTypeDrop) {
        _tabAnimated.decorator = TABDropAnimationImpl.new;
    }else if (_tabAnimated.superAnimationType == TABViewSuperAnimationTypeBinAnimation) {
        _tabAnimated.decorator = TABBinAnimationImpl.new;
    }
}

- (void)addAnimationWithTargetView:(UIView *)targetView {
    
    TABViewAnimated *_tabAnimated = _controlView.tabAnimated;
    if (!_controlView || !_tabAnimated) return;
    
    UITraitCollection *traitCollection = _controlView.traitCollection;
    
    if (_tabAnimated.decorator) {
        if (_tabAnimated.decorator  && [_tabAnimated.decorator  respondsToSelector:@selector(addAnimationWithTraitCollection:backgroundLayer:layers:)]) {
            TABAnimatedProduction *production = targetView.tabAnimatedProduction;
            [_tabAnimated.decorator addAnimationWithTraitCollection:traitCollection
                                                    backgroundLayer:production.backgroundLayer
                                                             layers:production.layers];
        }
    }
}

- (void)destory {
}

@end
