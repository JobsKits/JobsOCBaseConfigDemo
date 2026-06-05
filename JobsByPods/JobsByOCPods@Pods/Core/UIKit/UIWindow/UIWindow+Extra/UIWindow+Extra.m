//
//  UIWindow+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIWindow+Extra.h"

@implementation UIWindow (Extra)

+(JobsRetWindowByWindowSceneBlock _Nonnull)initByScene{
    return ^__kindof UIWindow *_Nullable(UIWindowScene *_Nullable data){
        return [UIWindow.alloc initWithWindowScene:data];
    };
}

+(JobsRetWindowByFrameBlock _Nonnull)initByFrame{
    return ^__kindof UIWindow *_Nullable(CGRect frame){
        return [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    };
}
/// 横屏模式下Window的宽高互换
-(JobsRetFrameByVoidBlock _Nonnull)landscapeWindowFrame{
    return ^CGRect(){
        @jobs_weakify(self)
        return jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            @jobs_strongify(self)
            data.byJobsX(self.x)
                .byJobsY(self.y)
                .byJobsWidth(MAX(self.height,self.width))
                .byJobsHeight(MIN(self.height,self.width));
        });
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.objBlock) self.objBlock(self);
}

@end
