//
//  _XYColor_PrivateView.h
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "UIView+PrivateView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^TraitCollectionCallback)(void);

@interface _XYColor_PrivateView : UIView

- (void)traitCollectionChange:(TraitCollectionCallback)callback;

@end

NS_ASSUME_NONNULL_END
