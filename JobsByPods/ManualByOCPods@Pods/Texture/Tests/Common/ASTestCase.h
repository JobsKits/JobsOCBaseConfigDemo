//
//  ASTestCase.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <XCTest/XCTest.h>

// Not strictly necessary, but convenient
#import <OCMock/OCMock.h>

#import <AsyncDisplayKit/AsyncDisplayKit.h>

#import "OCMockObject+ASAdditions.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASTestCase : XCTestCase

@property (class, nonatomic, nullable, readonly) ASTestCase *currentTestCase;

@end

NS_ASSUME_NONNULL_END
