//
//  UILabel+Gesture.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UILabel+Gesture.h"

@implementation UILabel (Gesture)
-(jobsByVoidBlock _Nonnull)makeLabelGesture{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"给UILabel的子类加手势");
        self.byNumberOfTouchesRequired(1);
        self.byNumberOfTapsRequired(1);
        self.byMinimumPressDuration(0.1);
        self.byAllowableMovement(1);
        self.byUserInteractionEnabled(YES);
        self.byWeak_target(self);
        self.longPressGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                                 UILongPressGestureRecognizer *_Nullable arg) {
            JobsLog(@"UILabel 的 长按 手势");
            return nil;
        });
        if (self.longPressGR) self.longPressGR.byEnabled(YES);
        self.tapGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                           UITapGestureRecognizer *_Nullable arg) {
            JobsLog(@"UILabel 的 Tap 手势");
            self.clickLink();
            return nil;
        });
        if (self.tapGR) self.tapGR.byEnabled(YES);
    };
}

// 点击文本处理链接跳转
-(jobsByVoidBlock _Nonnull)clickLink{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSError *error = nil;
        NSDataDetector *detector = [NSDataDetector.alloc initWithTypes:NSTextCheckingTypeLink error:&error];
        if (error) {
            JobsLog(@"%@", @"出现错误".jobsTr());
            return;
        }
        //通过检测字符串最后几位是否是.com .cn...来进行判定
        NSArray *checkArr = [detector matchesInString:self.text
                                              options:0
                                                range:NSMakeRange(0, self.text.length)];
        //判断有没有链接
        if(checkArr.count > 0) {
            if (checkArr.count > 1) { //网址多于1个时让用户选择跳哪个链接
                JobsLog(@"%@", @"多于1个链接".jobsTr());
            }else {//一个链接直接打开
                JobsLog(@"%@", @"只有1个链接".jobsTr());
            }
        }else JobsLog(@"%@", @"没有链接".jobsTr());
    };
}

@end
