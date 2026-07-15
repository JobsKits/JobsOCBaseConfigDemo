//
//  JobsPresentedVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPresentedVC.h"

@interface JobsPresentedVC ()

@end

@implementation JobsPresentedVC
- (void)dealloc{
    JobsRemoveNotification(self);
    [self.view endEditing:YES];
    if (JobsDebug) {
        toastBy([NSString stringWithFormat:@"%@%@",@"成功销毁了控制器".tr,NSStringFromClass(self.class)]);
        JobsLog(@"%@",JobsLocalFunc);
        PrintRetainCount(self)
    }
}

-(void)viewDidLoad{
    [super viewDidLoad];
    JobsLog(@"%f",self.presentUpHeight);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
