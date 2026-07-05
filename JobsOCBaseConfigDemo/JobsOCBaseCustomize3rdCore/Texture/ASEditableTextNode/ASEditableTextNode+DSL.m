//
//  ASEditableTextNode+DSL.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ASEditableTextNode+DSL.h"

JobsKey(kJobsETNBeginTokenKey)
JobsKey(kJobsETNChangeTokenKey)
JobsKey(kJobsETNEndTokenKey)
JobsKey(kJobsETNBeginBlockKey)
JobsKey(kJobsETNChangeBlockKey)
JobsKey(kJobsETNEndBlockKey)
@implementation ASEditableTextNode (DSL)

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byScrollEnabled{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (BOOL flag){
        @jobs_strongify(self)
        self.scrollEnabled = flag;
        return self;
    };
}

-(JobsRetEditableTextNodeByDictBlock _Nonnull)byTypingAttributes{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSDictionary<NSString*, id> *attrs){
        @jobs_strongify(self)
        self.typingAttributes = attrs;
        return self;
    };
}

-(JobsRetEditableTextNodeByRangeBlock _Nonnull)bySelectedRange{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSRange range){
        @jobs_strongify(self)
        self.selectedRange = range;
        return self;
    };
}

-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSAttributedString *text){
        @jobs_strongify(self)
        self.attributedPlaceholderText = text;
        return self;
    };
}

-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSAttributedString *text){
        @jobs_strongify(self)
        self.attributedText = text;
        return self;
    };
}

-(JobsRetEditableTextNodeByInsetsBlock _Nonnull)byTextContainerInset{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIEdgeInsets insets){
        @jobs_strongify(self)
        self.textContainerInset = insets;
        return self;
    };
}

-(JobsRetEditableTextNodeByUIntBlock _Nonnull)byMaximumLinesToDisplay{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSUInteger value){
        @jobs_strongify(self)
        self.maximumLinesToDisplay = value;
        return self;
    };
}

-(JobsRetEditableTextNodByeAutocapBlock _Nonnull)byAutocapitalizationType{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UITextAutocapitalizationType t){
        @jobs_strongify(self)
        self.autocapitalizationType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByAutocorrBlock _Nonnull)byAutocorrectionType{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UITextAutocorrectionType t){
        @jobs_strongify(self)
        self.autocorrectionType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeBySpellBlock _Nonnull)bySpellCheckingType{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UITextSpellCheckingType t){
        @jobs_strongify(self)
        self.spellCheckingType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByKeyboardTypeBlock _Nonnull)byKeyboardType{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIKeyboardType t){
        @jobs_strongify(self)
        self.keyboardType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIKeyboardAppearance t){
        @jobs_strongify(self)
        self.keyboardAppearance = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByReturnKeyBlock _Nonnull)byReturnKeyType{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIReturnKeyType t){
        @jobs_strongify(self)
        self.returnKeyType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byEnablesReturnKeyAutomatically{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (BOOL flag){
        @jobs_strongify(self)
        self.enablesReturnKeyAutomatically = flag;
        return self;
    };
}

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)bySecureTextEntry{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (BOOL flag){
        @jobs_strongify(self)
        self.secureTextEntry = flag;
        return self;
    };
}

-(JobsRetEditableTextNodeByTextViewBlock _Nonnull)byTextView{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (jobsByTextViewBlock cfg){
        @jobs_strongify(self)
        if (cfg){
            cfg(self.textView);// 触发 view 加载，拿到内部 UITextView
        };return self;
    };
}
/// 事件（Begin / Change / End）
-(JobsRetEditableTextNodeByOnBeginBlock _Nonnull)onBeginEditingBy{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler){
        @jobs_strongify(self)
        Jobs_setAssociatedCOPY_NONATOMIC(kJobsETNBeginBlockKey, handler)

        id token = Jobs_getAssociatedObject(kJobsETNBeginTokenKey);
        if (token){
            [NSNotificationCenter.defaultCenter removeObserver:token];
            Jobs_setAssociatedASSIGN(kJobsETNBeginTokenKey, nil)
        }
        UITextView *tv = self.textView; // 触发 view
        if (handler && tv){
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidBeginEditingNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note){
                JobsEditableTextEventBlock blk = Jobs_getAssociatedObject(kJobsETNBeginBlockKey);
                if (blk) blk(self, tv);
            }];
            Jobs_setAssociatedRETAIN_NONATOMIC(kJobsETNBeginTokenKey, newToken)
        };return self;
    };
}

-(JobsRetEditableTextNodeByOnChangeBlock _Nonnull)onTextChangeBy{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler){
        @jobs_strongify(self)
        Jobs_setAssociatedCOPY_NONATOMIC(kJobsETNChangeBlockKey, handler)

        id token = Jobs_getAssociatedObject(kJobsETNChangeTokenKey);
        if (token){
            [[NSNotificationCenter defaultCenter] removeObserver:token];
            Jobs_setAssociatedASSIGN(kJobsETNChangeTokenKey, nil)
        }
        UITextView *tv = self.textView;
        if (handler && tv){
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidChangeNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note){
                JobsEditableTextEventBlock blk = Jobs_getAssociatedObject(kJobsETNChangeBlockKey);
                if (blk) blk(self, tv);
            }];
            Jobs_setAssociatedRETAIN_NONATOMIC(kJobsETNChangeTokenKey, newToken)
        };return self;
    };
}

-(JobsRetEditableTextNodeByOnEndBlock _Nonnull)onEndEditingBy{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler){
        @jobs_strongify(self)
        Jobs_setAssociatedCOPY_NONATOMIC(kJobsETNEndBlockKey, handler)

        id token = Jobs_getAssociatedObject(kJobsETNEndTokenKey);
        if (token){
            [[NSNotificationCenter defaultCenter] removeObserver:token];
            Jobs_setAssociatedASSIGN(kJobsETNEndTokenKey, nil)
        }
        UITextView *tv = self.textView;
        if (handler && tv){
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidEndEditingNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note){
                JobsEditableTextEventBlock blk = Jobs_getAssociatedObject(kJobsETNEndBlockKey);
                if (blk) blk(self, tv);
            }];
            Jobs_setAssociatedRETAIN_NONATOMIC(kJobsETNEndTokenKey, newToken)
        };return self;
    };
}

@end
