//
//  UIButtonModel+UIViewModelProtocol.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButtonModel+UIViewModelProtocol.h"

@implementation UIButtonModel (UIViewModelProtocol)
#pragma mark —— Prop_copy(nullable)NSString *normalImageURLString;
JobsKey(_normalImageURLString)
-(NSString *)normalImageURLString {
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsNormalImageURLString)))(self, @selector(jobsNormalImageURLString)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsNormalImageURLString {
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return Jobs_getAssociatedObject(_normalImageURLString);
    };
}

-(void)setNormalImageURLString:(NSString *)normalImageURLString{
    jobsByStrBlock action = ((jobsByStrBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsSetNormalImageURLString)))(self, @selector(jobsSetNormalImageURLString));
    if (action) action(normalImageURLString);
}

-(jobsByStrBlock _Nonnull)jobsSetNormalImageURLString{
    @jobs_weakify(self)
    return ^(NSString * normalImageURLString){
        @jobs_strongify(self)
        if (!self) return;
        NSString *urlString = normalImageURLString.jobsImageURLPlus();
        Jobs_setAssociatedCOPY_NONATOMIC(_normalImageURLString, urlString);
        self.byNormalImageURL(JobsUrl(urlString));
    };
}
#pragma mark —— Prop_strong(nullable)NSURL *normalImageURL;
JobsKey(_normalImageURL)
-(NSURL *)normalImageURL {
    return (((JobsRetURLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsNormalImageURL)))(self, @selector(jobsNormalImageURL)))();
}

-(JobsRetURLByVoidBlock _Nonnull)jobsNormalImageURL {
    @jobs_weakify(self)
    return ^NSURL *{
        @jobs_strongify(self)
        if (!self) return nil;
        return Jobs_getAssociatedObject(_normalImageURL);
    };
}

-(void)setNormalImageURL:(NSURL *)normalImageURL{
    jobsByURLBlock action = ((jobsByURLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsSetNormalImageURL)))(self, @selector(jobsSetNormalImageURL));
    if (action) action(normalImageURL);
}

-(jobsByURLBlock _Nonnull)jobsSetNormalImageURL{
    @jobs_weakify(self)
    return ^(NSURL * normalImageURL){
        @jobs_strongify(self)
        if (!self) return;
        Jobs_setAssociatedRETAIN_NONATOMIC(_normalImageURL, normalImageURL);
    };
}
#pragma mark —— Prop_copy(nullable)NSString *normalBgImageURLString;
JobsKey(_normalBgImageURLString)
-(NSString *)normalBgImageURLString {
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsNormalBgImageURLString)))(self, @selector(jobsNormalBgImageURLString)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsNormalBgImageURLString {
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return Jobs_getAssociatedObject(_normalBgImageURLString);
    };
}

-(void)setNormalBgImageURLString:(NSString *)normalBgImageURLString{
    jobsByStrBlock action = ((jobsByStrBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsSetNormalBgImageURLString)))(self, @selector(jobsSetNormalBgImageURLString));
    if (action) action(normalBgImageURLString);
}

-(jobsByStrBlock _Nonnull)jobsSetNormalBgImageURLString{
    @jobs_weakify(self)
    return ^(NSString * normalBgImageURLString){
        @jobs_strongify(self)
        if (!self) return;
        NSString *urlString = normalBgImageURLString.jobsImageURLPlus();
        Jobs_setAssociatedCOPY_NONATOMIC(_normalBgImageURLString, urlString);
        self.byNormalBgImageURL(JobsUrl(urlString));
    };
}
#pragma mark —— Prop_strong(nullable)NSURL *normalBgImageURL;
JobsKey(_normalBgImageURL)
-(NSURL *)normalBgImageURL {
    return (((JobsRetURLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsNormalBgImageURL)))(self, @selector(jobsNormalBgImageURL)))();
}

-(JobsRetURLByVoidBlock _Nonnull)jobsNormalBgImageURL {
    @jobs_weakify(self)
    return ^NSURL *{
        @jobs_strongify(self)
        if (!self) return nil;
        return Jobs_getAssociatedObject(_normalBgImageURL);
    };
}

-(void)setNormalBgImageURL:(NSURL *)normalBgImageURL{
    jobsByURLBlock action = ((jobsByURLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButtonModel.class, @selector(jobsSetNormalBgImageURL)))(self, @selector(jobsSetNormalBgImageURL));
    if (action) action(normalBgImageURL);
}

-(jobsByURLBlock _Nonnull)jobsSetNormalBgImageURL{
    @jobs_weakify(self)
    return ^(NSURL * normalBgImageURL){
        @jobs_strongify(self)
        if (!self) return;
        Jobs_setAssociatedRETAIN_NONATOMIC(_normalBgImageURL, normalBgImageURL);
    };
}

@end
