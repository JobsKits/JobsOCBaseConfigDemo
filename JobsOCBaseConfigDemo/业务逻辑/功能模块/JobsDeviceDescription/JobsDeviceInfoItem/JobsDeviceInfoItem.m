//
//  JobsDeviceInfoItem.m
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsDeviceInfoItem.h"

@implementation JobsDeviceInfoItem

+(instancetype)itemWithTitle:(NSString *)title
                       value:(NSString *)value
                  restricted:(BOOL)restricted {
    JobsDeviceInfoItem *item = self.new;
    item->_title = title.copy;
    item->_value = value.copy;
    item->_restricted = restricted;
    return item;
}

@end
