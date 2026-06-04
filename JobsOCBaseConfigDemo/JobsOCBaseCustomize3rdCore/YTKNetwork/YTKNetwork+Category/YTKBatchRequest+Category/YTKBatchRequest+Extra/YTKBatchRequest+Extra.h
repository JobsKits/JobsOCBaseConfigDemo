//
//  YTKBatchRequest+Extra.h
//  FM
//
//  Created by Admin on 29/10/2024.
//

#import "JobsBlock.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface YTKBatchRequest (Extra)

+(JobsReturnBatchRequestByArrBlock _Nonnull)initByRequestArray;

@end

NS_ASSUME_NONNULL_END
