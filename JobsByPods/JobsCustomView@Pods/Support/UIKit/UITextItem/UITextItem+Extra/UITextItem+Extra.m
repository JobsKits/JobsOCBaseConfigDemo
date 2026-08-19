//
//  UITextItem+Extra.m
//  JobsCustomView
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


-(JobsRetUITextItemByTextViewBlock _Nonnull)byTextView{
    @jobs_weakify(self)
    return ^UITextItem *(UITextView *textView){
        @jobs_strongify(self)
        self.textView = textView;
        return self;
    };
}

@end
