//
//  FileFolderHandleToolStabilityTests.h
//  FileFolderHandleTool
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<FileFolderHandleTool/FileFolderHandleToolHeader.h>)
#import <FileFolderHandleTool/FileFolderHandleToolHeader.h>
#else
#import "FileFolderHandleToolHeader.h"
#endif


// 用途：声明自动化测试；验证首次创建、禁止覆盖、原子替换、并发写入和无权限目录的文件保护。
// 运行：在 Xcode 的 Pods 工程 FileFolderHandleTool-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface FileFolderHandleToolStabilityTests : XCTestCase

@end
