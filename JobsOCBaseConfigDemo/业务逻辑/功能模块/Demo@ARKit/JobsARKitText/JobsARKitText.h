//
//  JobsARKitText.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsARKitText : NSObject

+(NSString *)text:(NSString *)key language:(NSString *)language;
+(NSArray<NSString *> *)languageCodes;
+(NSArray<NSString *> *)languageNames;

@end

NS_ASSUME_NONNULL_END
