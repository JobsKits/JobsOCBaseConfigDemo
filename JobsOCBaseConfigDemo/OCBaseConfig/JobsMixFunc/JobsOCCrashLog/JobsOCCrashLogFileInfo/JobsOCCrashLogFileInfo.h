//
//  JobsOCCrashLogFileInfo.h
//  JobsOCTools
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <stdint.h>
#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCrashLogFileInfo : NSObject

Prop_copy(readonly)NSString *path;
Prop_assign(readonly)BOOL exists;
Prop_assign(readonly)int64_t sizeBytes;
Prop_strong(readonly,nullable)NSDate *modificationDate;

-(instancetype)initWithPath:(NSString *)path
                     exists:(BOOL)exists
                  sizeBytes:(int64_t)sizeBytes
           modificationDate:(NSDate *_Nullable)modificationDate NS_DESIGNATED_INITIALIZER;

-(instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
