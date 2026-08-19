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
        if (JobsControllerDeallocTipsEnabled()) {
            toastBy([NSString stringWithFormat:@"%@%@",@"成功销毁了控制器".jobsTr(),NSStringFromClass(self.class)]);
        }
        JobsLog(@"%@",JobsLocalFunc);
        PrintRetainCount(self)
    }
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentedVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        JobsLog(@"%f",self.presentUpHeight);
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
