//
//  NSObject+SysInfo.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+SysInfo.h"

#import "NSObject+Extra.h"

@implementation NSObject (SysInfo)
/// 应用程序的发布版本号
+(NSString *_Nullable)version{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsVersion)))(self, @selector(jobsVersion));
    return action ? action() : nil;
}

+(JobsRetStrByVoidBlock _Nonnull)jobsVersion{
    return ^NSString *_Nullable{
        return [self.jobsMainBundle().infoDictionary objectForKey:应用程序的发布版本号];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)version{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.jobsVersion();
    };
}
/// 应用程序编译构建的版本号
+(JobsRetStrByVoidBlock _Nonnull)build{
    return ^NSString *_Nullable{
        return [self.jobsMainBundle().infoDictionary objectForKey:APP编译构建的版本号];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)build{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.build();
    };
}
/// 应用程序的名字
+(JobsRetStrByVoidBlock _Nonnull)appName{
    return ^NSString *_Nullable{
        return [self.jobsMainBundle() objectForInfoDictionaryKey:APP的名字];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)appName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.appName();
    };
}
/// 返回当前本地化环境（即当前设备的区域设置）中所使用的语言代码
+(JobsRetStrByVoidBlock _Nonnull)appCurrentLanguageCode{
    return ^NSString *_Nullable{
        return NSObject.jobsCurrentLocale().languageCode;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)appCurrentLanguageCode{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.appCurrentLanguageCode();
    };
}
/// 通常返回用户偏好的语言，可能包括用户自定义的语言排序
+(JobsRetStrByVoidBlock _Nonnull)userPreferredLanguages{
    return ^NSString *_Nullable{
        return NSLocale.preferredLanguages.firstObject;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)userPreferredLanguages{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.userPreferredLanguages();
    };
}
/// 设备名称
+(JobsRetStrByVoidBlock _Nonnull)currentDeviceName{
    return ^NSString *_Nullable{
        return self.jobsCurrentDevice().name;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)currentDeviceName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.currentDeviceName();
    };
}
/// 设备类型
+(JobsRetStrByVoidBlock _Nonnull)currentDeviceType{
    return ^NSString *_Nullable{
        return self.jobsCurrentDevice().model;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)currentDeviceType{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.currentDeviceType();
    };
}
/// 本地化模式
+(JobsRetStrByVoidBlock _Nonnull)currentDeviceLocalizedModel{
    return ^NSString *_Nullable{
        return self.jobsCurrentDevice().localizedModel;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)currentDeviceLocalizedModel{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.currentDeviceLocalizedModel();
    };
}
/// 系统名字
+(JobsRetStrByVoidBlock _Nonnull)systemName{
    return ^NSString *_Nullable{
        return self.jobsCurrentDevice().systemName;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)systemName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.systemName();
    };
}
/// 系统版本
+(JobsRetStrByVoidBlock _Nonnull)systemVersion{
    return ^NSString *_Nullable{
        return self.jobsCurrentDevice().systemVersion;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)systemVersion{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSObject.systemVersion();
    };
}
/// 设备朝向
+(JobsRetUIDeviceOrientationByVoidBlock _Nonnull)orientation{
    return ^UIDeviceOrientation{
        return self.jobsCurrentDevice().orientation;
    };
}

-(JobsRetUIDeviceOrientationByVoidBlock _Nonnull)orientation{
    @jobs_weakify(self)
    return ^UIDeviceOrientation{
        @jobs_strongify(self)
        if (!self) return (UIDeviceOrientation){0};
        return NSObject.orientation();
    };
}
/// 是否是iPhone
+(JobsRetBOOLByVoidBlock _Nonnull)iPhone{
    return ^BOOL{
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)iPhone{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return NSObject.iPhone();
    };
}
/// 是否是iPod
+(JobsRetBOOLByVoidBlock _Nonnull)iPod{
    return ^BOOL{
        return [self.jobsCurrentDevice().model rangeOfString:@"iPod"].length;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)iPod{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return NSObject.iPod();
    };
}
/// 是否是iPad
+(JobsRetBOOLByVoidBlock _Nonnull)iPad{
    return ^BOOL{
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)iPad{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return NSObject.iPad();
    };
}
/// 是否是 Retain 屏幕：通过判断屏幕的像素密度来确认
+(JobsRetBOOLByVoidBlock _Nonnull)isRetain{
    return ^BOOL{
        return UIScreen.mainScreen.scale >= 2.0; /// YES：设备具有 Retina 屏幕（或者更高分辨率的屏幕）
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)isRetain{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return NSObject.isRetain();
    };
}

@end
