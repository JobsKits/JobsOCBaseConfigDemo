//
//  JobsCoreDataUserStore.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

/// User 模型的实际存储适配层；由宿主注入上下文，便于用独立 SQLite 验证同一份源码。
@interface JobsCoreDataUserStore : NSObject

+(nullable NSArray<NSManagedObject *> *)fetchUsersInContext:(NSManagedObjectContext *)context
                                                   error:(NSError * _Nullable * _Nullable)error;
+(BOOL)insertName:(NSString *)name
             age:(NSInteger)age
         context:(NSManagedObjectContext *)context
           error:(NSError * _Nullable * _Nullable)error;
+(BOOL)updateUser:(NSManagedObject *)user
            name:(NSString *)name
             age:(NSInteger)age
         context:(NSManagedObjectContext *)context
           error:(NSError * _Nullable * _Nullable)error;
+(BOOL)deleteUser:(NSManagedObject *)user
         context:(NSManagedObjectContext *)context
           error:(NSError * _Nullable * _Nullable)error;
+(BOOL)deleteAllInContext:(NSManagedObjectContext *)context
                   error:(NSError * _Nullable * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
