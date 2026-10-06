//
//  JobsAPIRequestConstraintFixture.h
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <JobsAPIs/JobsBaseApi.h>

@interface JobsAPIRequestConstraintFixture : JobsBaseApi
@property(nonatomic, copy) NSString *fixturePath;
@property(nonatomic, assign) BOOL usesRawRequest;
@end
