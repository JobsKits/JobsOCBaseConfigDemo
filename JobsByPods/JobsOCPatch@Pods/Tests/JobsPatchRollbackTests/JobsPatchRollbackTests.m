//
//  JobsPatchRollbackTests.m
//  JobsOCPatch
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsPatchRollbackTests.h"

static id JobsPatchAcceptanceOriginal(id receiver, SEL selector) {
    return @{@"original": @YES};
}

static NSArray<Class> *JobsPatchAcceptanceClasses(void) {
    static NSArray<Class> *classes;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSString *prefix = [@"JobsPatchAcceptance_" stringByAppendingString:NSUUID.UUID.UUIDString];
        Class parent = objc_allocateClassPair(NSObject.class, [[prefix stringByAppendingString:@"Parent"] UTF8String], 0);
        class_addMethod(parent, NSSelectorFromString(@"jobsAcceptancePayload"), (IMP)JobsPatchAcceptanceOriginal, "@@:");
        objc_registerClassPair(parent);
        Class first = objc_allocateClassPair(parent, [[prefix stringByAppendingString:@"First"] UTF8String], 0);
        Class sibling = objc_allocateClassPair(parent, [[prefix stringByAppendingString:@"Sibling"] UTF8String], 0);
        objc_registerClassPair(first);
        objc_registerClassPair(sibling);
        classes = @[parent, first, sibling];
    });
    return classes;
}

static id JobsPatchAcceptanceRead(id receiver) {
    SEL selector = NSSelectorFromString(@"jobsAcceptancePayload");
    IMP implementation = [receiver methodForSelector:selector];
    return ((id (*)(id, SEL))implementation)(receiver, selector);
}

@implementation JobsPatchRollbackTests

-(NSDictionary *)fixturePayload {
    return @{@"original": @YES};
}

-(NSInteger)fixtureScalar {
    return 42;
}

-(void)tearDown {
    JobsOCPatchMgr.shared().rollbackAllPatches();
    [super tearDown];
}

-(void)testRollbackKeepsPreviouslyLoadedIMPCallable {
    JobsOCPatchModel *model = JobsOCPatchModel.new;
    model.identifier = @"jobs.patch.rollback";
    model.targetCls = self.class;
    model.selector = @selector(fixturePayload);
    model.payload = @{@"patched": @YES};
    JobsOCPatchMgr *manager = JobsOCPatchMgr.shared();
    XCTAssertTrue(manager.installPayloadPatch(model));
    XCTAssertEqualObjects(self.fixturePayload, model.payload);
    IMP inFlight = class_getMethodImplementation(self.class, @selector(fixturePayload));
    XCTAssertTrue(manager.rollbackPatchByIdentifier(model.identifier));
    XCTAssertEqualObjects(((id (*)(id, SEL))inFlight)(self, @selector(fixturePayload)), @{@"original": @YES});
    XCTAssertEqualObjects(self.fixturePayload, @{@"original": @YES});
}

-(void)testSameSlotRejectsDifferentIdentifierAndScalarABI {
    JobsOCPatchModel *first = JobsOCPatchModel.new;
    first.identifier = @"jobs.patch.first";
    first.targetCls = self.class;
    first.selector = @selector(fixturePayload);
    first.payload = @{@"first": @YES};
    JobsOCPatchMgr *manager = JobsOCPatchMgr.shared();
    XCTAssertTrue(manager.installPayloadPatch(first));
    JobsOCPatchModel *second = JobsOCPatchModel.new;
    second.identifier = @"jobs.patch.second";
    second.targetCls = self.class;
    second.selector = @selector(fixturePayload);
    second.payload = @{@"second": @YES};
    XCTAssertFalse(manager.installPayloadPatch(second));
    XCTAssertEqualObjects(self.fixturePayload, first.payload);
    second.selector = @selector(fixtureScalar);
    XCTAssertFalse(manager.installPayloadPatch(second));
    second.selector = @selector(copy);
    XCTAssertFalse(manager.installPayloadPatch(second));
}

-(void)testSavedPatchBlockAfterManagerRelease {
    JobsRetBOOLByJobsOCPatchModelBlock action;
    @autoreleasepool {
        JobsOCPatchMgr *manager = JobsOCPatchMgr.new;
        action = manager.installPayloadPatch;
    }
    XCTAssertFalse(action(JobsOCPatchModel.new));
}
-(void)testInheritedSlotsSameIdentifierUpdateAndExplicitRollbackAll {
    NSArray<Class> *classes = JobsPatchAcceptanceClasses();
    id parent = [classes[0] new];
    id first = [classes[1] new];
    id sibling = [classes[2] new];
    JobsOCPatchMgr *manager = JobsOCPatchMgr.shared();
    JobsOCPatchModel *firstPatch = JobsOCPatchModel.new;
    firstPatch.identifier = @"jobs.patch.acceptance.first";
    firstPatch.targetCls = classes[1];
    firstPatch.selector = NSSelectorFromString(@"jobsAcceptancePayload");
    firstPatch.payload = @{@"first": @1};
    XCTAssertTrue(manager.installPayloadPatch(firstPatch));
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(first), firstPatch.payload);
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(parent), @{@"original": @YES});
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(sibling), @{@"original": @YES});
    firstPatch.payload = @{@"first": @2};
    XCTAssertTrue(manager.installPayloadPatch(firstPatch));
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(first), firstPatch.payload);

    JobsOCPatchModel *siblingPatch = JobsOCPatchModel.new;
    siblingPatch.identifier = @"jobs.patch.acceptance.sibling";
    siblingPatch.targetCls = classes[2];
    siblingPatch.selector = firstPatch.selector;
    siblingPatch.payload = @{@"sibling": @YES};
    XCTAssertTrue(manager.installPayloadPatch(siblingPatch));
    manager.rollbackAllPatches();
    XCTAssertFalse(manager.containsPatchByIdentifier(firstPatch.identifier));
    XCTAssertFalse(manager.containsPatchByIdentifier(siblingPatch.identifier));
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(first), @{@"original": @YES});
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(sibling), @{@"original": @YES});
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(parent), @{@"original": @YES});
}

-(void)testConcurrentInstallInvokeAndRollbackUsesOnlyValidImplementations {
    Class targetClass = JobsPatchAcceptanceClasses()[1];
    id target = [targetClass new];
    JobsOCPatchMgr *manager = JobsOCPatchMgr.shared();
    NSObject *monitor = NSObject.new;
    __block NSUInteger installed = 0;
    __block BOOL invalidResult = NO;
    dispatch_apply(128, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
        @autoreleasepool {
            JobsOCPatchModel *patch = JobsOCPatchModel.new;
            patch.identifier = [NSString stringWithFormat:@"jobs.patch.acceptance.concurrent.%zu", index];
            patch.targetCls = targetClass;
            patch.selector = NSSelectorFromString(@"jobsAcceptancePayload");
            patch.payload = @{@"worker": @(index)};
            BOOL accepted = manager.installPayloadPatch(patch);
            id result = JobsPatchAcceptanceRead(target);
            BOOL valid = [result isKindOfClass:NSDictionary.class] &&
                ([result isEqual:@{@"original": @YES}] || [result[@"worker"] isKindOfClass:NSNumber.class]);
            if (accepted) {
                manager.rollbackPatchByIdentifier(patch.identifier);
            }
            @synchronized (monitor) {
                installed += accepted ? 1 : 0;
                invalidResult |= !valid;
            }
        }
    });
    XCTAssertGreaterThan(installed, 0u);
    XCTAssertFalse(invalidResult);
    manager.rollbackAllPatches();
    XCTAssertEqualObjects(JobsPatchAcceptanceRead(target), @{@"original": @YES});
    for (NSUInteger index = 0; index < 128; index++) {
        XCTAssertFalse(manager.containsPatchByIdentifier([NSString stringWithFormat:@"jobs.patch.acceptance.concurrent.%lu", (unsigned long)index]));
    }
}
@end
