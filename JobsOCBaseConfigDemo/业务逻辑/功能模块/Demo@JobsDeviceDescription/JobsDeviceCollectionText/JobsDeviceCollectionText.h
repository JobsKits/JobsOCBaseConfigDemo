//
//  JobsDeviceCollectionText.h
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年11月6日，星期五.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsDeviceCollectionText : NSObject

@property(class, nonatomic, readonly) NSArray<NSString *> *languageCodes;

+(NSString *)text:(NSString *)key
        language:(nullable NSString *)language;

@end

NS_ASSUME_NONNULL_END
