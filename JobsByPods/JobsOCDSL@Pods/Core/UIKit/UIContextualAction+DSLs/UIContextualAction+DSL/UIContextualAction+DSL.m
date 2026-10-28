//
//  UIContextualAction+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UIContextualAction+DSL.h"

@implementation UIContextualAction (DSL)

-(JobsRetContextualActionByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof UIContextualAction *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetContextualActionByColorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UIContextualAction *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetContextualActionByColorBlock _Nonnull)byBgColor{
    return self.byBackgroundColor;
}

-(JobsRetContextualActionByStringBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof UIContextualAction *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

@end
