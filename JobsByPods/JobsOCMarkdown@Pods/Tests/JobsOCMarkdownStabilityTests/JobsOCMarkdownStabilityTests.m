//
//  JobsOCMarkdownStabilityTests.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCMarkdownStabilityTests.h"

// 用途：实现自动化测试；验证 Markdown 文档 DSL 不递归重入，以及未启动视图释放时的弱引用安全。
// 运行：在 Xcode 的 Pods 工程 JobsOCMarkdown-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

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
