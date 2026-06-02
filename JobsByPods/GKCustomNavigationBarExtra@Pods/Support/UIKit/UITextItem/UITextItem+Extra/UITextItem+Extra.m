//
//  UITextItem+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITextItem+Extra.h"

@implementation UITextItem (Extra)

#pragma mark —— Prop_strong()UITextView *textView;
JobsKey(_textView)
@dynamic textView;
-(UITextView *)textView{
    return Jobs_getAssociatedObject(_textView);
}

-(void)setTextView:(UITextView *)textView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textView, textView)
}

@end
