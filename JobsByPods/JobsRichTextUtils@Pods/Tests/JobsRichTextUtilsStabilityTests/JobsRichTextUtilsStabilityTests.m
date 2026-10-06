//
//  JobsRichTextUtilsStabilityTests.m
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsRichTextUtilsStabilityTests.h"

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
