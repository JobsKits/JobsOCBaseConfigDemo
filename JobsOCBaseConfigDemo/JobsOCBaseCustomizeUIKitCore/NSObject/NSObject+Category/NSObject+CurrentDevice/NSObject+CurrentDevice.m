//
//  NSObject+CurrentDevice.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+CurrentDevice.h"

#import "NSObject+Extra.h"

@implementation NSObject (CurrentDevice)
/// App发布的版本号
-(JobsRetStrByVoidBlock _Nonnull)appVersion{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"];
    };
}
/// BUILD 版本号
-(JobsRetStrByVoidBlock _Nonnull)appBuildVersion{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"];
    };
}
/// App名字
-(NSString *)appDisplayName{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsAppDisplayName)))(self, @selector(jobsAppDisplayName)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsAppDisplayName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleExecutable"];
    };
}
/// 当前语言
-(JobsRetStrByVoidBlock _Nonnull)localLanguage{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSLocale.preferredLanguages objectAtIndex:0];
    };
}
/// 当前国家
-(JobsRetStrByVoidBlock _Nonnull)localCountry{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSLocale.currentLocale objectForKey:NSLocaleCountryCode];
    };
}
/// 设备名称
-(JobsRetStrByVoidBlock _Nonnull)deviceName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return UIDevice.currentDevice.name;
    };
}
/// 设备类型
-(JobsRetStrByVoidBlock _Nonnull)deviceModel{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return UIDevice.currentDevice.model;
    };
}
/// 本地化模式
-(JobsRetStrByVoidBlock _Nonnull)deviceLocalizedModel{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return UIDevice.currentDevice.localizedModel;
    };
}
/// 系统名字
-(JobsRetStrByVoidBlock _Nonnull)deviceSystemName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return UIDevice.currentDevice.systemName;
    };
}
/// 系统版本
-(JobsRetStrByVoidBlock _Nonnull)deviceSystemVersion{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return UIDevice.currentDevice.systemVersion;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)deviceIdentity{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
    return self.deviceID();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)uuid{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
    return self.UUID();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)idfv{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.IDFV();
    };
}
/// 设备朝向
-(JobsRetUIDeviceOrientationByVoidBlock _Nonnull)deviceOrientation{
    @jobs_weakify(self)
    return ^UIDeviceOrientation{
        @jobs_strongify(self)
        if (!self) return (UIDeviceOrientation){0};
        return UIDevice.currentDevice.orientation;
    };
}
/// 是否是Retina显示屏
-(JobsRetBOOLByVoidBlock _Nonnull)isRetina{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return (UIScreen.mainScreen.scale >= 2.0);// 非Retain屏幕 1.0
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)isPhone{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (JobsAvailableSysVersion(13.0)) {
            return UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone;
        }else{
            SuppressWdeprecatedDeclarationsWarning(return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone));
        }
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)isPad{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (JobsAvailableSysVersion(13.0)) {
            return UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad;
        }else{
            SuppressWdeprecatedDeclarationsWarning(return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad));
        }
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)isPod{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return ([UIDevice.currentDevice.model rangeOfString:@"iPod"].length > 0);
    };
}

@end
