//
//  FSCalendarDelegationProxy.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_CORE_FSCALENDARDELEGATIONPROXY_FSCALENDARDELEGATIONPROXY_H
#define JOBS_FSCALENDAR_CORE_FSCALENDARDELEGATIONPROXY_FSCALENDARDELEGATIONPROXY_H

#pragma once

#import <Foundation/Foundation.h>
#import <FSCalendar/FSCalendar.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSCalendarDelegationProxy : NSProxy

@property (weak  , nonatomic) id delegation;
@property (strong, nonatomic) Protocol *protocol;
@property (strong, nonatomic) NSDictionary<NSString *,NSString *> *deprecations;

- (instancetype)init;
- (SEL)deprecatedSelectorOfSelector:(SEL)selector;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_FSCALENDAR_CORE_FSCALENDARDELEGATIONPROXY_FSCALENDARDELEGATIONPROXY_H */
