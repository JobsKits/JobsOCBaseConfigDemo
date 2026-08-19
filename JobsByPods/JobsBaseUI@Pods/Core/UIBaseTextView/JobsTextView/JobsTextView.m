//
//  JobsTextView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTextView.h"

#import <JobsBaseUI/NSObject+Notification.h>
#import <JobsBaseUI/NSString+Sys.h>
#import <JobsBaseUI/NSString+Toast.h>
#import <SZTextViewExtra/SZTextView+Extra.h>

@interface JobsTextView()
/// UI
Prop_strong()UILabel *countLabel;
/// Data
Prop_strong()UITextModel *textModel;

@end

@implementation JobsTextView
@synthesize textModel = _textModel;
-(JobsRetJobsTextViewByTextModelBlock _Nonnull)byTextModel{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(UITextModel *_Nullable textModel){
        @jobs_strongify(self)
        [self setTextModel:textModel];
        return self;
    };
}

-(JobsRetJobsTextViewByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(UIReturnKeyType data){
        @jobs_strongify(self)
        self.returnKeyType_ = data;
        self.szTextView.returnKeyType = data;
        return self;
    };
}

-(JobsRetJobsTextViewByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(UIKeyboardAppearance data){
        @jobs_strongify(self)
        self.keyboardAppearance_ = data;
        self.szTextView.keyboardAppearance = data;
        return self;
    };
}

-(JobsRetJobsTextViewByUIKeyboardTypeBlock _Nonnull)byKeyboardType_{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(UIKeyboardType data){
        @jobs_strongify(self)
        self.keyboardType_ = data;
        self.szTextView.keyboardType = data;
        return self;
    };
}

-(JobsRetJobsTextViewByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.textFieldPlaceholder = data;
        self.szTextView.placeholder = data;
        return self;
    };
}

-(JobsRetJobsTextViewByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        self.textFont = data;
        self.szTextView.byFont(data);
        return self;
    };
}

-(JobsRetJobsTextViewByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        self.placeholderFont = data;
        self.szTextView.byPlaceholderFont(data);
        return self;
    };
}

-(JobsRetJobsTextViewByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof JobsTextView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.placeholderColor = data;
        self.szTextView.byPlaceholderColor(data);
        return self;
    };
}

-(UITextModel *)textModel{
    if (!_textModel) {
        _textModel = UITextModel.new;
    };return _textModel;
}
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsTextView.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_textViewOnceToken = 0;
        static_textView = nil;
    };
}

static JobsTextView *static_textView = nil;
static dispatch_once_t static_textViewOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsTextView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_textViewOnceToken, ^{
            static_textView = JobsTextView.new;
        });return static_textView;
    };
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                JobsLog(@"SSS = %d",b.boolValue);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super layoutSubviews];
        //    /// 内部指定圆切角
        //    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
        //                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UITextModel *_Nullable model) {
        @jobs_strongify(self)
        if([model isKindOfClass:UITextModel.class]){
            self.byTextModel((UITextModel *)model);
            self.updateWordCount(0);
            self.countLabel.byAlpha(1);
            self.szTextView.byAlpha(1);
        }
    };
}
#pragma mark —— 一些公有方法
-(JobsRetSZTextViewByVoidBlock _Nonnull)getTextView{
    @jobs_weakify(self)
    return ^SZTextView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.szTextView;
    };
}

-(jobsByNSIntegerBlock _Nonnull)updateWordCount{
    @jobs_weakify(self)
    return ^(NSInteger count){
        @jobs_strongify(self)
        if(count) self.textModel.curWordCount = count;
        self.countLabel
            .byText(toStringByNSInteger(self.textModel.curWordCount)
                    .add(JobsSeparation)
                    .add(toStringByNSInteger(self.textModel.maxWordCount)))
            .makeLabelByShowingType(UILabelShowingType_03);
    };
}
#pragma mark —— lazyLoad
@synthesize szTextView = _szTextView;
-(SZTextView *)szTextView{
    if (!_szTextView) {
        @jobs_weakify(self)
        _szTextView = jobsMakeSZTextView(^(SZTextView * _Nonnull textView) {
            @jobs_strongify(self)
            textView
                .byEditable(YES)
                .byBgColor(JobsClearColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(JobsWidth(5));
                    make.left.equalTo(self).offset(JobsWidth(10));
                    make.right.equalTo(self).offset(JobsWidth(-10));
                    make.bottom.equalTo(self.countLabel.mas_top);
                });
        });
        /// 这里的x是整个textView目前的所有字符串的值
        _szTextView.jobsTextViewSubscribeNextBlock(^(NSString * _Nullable x) {
            @jobs_strongify(self)
            /// 超过直接截取
            if(x.length > self.textModel.maxWordCount) {
                x = x.substringToIndex(self.textModel.maxWordCount);
                @"最多只能输入".jobsTr().add(toStringByLong(self.textModel.maxWordCount).add(@"个字".jobsTr())).toast();
            }
            self.szTextView.byText(x);
            self.textModel.byCurWordCount(x.length);
            self.updateWordCount(0);
            /// 向外回调目前的textView的字符串
            if (self.objBlock) self.objBlock(x);
        });
    }
    UITextModel *textModel = self.textModel;
    _szTextView
        .byText(textModel.text ?: @"")
        .byTextCor(textModel.textCor)
        .byPlaceholderColor(textModel.placeholderColor)
        .byPlaceholder(textModel.placeholder ?: @"");
    return _szTextView;
}

- (UILabel *)countLabel{
    if (!_countLabel) {
        @jobs_weakify(self)
        _countLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightBoldSize(12))
                .byTextAlignment(NSTextAlignmentCenter)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(17));
                make.bottom.mas_equalTo(-JobsWidth(8));
                make.right.equalTo(self).offset(-JobsWidth(5));
            });
        });
    };return _countLabel;
}

@end
