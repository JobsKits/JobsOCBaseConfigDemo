//
//  JobsRichTextUtilsStabilityTests.m
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsRichTextUtilsStabilityTests.h"

// 用途：实现自动化测试；验证富文本下划线颜色，以及越界或溢出范围的安全处理。
// 运行：在 Xcode 的 Pods 工程 JobsRichTextUtils-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsRichTextUtilsStabilityTests

-(void)testUnderlineColorAndOverflowRangeAreHandled{
    NSMutableAttributedString *text = NSMutableAttributedString.initByString(@"abc");
    JobsParagraphStyleModel *model = [JobsParagraphStyleModel new];
    model.value = UIColor.redColor;
    model.range = NSMakeRange(0, 3);
    text.addUnderlineColorAttributeNameByParagraphStyleModel(model);
    XCTAssertEqualObjects([text attribute:NSUnderlineColorAttributeName atIndex:0 effectiveRange:nil], UIColor.redColor);
    model.value = @2;
    model.range = NSMakeRange(NSUIntegerMax - 1, 9);
    XCTAssertNoThrow(text.addkCTKernAttributeNameByParagraphStyleModel(model));
    XCTAssertNil([text attribute:NSKernAttributeName atIndex:0 effectiveRange:nil]);
    NSAttributedString *empty = NSAttributedString.initByString(nil);
    XCTAssertNil(empty.attributedStringFont());
    XCTAssertNil(empty.attributedStringTextCor());
    XCTAssertNil(empty.attributedStringParagraphStyle());
}

@end
