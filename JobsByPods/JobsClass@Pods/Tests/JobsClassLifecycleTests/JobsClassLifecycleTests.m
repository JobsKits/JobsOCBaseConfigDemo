//
//  JobsClassLifecycleTests.m
//  JobsClass
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsClassLifecycleTests.h"

// 用途：实现自动化测试；验证对象释放后已保存的属性读取块安全返回，不继续访问已销毁宿主。
// 运行：在 Xcode 的 Pods 工程 JobsClass-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsClassLifecycleTests

-(void)testSavedOrderedPropertyReaderAfterOwnerRelease {
    JobsRetArrByVoidBlock reader;
    __weak NSObject *owner;
    @autoreleasepool {
        NSObject *object = NSObject.new;
        owner = object;
        reader = object.readModelPropertyValueByOrder;
    }
    XCTAssertNil(owner);
    XCTAssertNil(reader());
}

@end
