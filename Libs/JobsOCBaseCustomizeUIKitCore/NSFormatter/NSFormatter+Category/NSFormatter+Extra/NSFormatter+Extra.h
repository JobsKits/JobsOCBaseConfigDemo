//
//  NSFormatter+Extra.h
//  NSFormatter+Extra
//
//  Created by Jobs on 2026年5月15日，星期五.
//

#ifndef NSFormatter_Extra_h
#define NSFormatter_Extra_h

#import <Foundation/Foundation.h>
#import "JobsClass.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSFormatter (JobsModelExtra)

-(JobsRetStrByDateBlock _Nonnull)date;

@end

NS_ASSUME_NONNULL_END

#endif /* NSFormatter_Extra_h */
