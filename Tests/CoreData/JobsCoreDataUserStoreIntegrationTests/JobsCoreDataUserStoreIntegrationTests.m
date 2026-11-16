//
//  JobsCoreDataUserStoreIntegrationTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../../../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/JobsCoreDataUserStore/JobsCoreDataUserStore.h"

// 真实存储集成测试：将本文件与生产 Store 共编译，传入 momc 生成的 .momd 路径；仅操作随机临时 SQLite，不代替 App UI。
static NSUInteger JobsCoreDataAssertionCount;

static void JobsExpect(BOOL condition, NSString *message) {
    if (!condition) {
        NSLog(@"FAILED: %@", message);
        exit(1);
    }
    JobsCoreDataAssertionCount += 1;
}

static NSPersistentContainer *JobsTestContainer(NSURL *modelURL, NSURL *storeURL, BOOL readOnly) {
    NSManagedObjectModel *model = [NSManagedObjectModel.alloc initWithContentsOfURL:modelURL];
    JobsExpect(model != nil, @"compiled model loads");
    NSPersistentContainer *container = [NSPersistentContainer.alloc initWithName:@"JobsOCBaseConfigDemo" managedObjectModel:model];
    NSPersistentStoreDescription *description = [NSPersistentStoreDescription persistentStoreDescriptionWithURL:storeURL];
    description.shouldAddStoreAsynchronously = NO;
    description.readOnly = readOnly;
    container.persistentStoreDescriptions = @[description];
    __block NSError *failure;
    [container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        failure = error;
    }];
    JobsExpect(!failure && container.persistentStoreCoordinator.persistentStores.count == 1, @"real SQLite opens");
    return container;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        if (argc != 2) {
            fprintf(stderr, "usage: JobsCoreDataUserStoreIntegrationTests <compiled-model.momd>\n");
            return 2;
        }
        NSURL *modelURL = [NSURL fileURLWithPath:[NSString stringWithUTF8String:argv[1]]];
        NSURL *directory = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString] isDirectory:YES];
        NSError *error;
        JobsExpect([NSFileManager.defaultManager createDirectoryAtURL:directory withIntermediateDirectories:YES attributes:nil error:&error], @"isolated directory creates");
        NSURL *storeURL = [directory URLByAppendingPathComponent:@"Users.sqlite"];
        NSPersistentContainer *first = JobsTestContainer(modelURL, storeURL, NO);
        NSManagedObjectContext *context = first.viewContext;
        JobsExpect([JobsCoreDataUserStore fetchUsersInContext:context error:&error].count == 0 && !error, @"default empty");
        JobsExpect([JobsCoreDataUserStore insertName:@"  Alice  " age:25 context:context error:&error] && !error, @"insert and trim");
        JobsExpect([JobsCoreDataUserStore insertName:@"Bob" age:30 context:context error:&error], @"second insert");
        NSArray *users = [JobsCoreDataUserStore fetchUsersInContext:context error:&error];
        JobsExpect(users.count == 2 && [[users.firstObject valueForKey:@"name"] isEqual:@"Alice"], @"fetch sorted trimmed records");
        JobsExpect(![JobsCoreDataUserStore insertName:@"  \n " age:2 context:context error:&error] && error, @"empty name rejected");
        JobsExpect(![JobsCoreDataUserStore insertName:@"Invalid" age:151 context:context error:&error] && error, @"invalid age rejected");
        JobsExpect([JobsCoreDataUserStore fetchUsersInContext:context error:&error].count == 2 && !context.hasChanges, @"invalid input never dirties context");
        JobsExpect([JobsCoreDataUserStore updateUser:users.firstObject name:@"Alice Smith" age:26 context:context error:&error], @"update saves both fields");
        JobsExpect(!context.hasChanges && [NSFileManager.defaultManager fileExistsAtPath:storeURL.path], @"immediate physical SQLite save");
        NSPersistentContainer *second = JobsTestContainer(modelURL, storeURL, NO);
        NSArray *restored = [JobsCoreDataUserStore fetchUsersInContext:second.viewContext error:&error];
        JobsExpect(restored.count == 2 && [[restored.firstObject valueForKey:@"name"] isEqual:@"Alice Smith"] && [[restored.firstObject valueForKey:@"age"] integerValue] == 26, @"independent container restores updated fields");
        JobsExpect(![JobsCoreDataUserStore updateUser:users.firstObject name:@"Wrong" age:1 context:second.viewContext error:&error] && error, @"foreign-context object rejected");
        NSPersistentContainer *readOnly = JobsTestContainer(modelURL, storeURL, YES);
        JobsExpect(![JobsCoreDataUserStore insertName:@"MustRollback" age:20 context:readOnly.viewContext error:&error] && error, @"read-only store save fails safely");
        JobsExpect(!readOnly.viewContext.hasChanges && [JobsCoreDataUserStore fetchUsersInContext:readOnly.viewContext error:&error].count == 2, @"failed save rolled back without record leak");
        JobsExpect([JobsCoreDataUserStore deleteUser:users.lastObject context:context error:&error], @"delete one saves");
        JobsExpect([JobsCoreDataUserStore fetchUsersInContext:context error:&error].count == 1, @"single delete count");
        JobsExpect([JobsCoreDataUserStore deleteAllInContext:context error:&error], @"clear all saves");
        NSPersistentContainer *third = JobsTestContainer(modelURL, storeURL, NO);
        JobsExpect([JobsCoreDataUserStore fetchUsersInContext:third.viewContext error:&error].count == 0, @"clear survives independent reopen");
        NSManagedObjectContext *unprepared = [NSManagedObjectContext.alloc initWithConcurrencyType:NSMainQueueConcurrencyType];
        JobsExpect([JobsCoreDataUserStore fetchUsersInContext:unprepared error:&error] == nil && error, @"unprepared context fails without exception");
        NSLog(@"JobsCoreDataUserStore: %lu assertions passed (real SQLite, independent containers, save rollback)", (unsigned long)JobsCoreDataAssertionCount);
        // Core Data 容器随测试进程释放；临时文件保留在随机系统目录供失败排查，不触及用户目录。
        return 0;
    }
}
