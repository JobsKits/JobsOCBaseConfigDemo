//
//  UITextView+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITextView+Extra.h"

@implementation UITextView (Extra)
/// 从 iOS 16 起，UITextView 使用新的文本渲染系统，会使用 UITextLayoutFragmentView。
/// 它默认在某些情况下会将内容垂直居中，比如文本少、没有足够内容填满 UITextView 的高度时。
/// 所以一下操作就是在关闭这个新特性
-(jobsByVoidBlock _Nonnull)switchs{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byTextAlignment(NSTextAlignmentLeft)
            .byTextContainerInset(UIEdgeInsetsMake(0, 0, 0, 0))
            .byContentInset(UIEdgeInsetsZero);
        self.textContainer.byLineFragmentPadding(0);
        /// 强制滚动到顶部（必要）
        [self setContentOffset:CGPointZero animated:NO];
        /// 解决初始渲染偏移（适配 iOS 16+）
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(0.01 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.byContentOffset(CGPointZero);
        });
    };
}

-(JobsRetTextViewByNSIntegerBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSTextAlignment data){
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(JobsRetTextViewByEdgeInsetsBlock _Nonnull)byTextContainerInset{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.textContainerInset = data;
        return self;
    };
}

-(JobsRetTextViewByEdgeInsetsBlock _Nonnull)byContentInset{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.contentInset = data;
        return self;
    };
}

-(JobsRetTextViewByPointBlock _Nonnull)byContentOffset{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.contentOffset = data;
        return self;
    };
}

-(JobsRetTextViewByPointBlock _Nonnull)byContentOffsetWithAnimated{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setContentOffset:data animated:YES];
        return self;
    };
}

-(JobsRetTextViewByAttributedTextBlock _Nonnull)byAttributedText{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(__kindof NSAttributedString *attributedText){
        @jobs_strongify(self)
        self.attributedText = attributedText;
        return self;
    };
}

@end
