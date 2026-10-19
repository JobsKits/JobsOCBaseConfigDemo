//
//  JobsMicroSandboxStore.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroSandboxStore.h"

@implementation JobsMicroSandboxStore {
    NSURL *_baseDirectory;
}

-(instancetype)init{
    NSURL *support = [NSFileManager.defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask].firstObject;
    return [self initWithBaseDirectory:support];
}

-(instancetype)initWithBaseDirectory:(NSURL *)baseDirectory{
    self = [super init];
    if (self) {
        _baseDirectory = baseDirectory.URLByResolvingSymlinksInPath;
    }
    return self;
}


-(NSURL *)URLForApplication:(NSString *)appID fileName:(NSString *)fileName error:(NSError **)error{
    NSCharacterSet *allowed = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"];
    BOOL validID = appID.length > 0 && appID.length <= 64 && [appID rangeOfCharacterFromSet:allowed.invertedSet].location == NSNotFound;
    // 最小权限：仅允许单个文件名。拒绝绝对路径、目录穿越和已有符号链接。
    BOOL validName = fileName.length > 0 && [fileName rangeOfString:@"\\A[A-Za-z0-9_-]{1,60}\\.[A-Za-z0-9]{1,8}\\z" options:NSRegularExpressionSearch].location != NSNotFound;
    if (!validID || !validName) {
        if (error) {
            *error = [NSError errorWithDomain:@"JobsMicroSandbox" code:1 userInfo:@{NSLocalizedDescriptionKey:@"已阻止越界路径：appID 或文件名不合法"}];
        }
        return nil;
    }
    NSFileManager *manager = NSFileManager.defaultManager;
    if (![manager createDirectoryAtURL:_baseDirectory withIntermediateDirectories:YES attributes:nil error:error]) {
        return nil;
    }
    NSURL *root = _baseDirectory;
    // 先逐层拒绝现存 symlink，再创建下一层；不能把租户根 resolve 后当成新的可信边界。
    for (NSString *component in @[@"JobsMicroLearning", @"Tenants", appID]) {
        root = [root URLByAppendingPathComponent:component isDirectory:YES];
        NSDictionary *attributes = [manager attributesOfItemAtPath:root.path error:nil];
        if (attributes && ![attributes[NSFileType] isEqualToString:NSFileTypeDirectory]) {
            if (error) {
                *error = [NSError errorWithDomain:@"JobsMicroSandbox" code:2 userInfo:@{NSLocalizedDescriptionKey:@"已阻止目录符号链接或非目录节点"}];
            }
            return nil;
        }
        if (!attributes && ![manager createDirectoryAtURL:root withIntermediateDirectories:NO attributes:nil error:error]) {
            return nil;
        }
    }
    NSURL *target = [root URLByAppendingPathComponent:fileName];
    NSDictionary *targetAttributes = [manager attributesOfItemAtPath:target.path error:nil];
    NSString *prefix = [root.path stringByAppendingString:@"/"];
    if ((targetAttributes && ![targetAttributes[NSFileType] isEqualToString:NSFileTypeRegular]) || ![target.URLByResolvingSymlinksInPath.path hasPrefix:prefix]) {
        if (error) {
            *error = [NSError errorWithDomain:@"JobsMicroSandbox" code:2 userInfo:@{NSLocalizedDescriptionKey:@"已阻止文件符号链接逃逸或非普通文件"}];
        }
        return nil;
    }
    return target;
}

-(BOOL)writeText:(NSString *)text application:(NSString *)appID fileName:(NSString *)fileName error:(NSError **)error{
    if ([text lengthOfBytesUsingEncoding:NSUTF8StringEncoding] > 16 * 1024) {
        if (error) {
            *error = [NSError errorWithDomain:@"JobsMicroSandbox" code:3 userInfo:@{NSLocalizedDescriptionKey:@"教学草稿上限为 16 KB"}];
        }
        return NO;
    }
    NSURL *url = [self URLForApplication:appID fileName:fileName error:error];

    return url && [text writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:error];
}

-(NSString *)readTextForApplication:(NSString *)appID fileName:(NSString *)fileName error:(NSError **)error{
    NSURL *url = [self URLForApplication:appID fileName:fileName error:error];
    return url ? [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:error] : nil;
}

@end
