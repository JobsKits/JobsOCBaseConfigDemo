//
//  TABWeakDelegateManager.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 非线程安全
@interface TABWeakDelegateManager : NSObject

- (void)addDelegate:(id)delegate;
- (void)removeDelegate:(id)delegate;
- (void)removeAllDelegates;

- (void)enumerateDelegatesUsingBlock:(void (^)(id delegate))block;
- (NSArray *)getDelegates;

@property (readonly) NSUInteger count;

@end

NS_ASSUME_NONNULL_END
