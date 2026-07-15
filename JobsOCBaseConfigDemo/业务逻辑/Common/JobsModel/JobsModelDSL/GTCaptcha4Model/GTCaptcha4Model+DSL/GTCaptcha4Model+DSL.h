//
//  GTCaptcha4Model+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_GTCAPTCHA4MODEL_DSL_1C9FC20EFD0E5C55
#define JOBS_HEADER_GUARD_GTCAPTCHA4MODEL_DSL_1C9FC20EFD0E5C55

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTCaptcha4Model (DSL)

-(JobsRetGTCaptcha4ModelByGTCaptcha4SessionPointerBlock _Nonnull)byCaptcha4Session;
-(JobsRetGTCaptcha4ModelByGTCaptcha4ResultModelPointerBlock _Nonnull)byResult;
-(JobsRetGTCaptcha4ModelByStrBlock _Nonnull)byStatus;
-(JobsRetGTCaptcha4ModelByGTC4ErrorPointerBlock _Nonnull)byError;
-(JobsRetGTCaptcha4ModelByUIViewPointerBlock _Nonnull)byTargetView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_GTCAPTCHA4MODEL_DSL_1C9FC20EFD0E5C55 */
