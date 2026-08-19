//
//  BaseTableViewCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell
-(void)awakeFromNib{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseTableViewCell.class, @selector(jobsAwakeFromNib)))(self, @selector(jobsAwakeFromNib));
    if (action) action();
}

- (jobsByVoidBlock _Nonnull)jobsAwakeFromNib {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super awakeFromNib];
        // Initialization code
    };
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
