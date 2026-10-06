//
//  JobsSplashTransferTaskFixture.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <Foundation/Foundation.h>

@interface JobsSplashTransferTaskFixture : NSObject

@property(nonatomic, assign)NSUInteger cancellationCount;
-(void)cancel;

@end
