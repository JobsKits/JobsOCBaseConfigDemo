//
//  NSObject+Path.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Path.h"

@implementation NSObject (Path)
/// 获取bundle路径
-(NSString *)bundlePath{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsBundlePath)))(self, @selector(jobsBundlePath)))();
}
/// 获取bundle路径的 Block 门面
-(JobsRetStrByVoidBlock _Nonnull)jobsBundlePath{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSBundle.mainBundle.bundlePath;
    };
}
/// 获取沙盒的主目录路径：
-(JobsRetStrByVoidBlock _Nonnull)homeDir{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSHomeDirectory();
    };
}
/// Documents目录（这个目录通常用于存储应用程序中的用户数据或需要持久保存的数据。用户可以通过 iTunes 文件共享或 iCloud 访问该目录中的内容）下，用户主目录下，返回完整路径
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)documentsPaths{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                   NSUserDomainMask,
                                                   YES);
    };
}
/// Library目录（这个目录是每个 iOS 或 macOS 应用程序特有的目录，通常存储应用程序的支持文件、配置文件以及不能直接由用户访问的文件）下，用户主目录下，返回完整路径
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)libraryPaths{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                   NSUserDomainMask,
                                                   YES);
    };
}
/// 缓存目录下，用户主目录下，返回完整路径
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)cachesPaths{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                   NSUserDomainMask,
                                                   YES);
    };
}
/// 获取真机沙盒中Documents的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)documentsDir{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.documentsPaths().firstObject;
    };
}
/// 获取沙盒中Library的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)libraryDir{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.libraryPaths().lastObject;
    };
}
/// 获取沙盒中NSUserDefaults的保存位置
-(JobsRetStrByVoidBlock _Nonnull)userDefaultsDir{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.libraryPaths().firstObject;
    };
}
/// 获取沙盒中Library/Caches的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)cachesDir{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.cachesPaths().firstObject;
    };
}
/// 获取沙盒中Libarary/Preferences的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)preferencesDir{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.libraryDir().addPathComponent(@"Preferences");
    };
}
/// 获取沙盒中tmp的目录路径：供系统使用，程序员不要使用，因为随时会被销毁
-(JobsRetStrByVoidBlock _Nonnull)tmpDir{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSTemporaryDirectory();
    };
}

@end
