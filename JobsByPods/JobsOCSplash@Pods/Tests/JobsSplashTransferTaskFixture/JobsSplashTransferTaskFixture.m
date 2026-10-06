//
//  JobsSplashTransferTaskFixture.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsSplashTransferTaskFixture.h"

@implementation JobsSplashTransferTaskFixture

-(void)cancel{
    self.cancellationCount += 1;
}

@end
