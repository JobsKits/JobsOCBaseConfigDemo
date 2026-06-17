//
//  ASEditableTextNode+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ASEditableTextNode+DSL.h"

@interface ASEditableTextNode (DSL)

Prop_strong()id jobsETNBeginToken;
Prop_strong()id jobsETNChangeToken;
Prop_strong()id jobsETNEndToken;
Prop_copy()JobsEditableTextEventBlock jobsETNBeginBlock;
Prop_copy()JobsEditableTextEventBlock jobsETNChangeBlock;
Prop_copy()JobsEditableTextEventBlock jobsETNEndBlock;

@end

@implementation ASEditableTextNode (DSL)
#pragma mark —— Prop_strong()id jobsETNBeginToken;
JobsKey(_jobsETNBeginToken)
@dynamic jobsETNBeginToken;
#pragma mark —— Prop_strong()id jobsETNChangeToken;
JobsKey(_jobsETNChangeToken)
@dynamic jobsETNChangeToken;
#pragma mark —— Prop_strong()id jobsETNEndToken;
JobsKey(_jobsETNEndToken)
@dynamic jobsETNEndToken;
#pragma mark —— Prop_copy()JobsEditableTextEventBlock jobsETNBeginBlock;
JobsKey(_jobsETNBeginBlock)
@dynamic jobsETNBeginBlock;
#pragma mark —— Prop_copy()JobsEditableTextEventBlock jobsETNChangeBlock;
JobsKey(_jobsETNChangeBlock)
@dynamic jobsETNChangeBlock;
#pragma mark —— Prop_copy()JobsEditableTextEventBlock jobsETNEndBlock;
JobsKey(_jobsETNEndBlock)
@dynamic jobsETNEndBlock;

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
        Jobs_setAssociatedCOPY_NONATOMIC(_jobsETNBeginBlock, handler)

        id token = Jobs_getAssociatedObject(_jobsETNBeginToken);
        if (token){
            [NSNotificationCenter.defaultCenter removeObserver:token];
            Jobs_setAssociatedASSIGN(_jobsETNBeginToken, nil)
        }
        UITextView *tv = self.textView; // 触发 view
        if (handler && tv){
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidBeginEditingNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note){
                JobsEditableTextEventBlock blk = Jobs_getAssociatedObject(_jobsETNBeginBlock);
                if (blk) blk(self, tv);
            }];
            Jobs_setAssociatedRETAIN_NONATOMIC(_jobsETNBeginToken, newToken)
        };return self;
    };
}

-(JobsRetEditableTextNodeByOnChangeBlock _Nonnull)onTextChangeBy{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler){
        @jobs_strongify(self)
        Jobs_setAssociatedCOPY_NONATOMIC(_jobsETNChangeBlock, handler)

        id token = Jobs_getAssociatedObject(_jobsETNChangeToken);
        if (token){
            [[NSNotificationCenter defaultCenter] removeObserver:token];
            Jobs_setAssociatedASSIGN(_jobsETNChangeToken, nil)
        }
        UITextView *tv = self.textView;
        if (handler && tv){
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidChangeNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note){
                JobsEditableTextEventBlock blk = Jobs_getAssociatedObject(_jobsETNChangeBlock);
                if (blk) blk(self, tv);
            }];
            Jobs_setAssociatedRETAIN_NONATOMIC(_jobsETNChangeToken, newToken)
        };return self;
    };
}

-(JobsRetEditableTextNodeByOnEndBlock _Nonnull)onEndEditingBy{
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler){
        @jobs_strongify(self)
        Jobs_setAssociatedCOPY_NONATOMIC(_jobsETNEndBlock, handler)

        id token = Jobs_getAssociatedObject(_jobsETNEndToken);
        if (token){
            [[NSNotificationCenter defaultCenter] removeObserver:token];
            Jobs_setAssociatedASSIGN(_jobsETNEndToken, nil)
        }
        UITextView *tv = self.textView;
        if (handler && tv){
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidEndEditingNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note){
                JobsEditableTextEventBlock blk = Jobs_getAssociatedObject(_jobsETNEndBlock);
                if (blk) blk(self, tv);
            }];
            Jobs_setAssociatedRETAIN_NONATOMIC(_jobsETNEndToken, newToken)
        };return self;
    };
}

@end
