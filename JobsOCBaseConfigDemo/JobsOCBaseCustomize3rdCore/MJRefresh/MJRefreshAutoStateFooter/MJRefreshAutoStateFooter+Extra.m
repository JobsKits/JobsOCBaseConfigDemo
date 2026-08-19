//
//  MJRefreshAutoStateFooter+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/5/30.
//

#import "MJRefreshAutoStateFooter+Extra.h"

@implementation MJRefreshFooter (JobsExtra)

-(JobsRetMJRefreshFooterByStateBlock _Nonnull)byState{
    @jobs_weakify(self)
    return ^__kindof MJRefreshFooter *_Nullable(MJRefreshState data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.state = data;
        return self;
    };
}

@end

@implementation MJRefreshAutoStateFooter (Extra)
-(JobsRetIDByBOOLBlock _Nonnull)byAutomaticallyChangeAlpha{
    @jobs_weakify(self)
    return ^id(BOOL automaticallyChangeAlpha){
        @jobs_strongify(self)
        self.automaticallyChangeAlpha = automaticallyChangeAlpha;
        return self;
    };
}
-(JobsRetMJRefreshAutoStateFooterByRefreshConfigModelBlock _Nonnull)byMJRefreshFooterConfigModel{
    @jobs_weakify(self)
    return ^__kindof MJRefreshAutoStateFooter *_Nullable(MJRefreshConfigModel *_Nullable config){
        @jobs_strongify(self)
        self.handleWord(config);/// 文字
        self.stateLabel
            .byFont(config.font)// 设置字体
            .byTextCor(config.textColor);// 设置颜色
        /// 根据拖拽比例自动切换透明度
        self.byAutomaticallyChangeAlpha(config.automaticallyChangeAlpha);
        /// 震动特效反馈
        if (config.isShake) NSObject.feedbackGenerator(nil);
        return self;
    };
}

@end
