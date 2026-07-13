//
//  JobsMagicTextField.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsMagicTextField.h"
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/UIView+Measure.h>
#import <JobsBaseUI/NSObject+Notification.h>

@interface JobsMagicTextField ()

Prop_strong()UILabel *placeholderAnimationLbl;

@end

@implementation JobsMagicTextField

-(void)dealloc{
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        self.placeholdAnimationable = YES;
        self.placeHolderAlignment = NSTextAlignmentLeft;
        self.clipsToBounds = NO;
        @jobs_weakify(self)
        [self addNotificationName:UITextFieldTextDidChangeNotification
                            block:^(id  _Nullable weakSelf,
                                    id  _Nullable arg) {
            @jobs_strongify(self)
            self.placeholderAnimationLbl.jobsVisible = self.placeholdAnimationable && isValue(self.text);
        }];
    };return self;
}
/// ⚠️当一个TF1->TF2，先获得焦点再失去焦点
/// 这个方法里面，正在获得、但还没有获得焦点，此时的self.isFirstResponder == NO
-(BOOL)becomeFirstResponder{
    [self upAnimation];
    return [super becomeFirstResponder];
}
/// 这个方法里面，正在丢失、但还没有丢失焦点，此时的self.isFirstResponder == YES
-(BOOL)resignFirstResponder{
    [self restoreAnimation];
    return [super resignFirstResponder];
}

-(void)upAnimation{
    if (self.placeholdAnimationable) {
        CGRect targetFrame = self.placeholderAnimationLbl.frame;
        targetFrame.origin.y = -self.moveDistance;
        @jobs_weakify(self)
        [UIView animateWithDuration:self.animationTime
                         animations:^{
            @jobs_strongify(self)
            self.placeholderAnimationLbl.jobsVisible = YES;
            self.placeholderAnimationLbl.byFrame(targetFrame);

            if (self.attributedPlaceholder && !self.placeholder) {
                self.placeholderAnimationLbl.attributedText = self.attributedPlaceholder;
            }else{
                self.placeholderAnimationLbl
                    .byTextCor(self.animationColor)
                    .byFont(self.animationFont);
                
                if (isValue(self.placeholder)) {
                    self.placeholderAnimationLbl.byText(self.placeholder);
                }
                
                self.placeholder = @"".tr;
            }
        }];
    }
}

-(void)restoreAnimation{
    if (self.placeholdAnimationable) {
        if (self.text.length > 0 ||
            self.placeholderAnimationLbl.frame.origin.y == 0) {
            return ;
        }
        CGRect targetFrame = self.placeholderAnimationLbl.frame;
        targetFrame.origin.y = 0;
        @jobs_weakify(self)
        [UIView animateWithDuration:self.animationTime
                         animations:^{
            @jobs_strongify(self)
            self.placeholderAnimationLbl.jobsVisible = NO;
            self.placeholderAnimationLbl.byFrame(targetFrame);

            if (self.attributedPlaceholder && !self.placeholder) {
                self.placeholderAnimationLbl.attributedText = self.attributedPlaceholder;
            }else{
                self.placeholder = self.placeholderAnimationLbl.text;
                self.placeholderAnimationLbl
                    .byText(@"".tr)
                    .byTextCor(self.placeholderColor)
                    .byFont(self.placeholderFont);
            }
        }];
    }
}

-(void)setText:(NSString *)text{
    [super setText:text];
    if (text.length) {
        [self upAnimation];
    }else{
        [self restoreAnimation];
    }
}
#pragma mark —— lazyLoad
-(UILabel *)placeholderAnimationLbl{
    if (!_placeholderAnimationLbl) {
        @jobs_weakify(self)
        _placeholderAnimationLbl = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byLabelBlock(^(__kindof UILabel * _Nullable data) {
                    if (self.attributedPlaceholder && !self.placeholder) {
                        data.byAttributedString(self.attributedPlaceholder);
                    } else {
                        data
                            .byText(self.placeholder)
                            .byFont(self.font);
                    }
                })
                .byTextAlignment(self.textAlignment)
                .byJobsVisible(YES)
                .byFrame(CGRectMake(self.placeHolderOffset + self.leftViewOffsetX,
                                    self.y,
                                    self.width,
                                    self.height))
                .byBgColor(JobsClearColor)
                .addOn(self);
        });
    };return _placeholderAnimationLbl;
}

-(UIColor *)animationColor{
    if (!_animationColor) {
        _animationColor = self.placeholderColor;
    };return _animationColor;
}

-(UIFont *)animationFont{
    if (!_animationFont) {
        _animationFont = self.placeholderFont;
    };return _animationFont;
}

-(CGFloat)moveDistance{
    if (_moveDistance == 0) {
        _moveDistance = self.frame.size.height / 2;
    };return _moveDistance;
}
    
-(NSTimeInterval)animationTime{
    if (!_animationTime) {
        _animationTime = 0.25f;
    };return _animationTime;
}

@end
