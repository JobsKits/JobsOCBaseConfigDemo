//
//  JobsGraphicCaptchaView.m
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsGraphicCaptchaView.h"

static CGFloat JobsGraphicCaptchaRandomCGFloat(CGFloat min, CGFloat max) {
    if (max <= min) return min;
    CGFloat percent = (CGFloat)arc4random_uniform(10000) / 10000.0f;
    return min + (max - min) * percent;
}

static UIColor *JobsGraphicCaptchaRandomColor(CGFloat alpha) {
    return [UIColor colorWithHue:JobsGraphicCaptchaRandomCGFloat(0, 1)
                      saturation:JobsGraphicCaptchaRandomCGFloat(0.45f, 0.95f)
                      brightness:JobsGraphicCaptchaRandomCGFloat(0.45f, 0.95f)
                           alpha:alpha];
}

@interface JobsGraphicCaptchaView ()

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsGraphicCaptchaView
@interface JobsGraphicCaptchaView (JobsPropertyDSLSetterAutogen_5e740cb023)
-(void)setConfig:(JobsGraphicCaptchaConfig *_Nullable)data;
-(void)setFont:(UIFont *_Nullable)data;
-(void)setTextColor:(UIColor *_Nullable)data;
-(void)setRefreshBlock:(jobsByStrBlock _Nullable)data;
-(void)setCaptchaBackgroundColor:(UIColor * _Nullable)data;
-(void)setCaptchaText:(NSString * _Nullable)data;
-(void)setInterferenceLineCount:(NSUInteger)data;
-(void)setNoisePointCount:(NSUInteger)data;
-(void)setShouldRefreshWhenTapped:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsGraphicCaptchaView

@implementation JobsGraphicCaptchaView
@synthesize config = _config;

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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGraphicCaptchaView.class, @selector(jobsAwakeFromNib)))(self, @selector(jobsAwakeFromNib));
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
        self.byCaptchaBackgroundColor([UIColor colorWithWhite:1 alpha:0.92f]);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(jobs_refreshCaptchaByTap)];
        [self addGestureRecognizer:tap];
        self.refreshCaptcha();
    };
}

-(void)jobs_refreshCaptchaByTap{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGraphicCaptchaView.class, @selector(jobsJobs_refreshCaptchaByTap)))(self, @selector(jobsJobs_refreshCaptchaByTap));
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
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGraphicCaptchaView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
    NSString *text = self.captchaText.length ? self.captchaText : JobsGraphicCaptchaGenerator.randomTextByConfig(self.config);
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
        UIColor *textColor = self.textColor ?: JobsGraphicCaptchaRandomColor(0.95f);
        CGSize textSize = [character sizeWithAttributes:@{NSFontAttributeName:font}];
        CGFloat x = cellWidth * idx + MAX(2, (cellWidth - textSize.width) / 2.0f) + JobsGraphicCaptchaRandomCGFloat(-2, 2);
        CGFloat y = centerY - textSize.height / 2.0f + JobsGraphicCaptchaRandomCGFloat(-4, 4);
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, x + textSize.width / 2.0f, y + textSize.height / 2.0f);
        CGContextRotateCTM(context, JobsGraphicCaptchaRandomCGFloat(-0.28f, 0.28f));
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
        CGContextSetStrokeColorWithColor(context, JobsGraphicCaptchaRandomColor(0.72f).CGColor);
        CGContextMoveToPoint(context,
                             JobsGraphicCaptchaRandomCGFloat(CGRectGetMinX(rect), CGRectGetMaxX(rect)),
                             JobsGraphicCaptchaRandomCGFloat(CGRectGetMinY(rect), CGRectGetMaxY(rect)));
        CGContextAddLineToPoint(context,
                                JobsGraphicCaptchaRandomCGFloat(CGRectGetMinX(rect), CGRectGetMaxX(rect)),
                                JobsGraphicCaptchaRandomCGFloat(CGRectGetMinY(rect), CGRectGetMaxY(rect)));
        CGContextStrokePath(context);
    }
    for (NSUInteger i = 0; i < self.noisePointCount; i++) {
        CGRect pointRect = CGRectMake(JobsGraphicCaptchaRandomCGFloat(CGRectGetMinX(rect), CGRectGetMaxX(rect)),
                                      JobsGraphicCaptchaRandomCGFloat(CGRectGetMinY(rect), CGRectGetMaxY(rect)),
                                      JobsGraphicCaptchaRandomCGFloat(1.0f, 2.4f),
                                      JobsGraphicCaptchaRandomCGFloat(1.0f, 2.4f));
        [JobsGraphicCaptchaRandomColor(0.55f) setFill];
        UIRectFill(pointRect);
    }
}

-(jobsByVoidBlock _Nonnull)refreshCaptcha{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byCaptchaText(JobsGraphicCaptchaGenerator.randomTextByConfig(self.config));
        if (self.refreshBlock) self.refreshBlock(self.captchaText);
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)validateInput{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable input){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [JobsGraphicCaptchaGenerator validateInput:input
                                                  captcha:self.captchaText
                                            caseSensitive:self.config.caseSensitive];
    };
}

#pragma mark —— LazyLoad
-(JobsGraphicCaptchaConfig *)config{
    if (!_config) {
        _config = JobsGraphicCaptchaConfig.defaultConfig();
    };return _config;
}

-(void)setConfig:(JobsGraphicCaptchaConfig *)config{
    _config = config.copy ?: JobsGraphicCaptchaConfig.defaultConfig();
    self.refreshCaptcha();
}

-(void)setCaptchaText:(NSString *)captchaText{
    _captchaText = captchaText.copy ?: @"";
    [self setNeedsDisplay];
}

-(UIFont *)font{
    if (!_font) {
        _font = [UIFont boldSystemFontOfSize:18];
    };return _font;
}

-(UIColor *)textColor{
    return _textColor;
}

-(UIColor *)captchaBackgroundColor{
    if (!_captchaBackgroundColor) {
        _captchaBackgroundColor = [UIColor colorWithWhite:1 alpha:0.92f];
    };return _captchaBackgroundColor;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsGraphicCaptchaView
-(JobsRetJobsGraphicCaptchaViewByJobsGraphicCaptchaConfigBlock _Nonnull)byConfig{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView *_Nullable(JobsGraphicCaptchaConfig *_Nullable data){
        @jobs_strongify(self)
        [self setConfig:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByUIFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        [self setFont:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByUIColorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTextColor:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByjobsByStrBlockBlock _Nonnull)byRefreshBlock{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView *_Nullable(jobsByStrBlock _Nullable data){
        @jobs_strongify(self)
        [self setRefreshBlock:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByBOOLBlock _Nonnull)byShouldRefreshWhenTapped{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShouldRefreshWhenTapped:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByNSStringBlock _Nonnull)byCaptchaText{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setCaptchaText:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byInterferenceLineCount{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setInterferenceLineCount:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byNoisePointCount{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setNoisePointCount:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaViewByUIColorBlock _Nonnull)byCaptchaBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setCaptchaBackgroundColor:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsGraphicCaptchaView
@end
