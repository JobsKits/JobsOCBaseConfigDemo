//
//  NSObject+RAC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+RAC.h"

@implementation NSObject (RAC)
#pragma mark —— @property(nonatomic,strong,nonnull)RACSubject *racSubject;
JobsKey(_racSubject)
@dynamic racSubject;
-(RACSubject *)racSubject{
    RACSubject *RacSubject = Jobs_getAssociatedObject(_racSubject);
    if(!RacSubject){
        RacSubject = RACSubject.subject;
        Jobs_setAssociatedRETAIN_NONATOMIC(_racSubject, RacSubject);
    }return RacSubject;
}

-(void)setRacSubject:(RACSubject *)racSubject{
    Jobs_setAssociatedRETAIN_NONATOMIC(_racSubject, racSubject)
}

@end
