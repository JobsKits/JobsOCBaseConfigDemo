//
//  TABAnimatedCacheModel.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TABAnimatedCacheModel : NSObject <NSSecureCoding>

@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, assign) NSInteger loadCount;

@end

NS_ASSUME_NONNULL_END
