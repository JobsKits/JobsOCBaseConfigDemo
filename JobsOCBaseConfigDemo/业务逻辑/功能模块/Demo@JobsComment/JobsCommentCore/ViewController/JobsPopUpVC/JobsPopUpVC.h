//
//  PopUpVC.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/6.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "JobsDefineAllEnumHeader.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
//此类解耦手势
@interface JobsPopUpVC : BaseViewController
<
UIGestureRecognizerDelegate
>

Prop_assign()CGFloat popUpHeight;//默认弹出高度300

@end

NS_ASSUME_NONNULL_END

/**

    PopUpVC *popUpVC = PopUpVC.new;
    @jobs_weakify(self)
    [popUpVC actionBlockPopUpVC:^(id data) {
        @jobs_strongify(self)
        JobsLog(@"您点击了关注");
    }];
    [UIViewController comingFromVC:self
                              toVC:popUpVC
                       comingStyle:ComingStyle_PUSH
                 presentationStyle:UIModalPresentationAutomatic
                     requestParams:@"".tr
                           success:^(id data) {}
                          animated:YES];

*/
