//
//  JobsCoreDataUserStore.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import "JobsCoreDataUserStore.h"

@implementation JobsCoreDataUserStore

+(BOOL)failWithMessage:(NSString *)message
                 error:(NSError **)error{
    if (error) {
        *error = [NSError errorWithDomain:@"JobsCoreDataUserStore"
                                    code:1
                                userInfo:@{NSLocalizedDescriptionKey: message}];
    }
    return NO;
}

+(BOOL)validateContext:(NSManagedObjectContext *)context
                 error:(NSError **)error{
    if (!context.persistentStoreCoordinator.persistentStores.count) {
        return [self failWithMessage:@"数据库尚未就绪。" error:error];
    }
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    if (entity.attributesByName[@"name"].attributeType != NSStringAttributeType ||
        entity.attributesByName[@"age"].attributeType != NSInteger32AttributeType) {
        return [self failWithMessage:@"不能读取数据库模型。" error:error];
    }
    return YES;
}

+(BOOL)validateName:(NSString *)name
               age:(NSInteger)age
             error:(NSError **)error{
    if (![name stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length) {
        return [self failWithMessage:@"姓名不能为空。" error:error];
    }
    if (age < 0 || age > 150) {
        return [self failWithMessage:@"年龄须为 0～150 的整数。" error:error];
    }
    return YES;
}

+(BOOL)saveContext:(NSManagedObjectContext *)context
             error:(NSError **)error{
    if (!context.hasChanges || [context save:error]) {
        return YES;
    }
    [context rollback];
    return NO;
}

+(NSArray<NSManagedObject *> *)fetchUsersInContext:(NSManagedObjectContext *)context
                                            error:(NSError **)error{
    if (!context) {
        [self failWithMessage:@"数据库尚未就绪。" error:error];
        return nil;
    }
    __block NSArray<NSManagedObject *> *users;
    __block NSError *failure;
    [context performBlockAndWait:^{
        if (![self validateContext:context error:&failure]) {
            return;
        }
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],
                                    [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES]];
        users = [context executeFetchRequest:request error:&failure];
    }];
    if (error) {
        *error = failure;
    }
    return users;
}

+(BOOL)insertName:(NSString *)name
             age:(NSInteger)age
         context:(NSManagedObjectContext *)context
           error:(NSError **)error{
    if (!context) {
        return [self failWithMessage:@"数据库尚未就绪。" error:error];
    }
    __block BOOL saved = NO;
    __block NSError *failure;
    [context performBlockAndWait:^{
        if (![self validateContext:context error:&failure] || ![self validateName:name age:age error:&failure]) {
            return;
        }
        NSManagedObject *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [user setValue:[name stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] forKey:@"name"];
        [user setValue:@(age) forKey:@"age"];
        saved = [self saveContext:context error:&failure];
    }];
    if (error) {
        *error = failure;
    }
    return saved;
}

+(BOOL)updateUser:(NSManagedObject *)user
            name:(NSString *)name
             age:(NSInteger)age
         context:(NSManagedObjectContext *)context
           error:(NSError **)error{
    if (!context) {
        return [self failWithMessage:@"数据库尚未就绪。" error:error];
    }
    __block BOOL saved = NO;
    __block NSError *failure;
    [context performBlockAndWait:^{
        if (![self validateContext:context error:&failure] || ![self validateName:name age:age error:&failure]) {
            return;
        }
        if (user.managedObjectContext != context || user.isDeleted) {
            [self failWithMessage:@"数据库操作失败" error:&failure];
            return;
        }
        [user setValue:[name stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] forKey:@"name"];
        [user setValue:@(age) forKey:@"age"];
        saved = [self saveContext:context error:&failure];
    }];
    if (error) {
        *error = failure;
    }
    return saved;
}

+(BOOL)deleteUser:(NSManagedObject *)user
         context:(NSManagedObjectContext *)context
           error:(NSError **)error{
    if (!context) {
        return [self failWithMessage:@"数据库尚未就绪。" error:error];
    }
    __block BOOL saved = NO;
    __block NSError *failure;
    [context performBlockAndWait:^{
        if (![self validateContext:context error:&failure]) {
            return;
        }
        if (user.managedObjectContext != context || user.isDeleted) {
            [self failWithMessage:@"数据库操作失败" error:&failure];
            return;
        }
        [context deleteObject:user];
        saved = [self saveContext:context error:&failure];
    }];
    if (error) {
        *error = failure;
    }
    return saved;
}

+(BOOL)deleteAllInContext:(NSManagedObjectContext *)context
                   error:(NSError **)error{
    if (!context) {
        return [self failWithMessage:@"数据库尚未就绪。" error:error];
    }
    __block BOOL saved = NO;
    __block NSError *failure;
    [context performBlockAndWait:^{
        if (![self validateContext:context error:&failure]) {
            return;
        }
        NSArray *users = [context executeFetchRequest:[NSFetchRequest fetchRequestWithEntityName:@"User"] error:&failure];
        if (!users) {
            return;
        }
        for (NSManagedObject *user in users) {
            [context deleteObject:user];
        }
        saved = [self saveContext:context error:&failure];
    }];
    if (error) {
        *error = failure;
    }
    return saved;
}

@end
