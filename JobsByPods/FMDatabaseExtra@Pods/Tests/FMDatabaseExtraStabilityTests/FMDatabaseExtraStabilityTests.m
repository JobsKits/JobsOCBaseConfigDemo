//
//  FMDatabaseExtraStabilityTests.m
//  FMDatabaseExtra
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "FMDatabaseExtraStabilityTests.h"

@implementation FMDatabaseExtraStabilityTests

-(void)testFailedSQLAndExceptionRollbackWithoutClosingCallerConnection{
    FMDatabase *db = [FMDatabase databaseWithPath:@":memory:"];
    XCTAssertTrue([db open]);
    XCTAssertTrue([db executeUpdate:@"CREATE TABLE value(id INTEGER)"]);
    NSError *error = nil;
    BOOL committed = [db jobsPerformTransaction:^BOOL(id database) {
        [database handleExecuteUpdate:@"INSERT INTO value VALUES(1)" withArgumentsInArray:nil];
        [database handleExecuteUpdate:@"INSERT INTO absent VALUES(2)" withArgumentsInArray:nil];
        [database handleExecuteUpdate:@"INSERT INTO value VALUES(3)" withArgumentsInArray:nil];
        return YES;
    } error:&error];
    XCTAssertFalse(committed);
    XCTAssertNotNil(error);
    XCTAssertTrue(db.isOpen);
    XCTAssertFalse(db.isInTransaction);
    FMResultSet *rows = [db executeQuery:@"SELECT COUNT(*) FROM value"];
    XCTAssertTrue([rows next]);
    XCTAssertEqual([rows intForColumnIndex:0], 0);
    [rows close];
    XCTAssertFalse([db jobsPerformTransaction:^BOOL(id database) {
        @throw [NSException exceptionWithName:@"Fixture" reason:@"expected" userInfo:nil];
    } error:&error]);
    XCTAssertNotNil(error);
    XCTAssertTrue(db.isOpen);
    [db close];
}

-(void)testNestedTransactionDoesNotConsumeCallerTransaction{
    FMDatabase *db = [FMDatabase databaseWithPath:@":memory:"];
    XCTAssertTrue([db open]);
    XCTAssertTrue([db beginTransaction]);
    XCTAssertFalse([db jobsPerformTransaction:^BOOL(id database) { return YES; } error:nil]);
    XCTAssertTrue(db.isInTransaction);
    [db rollback];
    [db close];
}

@end
