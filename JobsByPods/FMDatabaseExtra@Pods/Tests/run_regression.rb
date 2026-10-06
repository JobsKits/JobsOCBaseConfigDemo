# frozen_string_literal: true
# 从当前生产实现抽取事务方法，链接工程实际 FMDB 和 SQLite；不安装依赖或修改工程。
require 'tmpdir'
require 'fileutils'
require 'open3'

pod_root = File.expand_path('..', __dir__)
project_root = File.expand_path('../..', pod_root)
source = File.read(File.join(pod_root, 'Core/FMDatabase+Manager/FMDatabase+Manager.m'))
def method_source(source, signature)
  start = source.index(signature) or abort "Missing production method: #{signature}"
  opening = source.index('{', start)
  depth = 1
  cursor = opening + 1
  while depth.positive?
    depth += 1 if source[cursor] == '{'
    depth -= 1 if source[cursor] == '}'
    cursor += 1
    abort 'Unbalanced method' if cursor >= source.length
  end
  source[start...cursor]
end
methods = ['-(BOOL)handleExecuteUpdate:', '-(BOOL)jobsPerformTransaction:', '-(void)handleMultiThreadedProtectionDB:'].map { |signature| method_source(source, signature) }.join("\n\n")
fmdb = File.join(project_root, 'Pods/FMDB/src/fmdb')
abort "Install existing FMDB dependency before running: #{fmdb}" unless File.file?(File.join(fmdb, 'FMDatabase.m'))
Dir.mktmpdir('jobs-fmdb-regression-') do |directory|
  input = File.join(directory, 'regression.m')
  File.write(input, <<~OC)
    #import <Foundation/Foundation.h>
    #import <objc/runtime.h>
    #import "FMDatabase.h"
    #import "FMDatabaseQueue.h"
    typedef BOOL (^JobsRetBOOLByIDBlock)(id);
    typedef void (^jobsByIDBlock)(id);
    static char JobsFMTransactionErrorKey;
    @interface FMDatabase (JobsRegression)
    -(BOOL)jobsPerformTransaction:(JobsRetBOOLByIDBlock)body error:(NSError **)error;
    -(BOOL)handleExecuteUpdate:(NSString *)sql withArgumentsInArray:(NSArray *)arguments;
    -(void)handleMultiThreadedProtectionDB:(NSString *)path doWith:(jobsByIDBlock)body;
    @end
    @implementation FMDatabase (JobsRegression)
    #{methods}
    @end
    static void check(BOOL condition, NSString *message) {
        if (!condition) { fprintf(stderr, "%s\\n", message.UTF8String); exit(1); }
    }
    static int count(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT COUNT(*) FROM sample"];
        check([result next], @"row query failed");
        int value = [result intForColumnIndex:0];
        [result close];
        return value;
    }
    int main(void) {
        @autoreleasepool {
            FMDatabase *db = [FMDatabase databaseWithPath:@":memory:"];
            check([db open], @"open failed");
            check([db executeUpdate:@"CREATE TABLE sample(id INTEGER PRIMARY KEY)"], @"schema failed");
            NSError *error = nil;
            check([db jobsPerformTransaction:^BOOL(id database) {
                return [database handleExecuteUpdate:@"INSERT INTO sample VALUES(1)" withArgumentsInArray:nil];
            } error:&error], @"successful transaction failed");
            check(!error && db.isOpen && count(db) == 1, @"commit/connection ownership failed");
            check(![db jobsPerformTransaction:^BOOL(id database) {
                [database handleExecuteUpdate:@"INSERT INTO sample VALUES(2)" withArgumentsInArray:nil];
                [database handleExecuteUpdate:@"INSERT INTO missing VALUES(3)" withArgumentsInArray:nil];
                [database handleExecuteUpdate:@"INSERT INTO sample VALUES(4)" withArgumentsInArray:nil];
                return YES;
            } error:&error], @"intermediate SQL failure was committed");
            check(error && count(db) == 1 && !db.isInTransaction, @"failed SQL left partial data");
            check(![db jobsPerformTransaction:^BOOL(id database) {
                [database handleExecuteUpdate:@"INSERT INTO sample VALUES(5)" withArgumentsInArray:nil];
                @throw [NSException exceptionWithName:@"fixture" reason:@"expected" userInfo:nil];
            } error:&error], @"exception was swallowed as success");
            check(error && count(db) == 1 && db.isOpen, @"exception rollback failed");
            check(![db jobsPerformTransaction:^BOOL(id database) { return NO; } error:&error] && error, @"false body contract failed");
            check([db beginTransaction], @"outer begin failed");
            check(![db jobsPerformTransaction:^BOOL(id database) { return YES; } error:&error], @"nested transaction accepted");
            check(db.isInTransaction, @"nested rejection ended caller transaction");
            [db rollback];
            [db close];
            NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSUUID.UUID.UUIDString stringByAppendingString:@".sqlite"]];
            FMDatabase *closed = [FMDatabase databaseWithPath:path];
            check([closed jobsPerformTransaction:^BOOL(id database) {
                return [database handleExecuteUpdate:@"CREATE TABLE sample(id INTEGER PRIMARY KEY)" withArgumentsInArray:nil];
            } error:&error] && !closed.isOpen, @"owned connection not closed");
            dispatch_apply(30, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
                [closed handleMultiThreadedProtectionDB:path doWith:^(id database) {
                    check([database executeUpdate:@"INSERT INTO sample VALUES(?)", @(index)], @"shared path write failed");
                }];
            });
            [closed open];
            check(count(closed) == 30, @"concurrent path writes lost");
            [closed close];
            [NSFileManager.defaultManager removeItemAtPath:path error:nil];
            puts("PASS: FMDB commit, SQL/exception rollback, nested rejection, connection ownership, 30 shared-path writers");
        }
        return 0;
    }
  OC
  command = ['clang', '-fobjc-arc', '-fblocks', '-Wno-deprecated-declarations', '-I', fmdb,
             '-framework', 'Foundation', '-lsqlite3', input,
             *%w[FMDatabase.m FMDatabaseQueue.m FMResultSet.m].map { |name| File.join(fmdb, name) },
             '-o', File.join(directory, 'regression')]
  output, status = Open3.capture2e(*command)
  abort output unless status.success?
  output, status = Open3.capture2e(File.join(directory, 'regression'))
  puts output
  abort 'Regression failed' unless status.success?
end
