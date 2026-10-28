//
//  JobsDeviceInfoItem.h
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsDeviceInfoItem : NSObject

@property(nonatomic, copy, readonly) NSString *title;
@property(nonatomic, copy, readonly) NSString *value;
@property(nonatomic, assign, readonly) BOOL restricted;

+(instancetype)itemWithTitle:(NSString *)title
                       value:(NSString *)value
                  restricted:(BOOL)restricted;

@end

NS_ASSUME_NONNULL_END
