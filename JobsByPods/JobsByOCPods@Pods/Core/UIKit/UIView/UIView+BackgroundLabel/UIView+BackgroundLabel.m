//
//  UIView+BackgroundLabel.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+BackgroundLabel.h"

@implementation UIView (BackgroundLabel)
#pragma mark —— Prop_strong()UILabel *backgroundLabel;
JobsKey(_backgroundLabel)
@dynamic backgroundLabel;
-(UILabel *)backgroundLabel{
    UILabel *BackgroundLabel = Jobs_getAssociatedObject(_backgroundLabel);
    if (!BackgroundLabel) {
        @jobs_weakify(self)
        BackgroundLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byUserInteractionEnabled(YES)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
            self.sendSubviewToBack(label);
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundLabel, BackgroundLabel);
    };return BackgroundLabel;
}

-(void)setBackgroundLabel:(UILabel *)backgroundLabel{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundLabel, backgroundLabel)
}

@end
