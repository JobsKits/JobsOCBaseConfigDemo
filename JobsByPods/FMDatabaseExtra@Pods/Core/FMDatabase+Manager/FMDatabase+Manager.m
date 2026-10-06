//
//  FMDatabase+Manager.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FMDatabase+Manager.h"

static char JobsFMTransactionErrorKey;

@implementation FMDatabase (Manager)
/// 依据路径创建数据库
-(JobsRetFMDatabaseByNSStringBlock _Nonnull)createDataBaseWithPath{
    @jobs_weakify(self)
    return ^FMDatabase *(NSString *_Nullable dbPath){
        @jobs_strongify(self)
        if (!self) return nil;
        // 数据库访问路径
        if (dbPath.length == 0) {
            NSString *documentsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                         NSUserDomainMask,
                                                                         YES).firstObject;
            dbPath = [documentsDir stringByAppendingPathComponent:@"test.db"];
        }
        NSLog(@"!!!dbPath = %@",dbPath);
        // 创建对应路径下数据库
        return [FMDatabase databaseWithPath:dbPath];
    };
}
/// 实际对数据库有变动的操作
-(BOOL)handleExecuteUpdate:(NSString *)executeUpdate
      withArgumentsInArray:(NSArray *_Nullable)argumentsInArray{
    BOOL openedHere = !self.isOpen;
    if (openedHere && ![self open]) {
        return NO;
    }
    BOOL result = [self executeUpdate:executeUpdate withArgumentsInArray:argumentsInArray];
    if (!result && self.isInTransaction) {
        objc_setAssociatedObject(self, &JobsFMTransactionErrorKey, self.lastError, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    if (openedHere) {
        [self close];
    }
    return result;
}

-(BOOL)jobsPerformTransaction:(JobsRetBOOLByIDBlock)transaction
                       error:(NSError *__autoreleasing *)error{
    if (error) {
        *error = nil;
    }
    @synchronized (self) {
        if (!transaction || self.isInTransaction) {
            if (error) {
                *error = [NSError errorWithDomain:@"JobsFMDatabaseError" code:1
                                        userInfo:@{NSLocalizedDescriptionKey: @"事务体不能为空，且不支持嵌套事务"}];
            }
            return NO;
        }
        BOOL openedHere = !self.isOpen;
        if ((openedHere && ![self open]) || ![self beginTransaction]) {
            if (error) {
                *error = self.lastError;
            }
            if (openedHere) {
                [self close];
            }
            return NO;
        }
        objc_setAssociatedObject(self, &JobsFMTransactionErrorKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        BOOL committed = NO;
        NSError *failure = nil;
        @try {
            BOOL succeeded = transaction(self);
            failure = objc_getAssociatedObject(self, &JobsFMTransactionErrorKey);
            if (!failure && [self hadError]) {
                failure = self.lastError;
            }
            if (succeeded && !failure) {
                committed = [self commit];
                if (!committed) {
                    failure = self.lastError;
                }
            } else if (!failure) {
                failure = [NSError errorWithDomain:@"JobsFMDatabaseError" code:2
                                          userInfo:@{NSLocalizedDescriptionKey: @"事务体返回失败"}];
            }
        } @catch (NSException *exception) {
            failure = [NSError errorWithDomain:@"JobsFMDatabaseError" code:3
                                      userInfo:@{NSLocalizedDescriptionKey: exception.reason ?: @"事务异常"}];
        } @finally {
            if (!committed && self.isInTransaction) {
                if (![self rollback] && !failure) {
                    failure = self.lastError;
                }
            }
            objc_setAssociatedObject(self, &JobsFMTransactionErrorKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            if (openedHere) {
                [self close];
            }
        }
        if (error) {
            *error = failure;
        }
        return committed;
    }
}
#pragma mark —— 增删改查中 除了查询（executeQuery），其余操作都用（executeUpdate）
-(JobsRetBOOLByVoidBlock _Nonnull)handleInsert{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [self handleExecuteUpdate:@"insert into 't_student'(ID,name,phone,score) values(?,?,?,?)"
                    withArgumentsInArray:@[@113,@"x3",@"13",@53]];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)handleDelete{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [self handleExecuteUpdate:@"delete from 't_student' where ID = ?"
                    withArgumentsInArray:@[@113]];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)handleUpdate{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [self handleExecuteUpdate:@"update 't_student' set ID = ? where name = ?"
                    withArgumentsInArray:@[@113,@"x3"]];
    };
}

-(JobsRetFMResultSetByVoidBlock _Nonnull)handleQuery{
    @jobs_weakify(self)
    return ^FMResultSet *{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self executeQuery:@"select * from 't_student' where ID = ?"
             withArgumentsInArray:@[@113]];
    };
}
/// 开启事务，返回是否事务回滚
/// @param targetObj 指定的某类实例上开启事务
/// @param methodName 开启的事务提取出来封装成一个不带参方法
-(BOOL)handleTargetObj:(nonnull NSObject *)targetObj
           transaction:(nullable NSString *)methodName{
    SEL selector = NSSelectorFromString(methodName ?: @"");
    NSMethodSignature *signature = [targetObj methodSignatureForSelector:selector];
    if (!signature || signature.numberOfArguments != 2) {
        return YES;
    }
    return ![self jobsPerformTransaction:^BOOL(id database) {
        [NSObject targetObj:targetObj callingMethodWithName:methodName];
        return ![(FMDatabase *)database hadError];
    } error:nil];
}
/// 多线程保护使用FMDB数据库
/// @param dbPath 依据路径索引到数据库文件
/// @param doWithBlock 具体做的事情
-(void)handleMultiThreadedProtectionDB:(NSString *_Nullable)dbPath
                                doWith:(jobsByIDBlock)doWithBlock{
    if (!doWithBlock) {
        return;
    }
    NSString *path = dbPath.length ? dbPath.stringByStandardizingPath.stringByResolvingSymlinksInPath :
        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
         stringByAppendingPathComponent:@"test.db"];
    static NSMutableDictionary<NSString *, NSMutableDictionary *> *queues;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queues = [NSMutableDictionary dictionary];
    });
    FMDatabaseQueue *queue;
    NSMutableDictionary *entry;
    @synchronized (queues) {
        entry = queues[path];
        if (!entry) {
            queue = [FMDatabaseQueue databaseQueueWithPath:path];
            if (queue) {
                entry = [@{@"queue":queue, @"leases":@0} mutableCopy];
                queues[path] = entry;
            }
        }
        queue = entry[@"queue"];
        entry[@"leases"] = @([entry[@"leases"] unsignedIntegerValue] + 1);
    }
    if (!queue) {
        return;
    }
    @try {
        [queue inDatabase:^(FMDatabase *db) {
            doWithBlock(db);
        }];
    } @finally {
        @synchronized (queues) {
            NSUInteger remaining = [entry[@"leases"] unsignedIntegerValue] - 1;
            entry[@"leases"] = @(remaining);
            if (!remaining && queues[path] == entry) {
                [queues removeObjectForKey:path];
            }
        }
    }
}

@end
