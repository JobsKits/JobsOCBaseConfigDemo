//
//  NSString+Path.m
//  GKCustomNavigationBarExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Path.h"

@implementation NSString (Path)
#pragma mark —— iOS 获取文件的 文件名 和 后缀
/// 从路径中获得完整的文件名 （带后缀）
-(NSString *)getFullFileNameByFilePath{
    return self.lastPathComponent;
}
/// 从路径中获得完整的文件名 （不带后缀）
-(NSString *)getOnlyFileNameByFilePath{
    return self.getFullFileNameByFilePath.stringByDeletingPathExtension;
}
/// 从路径中获得文件完整的后缀名 （不带'.'）
+(JobsRetStrByStrBlock _Nonnull)getSuffixFileName{
    return ^__kindof NSString *_Nullable(NSString *_Nullable data){
        return data.getFullFileNameByFilePath.pathExtension;
    };
}
#pragma mark —— 目录获取
-(NSString *)pathForResourceWithFullName{
    // 拆分文件名和扩展名
    NSString *name = self.stringByDeletingPathExtension;
    NSString *extension = self.pathExtension;
    // 使用 NSBundle 获取文件路径
    return [NSBundle.mainBundle pathForResource:name ofType:extension];
}

-(NSString *)pathForResourceWithName{
    // 拆分文件名和扩展名
    NSString *name = self.stringByDeletingPathExtension;
//    NSString *extension = self.pathExtension;
    // 使用 NSBundle 获取文件路径
    return [NSBundle.mainBundle pathForResource:name ofType:nil];
}
/// OC字符串路径拼接
-(JobsRetStrByStrBlock _Nonnull)addPathComponent{
    @jobs_weakify(self)
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        @jobs_strongify(self)
        if(!str) str = @"";
        // 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([self stringByAppendingPathComponent:str]); // 自动处理（加上"/"）
    };
}

@end
