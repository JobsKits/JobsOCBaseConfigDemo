//
//  JobsFMDBMgr.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsFMDBMgr.h"

@interface JobsFMDBMgr ()

Prop_strong()FMDatabaseQueue *databaseQueue;

@end

@implementation JobsFMDBMgr
static JobsFMDBMgr *JobsFMDBMgrInstance;
static dispatch_once_t JobsFMDBMgrOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsFMDBMgr.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&JobsFMDBMgrOnceToken, ^{
            if(!JobsFMDBMgrInstance){
                JobsFMDBMgrInstance = [super allocWithZone:NULL].init;
            }
        });return JobsFMDBMgrInstance;
    };
}
/// 单例的销毁
+(jobsByVoidBlock _Nonnull)destroyInstance {
    return ^{
        JobsFMDBMgrOnceToken = 0;
        JobsFMDBMgrInstance = nil;
    };
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsFMDBMgrOnceToken, ^{
        JobsFMDBMgrInstance = [super allocWithZone:zone];
    });return JobsFMDBMgrInstance;
}
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone {
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *dbPath = docsPath.addPathComponent(@"users.db");
        self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        self.createTable();
    };return self;
}
/// 建表
- (jobsByVoidBlock _Nonnull)createTable {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
            NSString *createTableQuery = @"CREATE TABLE IF NOT EXISTS Users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)";
            BOOL success = [db executeUpdate:createTableQuery];
            if (success) {
                JobsLog(@"Table created successfully.");
            } else {
                JobsLog(@"Failed to create table.");
            }
        }];
    };
}
/// 插入数据
- (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
    [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *insertQuery = @"INSERT INTO Users (name, age) VALUES (?, ?)";
        BOOL success = [db executeUpdate:insertQuery, name, @(age)];
        if (success) {
            JobsLog(@"User inserted successfully.");
        } else {
            JobsLog(@"Failed to insert user.");
        }
    }];
}
/// 查询数据
- (JobsRetArrByVoidBlock _Nonnull)fetchAllUsers {
    @jobs_weakify(self)
    return ^NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray *users = NSMutableArray.array;
        [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
            NSString *selectQuery = @"SELECT * FROM Users";
            FMResultSet *result = [db executeQuery:selectQuery];
            while (result.next) {
                NSDictionary *user = @{
                    @"id": @([result intForColumn:@"id"]),
                    @"name": [result stringForColumn:@"name"],
                    @"age": @([result intForColumn:@"age"])
                };
                [users addObject:user];
            }
        }];return users;
    };
}
/// 更新/改正 数据
- (void)updateUserWithID:(NSInteger)userID
                 newName:(NSString *)newName
                  newAge:(NSInteger)newAge {
    [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *updateQuery = @"UPDATE Users SET name = ?, age = ? WHERE id = ?";
        BOOL success = [db executeUpdate:updateQuery, newName, @(newAge), @(userID)];
        if (success) {
            JobsLog(@"User updated successfully.");
        } else {
            JobsLog(@"Failed to update user.");
        }
    }];
}
/// 删除数据
-(jobsByNSIntegerBlock _Nonnull)deleteUserWithID{
    @jobs_weakify(self)
    return ^(NSInteger userID){
        @jobs_strongify(self)
        if (!self) return;
        [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
            NSString *deleteQuery = @"DELETE FROM Users WHERE id = ?";
            BOOL success = [db executeUpdate:deleteQuery, @(userID)];
            if (success) {
                JobsLog(@"User deleted successfully.");
            } else {
                JobsLog(@"Failed to delete user.");
            }
        }];
    };
}

@end
