//
//  NSString+ID.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_ID_388892EF1D
#define JOBS_HEADER_GUARD_NSSTRING_ID_388892EF1D

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ID)

-(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForSupplementaryViewBy;
-(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForDecorationViewBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_ID_388892EF1D */
