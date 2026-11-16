//
//  JobsOCCrashLogFileInfo.m
//  JobsOCTools
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsOCCrashLogFileInfo.h"

@implementation JobsOCCrashLogFileInfo

-(instancetype)initWithPath:(NSString *)path
                     exists:(BOOL)exists
                  sizeBytes:(int64_t)sizeBytes
           modificationDate:(NSDate *_Nullable)modificationDate{
    if (self = [super init]) {
        _path = path.copy;
        _exists = exists;
        _sizeBytes = sizeBytes;
        _modificationDate = modificationDate;
    };return self;
}

@end
