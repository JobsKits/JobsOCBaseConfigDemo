//
//  BaseTextView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseTextView.h"

@interface BaseTextView ()

@end

@implementation BaseTextView

-(JobsRetBaseTextViewByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof BaseTextView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}
/// BaseProtocol
@synthesize becomeFirstResponder = _becomeFirstResponder;
-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}
#pragma mark —— 初始化
- (instancetype)init{
    if (self = [super init]) {
        self.setupDefaults();
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        @jobs_weakify(self)
        UIMenuController *menu = jobsMakeMenuController(^(__kindof UIMenuController * _Nullable menu) {
            menu.menuItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@"响应事件".jobsTr().initMenuItemBy(selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                                                       id _Nullable arg) {
                    @jobs_strongify(self)
                    if (self.retIDBySelectorBlock) self.retIDBySelectorBlock(weakSelf,arg);
                    return nil;
                }, MethodName(self), self)));
            });
        });
        [menu update];
        if(@available(iOS 10.3, *)){
            [menu showMenuFromView:self rect:self.bounds];
        }else{
            [menu setTargetRect:self.bounds inView:self];
            [menu setMenuVisible:YES animated:YES];
        }
#pragma clang diagnostic pop
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame
               textContainer:(NSTextContainer *)textContainer {
    if (self = [super initWithFrame:frame textContainer:textContainer]) {
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseTextView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        /// 始终保持内容从顶部开始
        self.adjustContentOffset();
    };
}
#pragma mark —— UIResponder
-(BOOL)canBecomeFirstResponder{
    JobsRetBOOLByVoidBlock action = ((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseTextView.class, @selector(jobsCanBecomeFirstResponder)))(self, @selector(jobsCanBecomeFirstResponder));
    return action ? action() : (BOOL){0};
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanBecomeFirstResponder {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.becomeFirstResponder; /// NO:禁止成为第一响应者，彻底禁用菜单
    };
}

-(jobsByVoidBlock _Nonnull)jobs_toastUnsupportedEditAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @"暂无对应方法".jobsTr().toast();
    };
}

-(void)delete:(id)sender{
    jobsByIDBlock action = ((jobsByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseTextView.class, @selector(jobsDelete)))(self, @selector(jobsDelete));
    if (action) action(sender);
}

-(jobsByIDBlock _Nonnull)jobsDelete{
    @jobs_weakify(self)
    return ^(id sender){
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_toastUnsupportedEditAction();
    };
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if(!sender) return NO;
    if ([super canPerformAction:action withSender:sender]) return YES;
    if (action == @selector(delete:)) return YES;
    if([sender isKindOfClass:UIMenuController.class] || [sender isKindOfClass:UIMenu.class]){// _UIImmutableKeyCommand
        return [NSStringFromSelector(action) containsString:@"selector_"];
    };return NO;
#pragma clang diagnostic pop
}
/// 只有当内容高度小于视图高度时才需要强制设置 offset
-(jobsByVoidBlock _Nonnull)adjustContentOffset{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.contentSize.height < self.bounds.size.height) self.contentOffset = CGPointZero;
    };
}

-(jobsByVoidBlock _Nonnull)setupDefaults{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        /// 从 iOS 16 起，UITextView 使用新的文本渲染系统，会使用 UITextLayoutFragmentView。
        /// 它默认在某些情况下会将内容垂直居中，比如文本少、没有足够内容填满 UITextView 的高度时。
        /// 所以一下操作就是在关闭这个新特性
        self.switchs();
        /// 接受通知
        @jobs_weakify(self)
        [self addNotificationName:UITextViewTextDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            NSLog(@"通知传递过来的 = %@",notification.object);
            self.adjustContentOffset();
        }];
    };
}

@end

@implementation JobsBasePopupTextView

@end
