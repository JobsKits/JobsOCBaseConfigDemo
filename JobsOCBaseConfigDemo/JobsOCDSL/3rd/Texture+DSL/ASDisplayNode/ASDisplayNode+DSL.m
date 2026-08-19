//
//  ASDisplayNode+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月5日，星期五.
//

#import "ASDisplayNode+DSL.h"

@implementation ASDisplayNode (DSL)

-(JobsRetDisplayNodeByCGSizeBlock _Nonnull)byPreferredSize{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(CGSize data){
        @jobs_strongify(self)
        self.style.preferredSize = data;
        return self;
    };
}
-(JobsRetDisplayNodeByFrameBlock _Nonnull)byFrame{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(CGRect data){
        @jobs_strongify(self)
        self.frame = data;
        return self;
    };
}

-(JobsRetDisplayNodeByColorBlock _Nonnull)byBgColor{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetDisplayNodeByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(CGFloat data){
        @jobs_strongify(self)
        self.alpha = data;
        return self;
    };
}

-(JobsRetDisplayNodeByBOOLBlock _Nonnull)byHidden{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(BOOL data){
        @jobs_strongify(self)
        self.hidden = data;
        return self;
    };
}

-(JobsRetDisplayNodeByIntegerBlock _Nonnull)byContentMode{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(NSInteger data){
        @jobs_strongify(self)
        self.contentMode = data;
        return self;
    };
}

-(JobsRetDisplayNodeByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(CGFloat data){
        @jobs_strongify(self)
        self.cornerRadius = data;
        return self;
    };
}

-(JobsRetDisplayNodeByBOOLBlock _Nonnull)byClipsToBounds{
    @jobs_weakify(self)
    return ^__kindof ASDisplayNode *_Nonnull(BOOL data){
        @jobs_strongify(self)
        self.clipsToBounds = data;
        return self;
    };
}

@end
