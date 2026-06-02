//
//  TABAnimatedDocumentMethod.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TABAnimatedDocumentMethod : NSObject

+ (void)writeToFileWithData:(id)data filePath:(NSString *)filePath;

+ (id)getCacheData:(NSString *)filePath targetClass:(Class)targetClass;

+ (NSString *)getPathByFilePacketName:(NSString *)filePacketName;

+ (BOOL)createFile:(NSString *)file isDir:(BOOL)isdir;

+ (BOOL)isExistFile:(NSString *)path isDir:(BOOL)isDir;

+ (BOOL)deleteFile:(NSString *)file;

@end

NS_ASSUME_NONNULL_END
