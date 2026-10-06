//
//  JobsOCDSLAnimatedNumberStabilityTests.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCDSLAnimatedNumberStabilityTests.h"

@implementation JobsOCDSLAnimatedNumberStabilityTests

-(void)testStoppingBeforeFirstStartAndRepeatedStopAreSafe{
    UILabel *label = UILabel.new;
    XCTAssertEqual(label.byStopAnimatedTextNumber(), label);
    XCTAssertEqual(label.byStopAnimatedTextNumber(), label);
}

-(void)testSavedAnimationBlocksAreSafeAfterLabelReleases{
    JobsRetLabelByTextBlock start;
    JobsRetLabelByVoidBlock stop;
    @autoreleasepool {
        UILabel *label = UILabel.new;
        start = label.byStartAnimatedTextNumber;
        stop = label.byStopAnimatedTextNumber;
    }
    XCTAssertNil(start(@"10"));
    XCTAssertNil(stop());
}

-(void)testNonfiniteConfigurationCompletesWithoutSchedulingInvalidInterval{
    UILabel *label = UILabel.new;
    __block NSUInteger finished = 0;
    [label byAnimatedTextNumberFrom:@(NAN) step:@(INFINITY) duration:NAN minimumInterval:INFINITY completion:^{
        ++finished;
    }];
    label.byStartAnimatedTextNumber(@"20");
    XCTAssertEqualObjects(label.text, @"20");
    XCTAssertEqual(finished, 1);
}

-(void)testCancelledRunCannotOverwriteNewValueOrComplete{
    UILabel *label = UILabel.new;
    __block NSUInteger cancelledCompletions = 0;
    __block NSUInteger currentCompletions = 0;
    [label byAnimatedTextNumberFrom:@0 step:@1 duration:10 minimumInterval:0.01 completion:^{
        ++cancelledCompletions;
    }];
    label.byStartAnimatedTextNumber(@"200");
    label.byStopAnimatedTextNumber();
    [label byAnimatedTextNumberFrom:@0 step:nil duration:0 minimumInterval:0.01 completion:^{
        ++currentCompletions;
    }];
    label.byStartAnimatedTextNumber(@"7");
    XCTestExpectation *settled = [self expectationWithDescription:@"取消后的旧 tick 不再写文字"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 200 * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
        XCTAssertEqualObjects(label.text, @"7");
        XCTAssertEqual(cancelledCompletions, 0);
        XCTAssertEqual(currentCompletions, 1);
        [settled fulfill];
    });
    [self waitForExpectations:@[settled] timeout:2];
}

-(void)testSavedLabelCompositionBlocksReturnNilAfterLabelRelease{
    JobsRetLabelByTextBlock appendText;
    JobsRetLabelByImageBlock background;
    JobsRetLabelByNSIntegerBlock transform;
    JobsRetLabelByVoidBlock fitFont;
    @autoreleasepool {
        UILabel *label = UILabel.new;
        appendText = label.byNextText;
        background = [label bgImage];
        transform = label.transformLayer;
        fitFont = label.labelAutoFontByWidth;
    }
    XCTAssertNil(appendText(@"late"));
    XCTAssertNil(background(nil));
    XCTAssertNil(transform(0));
    XCTAssertNil(fitFont());
}

@end
