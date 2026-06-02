//
//  NSArray+TABAnimated.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (TABAnimated)

- (NSArray *)tab_map:(id (^)(id))block;

@end

NS_ASSUME_NONNULL_END
