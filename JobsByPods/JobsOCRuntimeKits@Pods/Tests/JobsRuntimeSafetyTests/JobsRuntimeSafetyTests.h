//
//  JobsRuntimeSafetyTests.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSRUNTIMESAFETYTESTS_H
#define JOBS_TEST_JOBSRUNTIMESAFETYTESTS_H

#import <XCTest/XCTest.h>
#import <JobsOCRuntimeKits/NSObject+DynamicInvoke.h>
#import <JobsOCRuntimeKits/JobsWeakAssociation.h>

@interface JobsRuntimeSafetyTests : XCTestCase 

@property(nonatomic,assign)NSUInteger fixtureCount;

@end

#endif /* JOBS_TEST_JOBSRUNTIMESAFETYTESTS_H */
