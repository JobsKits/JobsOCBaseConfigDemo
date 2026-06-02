//
//  FSCalendarDelegationFactory.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_CORE_FSCALENDARDELEGATIONFACTORY_FSCALENDARDELEGATIONFACTORY_H
#define JOBS_FSCALENDAR_CORE_FSCALENDARDELEGATIONFACTORY_FSCALENDARDELEGATIONFACTORY_H

#pragma once

#import <Foundation/Foundation.h>
#import <FSCalendar/FSCalendarDelegationProxy.h>

@interface FSCalendarDelegationFactory : NSObject

+ (FSCalendarDelegationProxy *)dataSourceProxy;
+ (FSCalendarDelegationProxy *)delegateProxy;

@end

#endif /* JOBS_FSCALENDAR_CORE_FSCALENDARDELEGATIONFACTORY_FSCALENDARDELEGATIONFACTORY_H */
