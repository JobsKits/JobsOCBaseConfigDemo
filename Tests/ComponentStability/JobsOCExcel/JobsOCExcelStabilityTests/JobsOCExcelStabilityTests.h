//
//  JobsOCExcelStabilityTests.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCExcel/JobsOCExcel.h>)
#import <JobsOCExcel/JobsOCExcel.h>
#else
#import "JobsOCExcel.h"
#endif

// 用途：声明自动化测试；验证大表格复用视图数量有界、缺失单元格重新绑定与空态重新加载回调。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCExcelStabilityTests : XCTestCase<JobsOCExcelViewDelegate>

Prop_strong(nullable)JobsOCExcelCellContext *selectedCell;

@end
