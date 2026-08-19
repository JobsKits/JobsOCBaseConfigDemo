//
//  JobsOCGraphicCaptchaView.m
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsOCGraphicCaptchaView.h"

static CGFloat JobsOCGraphicCaptchaRandomCGFloat(CGFloat min, CGFloat max) {
    if (max <= min) return min;
    CGFloat percent = (CGFloat)arc4random_uniform(10000) / 10000.0f;
    return min + (max - min) * percent;
}

static UIColor *JobsOCGraphicCaptchaRandomColor(CGFloat alpha) {
    return jobsMakeCor2(^(__kindof JobsCorModel * _Nullable data) {
        data.byHue(JobsOCGraphicCaptchaRandomCGFloat(0, 1))
            .bySaturation(JobsOCGraphicCaptchaRandomCGFloat(0.45f, 0.95f))
            .byBrightness(JobsOCGraphicCaptchaRandomCGFloat(0.45f, 0.95f))
            .byAlpha(alpha);
    });
}

@interface JobsOCGraphicCaptchaView (){
    JobsOCGraphicCaptchaConfig *_config;
}

@end

@implementation JobsOCGraphicCaptchaView
-(JobsRetJobsOCGraphicCaptchaViewByConfigBlock _Nonnull)byConfig{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(JobsOCGraphicCaptchaConfig *_Nullable data){
        @jobs_strongify(self)
        self.config = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByStrBlock _Nonnull)byCaptchaText{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.captchaText = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByCorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByCorBlock _Nonnull)byCaptchaBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.captchaBackgroundColor = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byInterferenceLineCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.interferenceLineCount = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byNoisePointCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.noisePointCount = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByBOOLBlock _Nonnull)byShouldRefreshWhenTapped{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.shouldRefreshWhenTapped = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByRefreshBlock _Nonnull)byRefreshBlock{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(jobsByStrBlock _Nullable data){
        @jobs_strongify(self)
        self.refreshBlock = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaViewByBOOLBlock _Nonnull)byUserInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.userInteractionEnabled = data;
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.setupCaptchaView();
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.setupCaptchaView();
    };return self;
}

-(void)awakeFromNib{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCGraphicCaptchaView.class, @selector(jobsAwakeFromNib)))(self, @selector(jobsAwakeFromNib));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super awakeFromNib];
        self.setupCaptchaView();
    };
}

-(jobsByVoidBlock _Nonnull)setupCaptchaView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byOpaque(NO);
        self.byUserInteractionEnabled(YES);
        self.byShouldRefreshWhenTapped(YES);
        self.byInterferenceLineCount(7);
        self.byNoisePointCount(18);
        self.byCaptchaBackgroundColor(RGBA_SAMECOLOR(1 * 255.0, 0.92f));
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(jobs_refreshCaptchaByTap)];
        [self addGestureRecognizer:tap];
        self.refreshCaptcha();
    };
}

-(void)jobs_refreshCaptchaByTap{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCGraphicCaptchaView.class, @selector(jobsJobs_refreshCaptchaByTap)))(self, @selector(jobsJobs_refreshCaptchaByTap));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsJobs_refreshCaptchaByTap{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.shouldRefreshWhenTapped) self.refreshCaptcha();
    };
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCGraphicCaptchaView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        if (CGRectIsEmpty(rect)) return;
        CGContextRef context = UIGraphicsGetCurrentContext();
        if (!context) return;
        [self.captchaBackgroundColor setFill];
        UIRectFill(rect);
        [self drawNoiseInRect:rect
                      context:context];
        [self drawCaptchaTextInRect:rect
                            context:context];
    };
}

-(void)drawCaptchaTextInRect:(CGRect)rect
                     context:(CGContextRef)context{
    NSString *text = self.captchaText.length ? self.captchaText : JobsOCGraphicCaptchaGenerator.randomTextByConfig(self.config);
    if (!text.length) return;
    NSMutableArray<NSString *> *characters = NSMutableArray.array;
    [text enumerateSubstringsInRange:NSMakeRange(0, text.length)
                              options:NSStringEnumerationByComposedCharacterSequences
                           usingBlock:^(NSString *_Nullable substring,
                                        NSRange substringRange,
                                        NSRange enclosingRange,
                                        BOOL *stop) {
        if (substring.length) [characters addObject:substring];
    }];
    if (!characters.count) return;
    CGFloat cellWidth = CGRectGetWidth(rect) / characters.count;
    CGFloat centerY = CGRectGetMidY(rect);
    [characters enumerateObjectsUsingBlock:^(NSString * _Nonnull character,
                                             NSUInteger idx,
                                             BOOL * _Nonnull stop) {
        UIFont *font = self.font;
        UIColor *textColor = self.textColor ?: JobsOCGraphicCaptchaRandomColor(0.95f);
        CGSize textSize = [character sizeWithAttributes:@{NSFontAttributeName:font}];
        CGFloat x = cellWidth * idx + MAX(2, (cellWidth - textSize.width) / 2.0f) + JobsOCGraphicCaptchaRandomCGFloat(-2, 2);
        CGFloat y = centerY - textSize.height / 2.0f + JobsOCGraphicCaptchaRandomCGFloat(-4, 4);
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, x + textSize.width / 2.0f, y + textSize.height / 2.0f);
        CGContextRotateCTM(context, JobsOCGraphicCaptchaRandomCGFloat(-0.28f, 0.28f));
        [character drawAtPoint:CGPointMake(-textSize.width / 2.0f, -textSize.height / 2.0f)
                withAttributes:@{NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:textColor}];
        CGContextRestoreGState(context);
    }];
}

-(void)drawNoiseInRect:(CGRect)rect
               context:(CGContextRef)context{
    CGContextSetLineWidth(context, 1.0f);
    for (NSUInteger i = 0; i < self.interferenceLineCount; i++) {
        CGContextSetStrokeColorWithColor(context, JobsOCGraphicCaptchaRandomColor(0.72f).CGColor);
        CGContextMoveToPoint(context,
                             JobsOCGraphicCaptchaRandomCGFloat(CGRectGetMinX(rect), CGRectGetMaxX(rect)),
                             JobsOCGraphicCaptchaRandomCGFloat(CGRectGetMinY(rect), CGRectGetMaxY(rect)));
        CGContextAddLineToPoint(context,
                                JobsOCGraphicCaptchaRandomCGFloat(CGRectGetMinX(rect), CGRectGetMaxX(rect)),
                                JobsOCGraphicCaptchaRandomCGFloat(CGRectGetMinY(rect), CGRectGetMaxY(rect)));
        CGContextStrokePath(context);
    }
    for (NSUInteger i = 0; i < self.noisePointCount; i++) {
        CGRect pointRect = CGRectMake(JobsOCGraphicCaptchaRandomCGFloat(CGRectGetMinX(rect), CGRectGetMaxX(rect)),
                                      JobsOCGraphicCaptchaRandomCGFloat(CGRectGetMinY(rect), CGRectGetMaxY(rect)),
                                      JobsOCGraphicCaptchaRandomCGFloat(1.0f, 2.4f),
                                      JobsOCGraphicCaptchaRandomCGFloat(1.0f, 2.4f));
        [JobsOCGraphicCaptchaRandomColor(0.55f) setFill];
        UIRectFill(pointRect);
    }
}

-(jobsByVoidBlock _Nonnull)refreshCaptcha{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byCaptchaText(JobsOCGraphicCaptchaGenerator.randomTextByConfig(self.config));
        if (self.refreshBlock) self.refreshBlock(self.captchaText);
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)validateInput{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable input){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [JobsOCGraphicCaptchaGenerator validateInput:input
                                                    captcha:self.captchaText
                                              caseSensitive:self.config.caseSensitive];
    };
}

#pragma mark —— LazyLoad
-(JobsOCGraphicCaptchaConfig *)config{
    if (!_config) {
        _config = JobsOCGraphicCaptchaConfig.defaultConfig();
    };return _config;
}

-(void)setConfig:(JobsOCGraphicCaptchaConfig *)config{
    _config = config.copy ?: JobsOCGraphicCaptchaConfig.defaultConfig();
    self.refreshCaptcha();
}

-(void)setCaptchaText:(NSString *)captchaText{
    _captchaText = captchaText.copy ?: @"";
    [self setNeedsDisplay];
}

-(UIFont *)font{
    if (!_font) {
        _font = UIFontBoldSystemFontOfSize(18);
    };return _font;
}

-(UIColor *)textColor{
    return _textColor;
}

-(UIColor *)captchaBackgroundColor{
    if (!_captchaBackgroundColor) {
        _captchaBackgroundColor = RGBA_SAMECOLOR(1 * 255.0, 0.92f);
    };return _captchaBackgroundColor;
}

@end
