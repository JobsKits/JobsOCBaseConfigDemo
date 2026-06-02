//
//  JobsSuspendBtn.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSuspendBtn.h"
#import <JobsSuspend/UIControl+Extra.h>
#import <JobsSuspend/UIView+Extra.h>

@interface JobsSuspendBtn ()

@end

@implementation JobsSuspendBtn
BaseViewProtocol_synthesize
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = self.backgroundColor ? :JobsBlackColor;
        [self jobs_onChange:^(__kindof UIControl * _Nullable ctrl) {
            JobsLog(@"Hello Jobs");
        }];
        self.cornerCutToCircleWithCornerRadius(JobsWidth(8));
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.panRcognize.enabled = self.isAllowDrag;// 关键代码
}
#pragma mark —— 复写父类方法
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
}

@end
