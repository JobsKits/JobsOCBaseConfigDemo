//
//  FSCalendarDelegationFactory.m
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FSCalendarDelegationFactory.h"

@implementation FSCalendarDelegationFactory

+ (FSCalendarDelegationProxy *)dataSourceProxy
{
    FSCalendarDelegationProxy *delegation = [[FSCalendarDelegationProxy alloc] init];
    delegation.protocol = @protocol(FSCalendarDataSource);
    return delegation;
}

+ (FSCalendarDelegationProxy *)delegateProxy
{
    FSCalendarDelegationProxy *delegation = [[FSCalendarDelegationProxy alloc] init];
    delegation.protocol = @protocol(FSCalendarDelegateAppearance);
    return delegation;
}

@end

#undef FSCalendarSelectorEntry

