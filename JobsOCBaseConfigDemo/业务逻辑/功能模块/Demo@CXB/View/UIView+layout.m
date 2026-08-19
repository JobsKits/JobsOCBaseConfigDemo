//
//  UIView+layout.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+layout.h"

@implementation UIView (layout)
- (JobsRetCGFloatByVoidBlock _Nonnull)x_{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
     return self.frame.origin.x;
    };
}
- (JobsRetCGFloatByVoidBlock _Nonnull)y_{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
     return self.frame.origin.y;
    };
}
- (JobsRetCGFloatByVoidBlock _Nonnull)w_{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
     return self.frame.size.width;
    };
}
- (JobsRetCGFloatByVoidBlock _Nonnull)h_{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
     return self.frame.size.height;
    };
}

@end
