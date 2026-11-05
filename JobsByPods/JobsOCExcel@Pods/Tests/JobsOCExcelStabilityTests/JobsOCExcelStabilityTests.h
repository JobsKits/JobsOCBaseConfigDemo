//
//  JobsOCExcelStabilityTests.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCExcel/JobsOCExcel.h>

// 用途：声明自动化测试；验证大表格复用视图数量有界、缺失单元格重新绑定与空态重新加载回调。
// 运行：在 Xcode 的 Pods 工程 JobsOCExcel-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCExcelStabilityTests : XCTestCase<JobsOCExcelViewDelegate>

Prop_strong(nullable)JobsOCExcelCellContext *selectedCell;

@end
