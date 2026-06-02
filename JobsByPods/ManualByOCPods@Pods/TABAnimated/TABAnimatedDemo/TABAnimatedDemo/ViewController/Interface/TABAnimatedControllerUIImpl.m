//
//  TABAnimatedControllerUIImpl.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABAnimatedControllerUIImpl.h"

@interface TABAnimatedControllerUIImpl()

@property (nonatomic, copy) RightButtonClickBlock clickButtonBlock;

@end

@implementation TABAnimatedControllerUIImpl

- (void)addRightButtonWithText:(NSString *)text
                    controller:(UIViewController *)controller
              clickButtonBlock:(RightButtonClickBlock)clickButtonBlock {
    self.clickButtonBlock = clickButtonBlock;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightButton:)];
    controller.navigationItem.rightBarButtonItem = item;
}

- (void)addReloadButtonWithController:(UIViewController *)controller clickButtonBlock:(RightButtonClickBlock)clickButtonBlock {
    self.clickButtonBlock = clickButtonBlock;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"重新加载" style:UIBarButtonItemStylePlain target:self action:@selector(didClickReloadButton:)];
    item.tintColor = UIColor.blackColor;
    controller.navigationItem.rightBarButtonItem = item;
}

- (void)didClickRightButton:(UIButton *)button {
    if (self.clickButtonBlock) {
        self.clickButtonBlock(button);
    }
}

- (void)didClickReloadButton:(UIButton *)button {
    if (self.clickButtonBlock) {
        self.clickButtonBlock(button);
    }
}

@end
