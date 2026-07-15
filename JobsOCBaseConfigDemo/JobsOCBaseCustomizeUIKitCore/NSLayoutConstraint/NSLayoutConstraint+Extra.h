//
//  NSLayoutConstraint+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSLAYOUTCONSTRAINT_EXTRA_C0030FC103
#define JOBS_HEADER_GUARD_NSLAYOUTCONSTRAINT_EXTRA_C0030FC103

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (Extra)

+(jobsByArrBlock _Nonnull)initBy;
+(jobsByArrBlock _Nonnull)deactivateBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSLAYOUTCONSTRAINT_EXTRA_C0030FC103 */
