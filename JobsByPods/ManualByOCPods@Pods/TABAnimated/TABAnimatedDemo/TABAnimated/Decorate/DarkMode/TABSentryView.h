//
//  TABSentryView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TABSentryViewCallBack)(void);

@interface TABSentryView : UIView

@property (nonatomic, copy) TABSentryViewCallBack traitCollectionDidChangeBack;

@end

NS_ASSUME_NONNULL_END
