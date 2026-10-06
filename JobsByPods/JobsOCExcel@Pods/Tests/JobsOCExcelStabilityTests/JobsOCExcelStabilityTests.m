//
//  JobsOCExcelStabilityTests.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCExcelStabilityTests.h"

@interface JobsOCExcelView (JobsUIRegressionAccess)
-(jobsByLabelBlock)jobsHandleCellTap;

@end

@implementation JobsOCExcelStabilityTests

-(void)testExcelLargeGridBoundsLiveViewsAndRebindsMissingCell{
    NSMutableArray *columns = NSMutableArray.array;
    for (NSInteger column = 0; column < 100; ++column) {
        [columns addObject:[JobsOCExcelColumn columnWithTitle:[NSString stringWithFormat:@"列%ld", (long)column] width:80]];
    }
    NSMutableArray *rows = NSMutableArray.array;
    for (NSInteger row = 0; row < 10000; ++row) {
        NSString *text = [NSString stringWithFormat:@"行%ld", (long)row];
        JobsOCExcelCell *cell = JobsOCExcelCell.cellWithText(text);
        JobsOCExcelRow *model = JobsOCExcelRow.rowWithCells(@[cell]);
        [rows addObject:model];
    }
    JobsOCExcelView *excel = JobsOCExcelView.new;
    excel.byFrame(CGRectMake(0, 0, 320, 240));
    excel.byDelegate(self);
    [excel configureWithColumns:columns rows:rows freezeThroughColumn:0 style:nil];
    [excel layoutIfNeeded];
    NSArray<UILabel *> *initial = [excel valueForKey:@"generatedLabels"];
    XCTAssertGreaterThan(initial.count, 0);
    XCTAssertLessThan(initial.count, 150);
    UIScrollView *vertical = [excel valueForKey:@"verticalScrollView"];
    [vertical setContentOffset:CGPointMake(0, 400000) animated:NO];
    [excel setHorizontalContentOffset:1200 animated:NO];
    NSArray<UILabel *> *moved = [excel valueForKey:@"generatedLabels"];
    XCTAssertLessThan(moved.count, 150);
    UILabel *missingCell = nil;
    for (UILabel *label in moved) {
        if (label.tag >= 0 && label.tag % columns.count != 0) {
            missingCell = label;
            break;
        }
    }
    XCTAssertNotNil(missingCell);
    excel.jobsHandleCellTap(missingCell);
    XCTAssertGreaterThan(self.selectedCell.row, 8000);
    XCTAssertGreaterThan(self.selectedCell.column, 0);
    XCTAssertEqualObjects(self.selectedCell.value, @"");
    [excel configureWithColumns:@[] rows:@[] freezeThroughColumn:NSIntegerMax style:nil];
    [excel layoutIfNeeded];
    XCTAssertEqual([[excel valueForKey:@"generatedLabels"] count], 0);
    XCTAssertFalse([[excel valueForKey:@"emptyView"] isHidden]);
}


-(void)testExcelEmptyReloadButtonCallsHost{
    void (^verifyButton)(void) = ^{
        JobsOCExcelView *excel = [JobsOCExcelView.alloc initWithFrame:CGRectMake(0, 0, 320, 240)];
        __block NSUInteger requests = 0;
        excel.byOnReloadRequested(^{
            ++requests;
        });
        UIView *empty = [excel valueForKey:@"emptyView"];
        XCTAssertNotNil(empty);
        XCTAssertFalse(empty.hidden);
        NSMutableArray<UIButton *> *buttons = NSMutableArray.array;
        NSMutableArray<NSString *> *messages = NSMutableArray.array;
        for (UIView *view in empty.subviews) {
            if ([view isKindOfClass:UIButton.class]) {
                [buttons addObject:(UIButton *)view];
            } else if ([view isKindOfClass:UILabel.class]) {
                NSString *text = ((UILabel *)view).text;
                if (text) {
                    [messages addObject:text];
                }
            }
        }
        XCTAssertEqual(buttons.count, 1);
        XCTAssertTrue([messages containsObject:@"暂无表格数据"]);
        XCTAssertTrue([messages containsObject:@"数据载入后会显示在这里"]);
        UIButton *reloadButton = buttons.firstObject;
        if (!reloadButton) {
            return;
        }
        XCTAssertEqualObjects(reloadButton.configuration.title ?: [reloadButton titleForState:UIControlStateNormal], @"重新加载");
        XCTAssertNotEqual(reloadButton.allControlEvents & UIControlEventTouchUpInside, 0);
        [reloadButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        XCTAssertEqual(requests, 1);
        NSArray<UIView *> *originalSubviews = empty.subviews;
        [excel reloadData];
        XCTAssertEqual([excel valueForKey:@"emptyView"], empty);
        XCTAssertEqualObjects(empty.subviews, originalSubviews);
        [reloadButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        XCTAssertEqual(requests, 2);
        excel.byOnReloadRequested(^{
            requests += 10;
        });
        [reloadButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        XCTAssertEqual(requests, 12);
    };
    if (NSThread.isMainThread) {
        verifyButton();
    } else {
        dispatch_sync(dispatch_get_main_queue(), verifyButton);
    }
}


-(void)excelView:(JobsOCExcelView *)excelView didSelectCell:(JobsOCExcelCellContext *)context{
    self.selectedCell = context;
}


@end
