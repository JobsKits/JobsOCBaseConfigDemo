//
//  JobsOCMarkdownStabilityTests.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCMarkdownStabilityTests.h"

@implementation JobsOCMarkdownStabilityTests

-(void)testMarkdownDocumentChainDoesNotReenter{
    JobsOCMarkdownView *view = JobsOCMarkdownView.new;
    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString]];
    JobsOCMarkdownDocument *document = [[JobsOCMarkdownDocument alloc] initWithIdentifier:@"missing-test" title:@"测试" relativePath:@"missing.md" fileURL:url contentRootURL:url.URLByDeletingLastPathComponent];
    view.byDocument(document);
    XCTAssertEqual(view.document, document);
    view.reloadDocument();
    XCTAssertEqual(view.document, document);
}


-(void)testUnstartedViewReleasesWithoutWeakRegistrationInDealloc{
    __weak JobsOCMarkdownView *weakView;
    @autoreleasepool {
        JobsOCMarkdownView *view = JobsOCMarkdownView.new;
        weakView = view;
    }
    XCTAssertNil(weakView);
}


@end
