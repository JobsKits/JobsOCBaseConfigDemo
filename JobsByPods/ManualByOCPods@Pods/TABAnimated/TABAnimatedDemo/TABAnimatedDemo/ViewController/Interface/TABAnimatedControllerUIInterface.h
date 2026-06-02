//
//  TABAnimatedControllerUIInterface.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef TABAnimatedControllerUIInterface_h
#define TABAnimatedControllerUIInterface_h

#import <Foundation/Foundation.h>

typedef void(^RightButtonClickBlock)(UIButton *btn);

@protocol TABAnimatedControllerUIInterface <NSObject>

@optional

- (void)addRightButtonWithText:(NSString *)text controller:(UIViewController *)controller clickButtonBlock:(RightButtonClickBlock)clickButtonBlock;
- (void)addReloadButtonWithController:(UIViewController *)controller clickButtonBlock:(RightButtonClickBlock)clickButtonBlock;

@end

#endif /* TABAnimatedControllerUIInterface_h */
