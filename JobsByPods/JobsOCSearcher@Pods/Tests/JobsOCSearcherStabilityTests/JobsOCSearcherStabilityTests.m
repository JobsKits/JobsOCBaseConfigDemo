//
//  JobsOCSearcherStabilityTests.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年11月14日，星期六.
//

#import "JobsOCSearcherStabilityTests.h"

@implementation JobsOCSearcherStabilityTests

/// Verify the public component rather than duplicating its persistence algorithm.
-(void)testSearcherHistoryIsolationAndLegacyStorage{
    NSString *suite = [@"jobs.searcher.tests." stringByAppendingString:NSUUID.UUID.UUIDString];
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    NSString *key = [suite stringByAppendingString:@".history"];
    [defaults setObject:@[@"  legacy ", @"legacy", @"second", @42] forKey:key];
    JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig()
        .byHistoryStorageKey(key)
        .byHistoryDefaults(defaults)
        .byMaxHistoryCount(2);
    JobsOCSearcherView *view = [JobsOCSearcherView.alloc initWithConfig:config];
    XCTAssertEqualObjects(view.historySearches, (@[@"legacy", @"second"]));
    view.saveHistoryByText(@" third ");
    XCTAssertEqualObjects([defaults arrayForKey:key], (@[@"third", @"legacy"]));
    config.byHistoryScope(@"account A");
    view.reloadHistorySearches();
    XCTAssertEqual(view.historySearches.count, 0U);
    view.saveHistoryByText(@"private");
    config.byHistoryScope(@"account B");
    view.clearHistory();
    config.byHistoryScope(@"account A");
    view.reloadHistorySearches();
    XCTAssertEqualObjects(view.historySearches, (@[@"private"]));
    config.byPersistsHistory(NO);
    view.reloadHistorySearches();
    XCTAssertEqual(view.historySearches.count, 0U);
    view.saveHistoryByText(@"memory");
    config.byHistoryScope(@"account B");
    view.reloadHistorySearches();
    XCTAssertEqual(view.historySearches.count, 0U);
    config.byHistoryScope(@"account A");
    view.reloadHistorySearches();
    XCTAssertEqualObjects(view.historySearches, (@[@"memory"]));
    config.byPersistsHistory(YES);
    view.reloadHistorySearches();
    XCTAssertEqualObjects(view.historySearches, (@[@"private"]));
    config.byHistoryScope(nil);
    view.reloadHistorySearches();
    XCTAssertEqualObjects(view.historySearches, (@[@"third", @"legacy"]));
    config.byMaxHistoryCount(0);
    XCTAssertEqual(config.maxHistoryCount, 1U);
    config.byMaxHistoryCount(5000);
    XCTAssertEqual(config.maxHistoryCount, 1000U);
    for (NSString *storedKey in defaults.dictionaryRepresentation.allKeys) {
        if ([storedKey hasPrefix:suite])
            [defaults removeObjectForKey:storedKey];
    }
}

-(void)testSearcherQueryCallbacksAndResultsAreIndependent{
    __block NSUInteger changes = 0;
    __block NSUInteger confirms = 0;
    JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig()
        .byPersistsHistory(NO)
        .bySearchTextDidChangeBlock(^(NSString *text) {
            changes += 1;
        })
        .bySearchConfirmBlock(^(NSString *text) {
            confirms += 1;
        });
    JobsOCSearcherView *view = [JobsOCSearcherView.alloc initWithConfig:config];
    UIView *results = jobsMakeView(^(__kindof UIView *result) {});
    view.byResultContentView(results).byQuery(@"  Swift  ", NO).byResultCount(2);
    XCTAssertEqualObjects(view.normalizedQuery, @"Swift");
    XCTAssertEqual(changes, 1U);
    XCTAssertEqual(view.historySearches.count, 0U);
    view.byQuery(@"Swift", NO).byResultCount(0);
    XCTAssertEqual(changes, 1U);
    [view.textField.delegate textFieldShouldReturn:view.textField];
    XCTAssertEqual(confirms, 1U);
    XCTAssertEqual(changes, 1U);
    XCTAssertEqualObjects(view.historySearches, (@[@"Swift"]));
    view.byQuery(@"", NO);
    XCTAssertEqual(changes, 2U);
    XCTAssertEqualObjects(view.normalizedQuery, @"");
    XCTAssertEqual(view.historySearches.count, 1U);
    XCTAssertEqualObjects(view.resultContentView, results);
    view.byResultContentView(nil);
    XCTAssertNil(results.superview);
}

-(void)testSearcherConfigRefreshPreservesQueryAndCustomField{
    JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig().byPersistsHistory(NO);
    UITextField *field = jobsMakeTextField(^(__kindof UITextField *textField) {});
    JobsOCSearcherView *view = [JobsOCSearcherView.alloc initWithConfig:config textField:field];
    view.byQuery(@"UIKit", YES).byRecommendSearches(@[@"Swift", @" Swift ", @"", @"UIKit"]);
    config.byPlaceholder(@"Search").byShowsCancelButton(YES).byTextColor(UIColor.redColor);
    view.reloadWithConfig(config);
    XCTAssertEqualObjects(view.textField, field);
    XCTAssertEqualObjects(view.normalizedQuery, @"UIKit");
    XCTAssertEqualObjects(view.textField.text, @"UIKit");
    XCTAssertEqualObjects(view.historySearches, (@[@"UIKit"]));
    XCTAssertEqualObjects(view.textField.placeholder, @"Search");
    XCTAssertEqualObjects(view.textField.delegate, view);
    XCTAssertNotNil(view.textField.inputAccessoryView);
}


/// This catches a category accidentally replacing UIKit's actual text getter.
-(void)testSearcherUsesNativeAttributedTextForRendering{
    JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig()
        .byPlaceholder(@"Search")
        .byPersistsHistory(NO);
    JobsOCSearcherView *view = [JobsOCSearcherView.alloc initWithConfig:config];
    view.byQuery(@"UIKit", NO);
    XCTAssertEqualObjects(view.textField.text, @"UIKit");
    XCTAssertEqualObjects(view.textField.attributedText.string, @"UIKit");
    XCTAssertEqualObjects(view.textField.attributedPlaceholder.string, @"Search");
    view.reloadWithConfig(config.byTextColor(UIColor.blackColor));
    XCTAssertEqualObjects(view.textField.attributedText.string, @"UIKit");
}


/// The temporary test host carries the App's real en/zh-Hans tables, not mock translations.
-(void)testSearcherSameConfigReloadsCurrentLanguage{
    AppLanguage previous = LanMgr.language;
    @try {
        [LanMgr setLanguage:AppLanguageEnglish];
        XCTSkipIf([@"请输入搜索内容".jobsTr() isEqualToString:@"请输入搜索内容"], @"This host has no English localization table; the App integration host supplies it.");
        JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig().byPersistsHistory(NO);
        JobsOCSearcherView *view = [JobsOCSearcherView.alloc initWithConfig:config];
        view.byQuery(@"UIKit", YES);
        XCTAssertEqualObjects(config.placeholder, @"请输入搜索内容");
        XCTAssertEqualObjects(view.textField.placeholder, @"Please enter search content");
        [LanMgr setLanguage:AppLanguageChineseSimplified];
        view.reloadWithConfig(config);
        XCTAssertEqualObjects(view.textField.placeholder, @"请输入搜索内容");
        XCTAssertEqualObjects(view.normalizedQuery, @"UIKit");
        XCTAssertEqualObjects(view.historySearches, (@[@"UIKit"]));
        config.byPlaceholder(@"Custom prompt");
        view.reloadWithConfig(config);
        XCTAssertEqualObjects(view.textField.placeholder, @"Custom prompt");
    } @finally {
        [LanMgr setLanguage:previous];
    }
}


/// Check the drawn input geometry, beyond accessibility and text storage values.
-(void)testSearcherLaysOutVisibleNativeInput{
    JobsOCSearcherView *view = [JobsOCSearcherView.alloc initWithConfig:JobsOCSearcherConfig.defaultConfig().byPersistsHistory(NO)];
    view.byQuery(@"UIKit", NO).byFrame(CGRectMake(0, 0, 420, 700));
    [view setNeedsLayout];
    [view layoutIfNeeded];
    UITextField *field = view.textField;
    CGRect textRect = [field textRectForBounds:field.bounds];
    CGRect editingRect = [field editingRectForBounds:field.bounds];
    NSLog(@"OC_SEARCHER_RENDER frame=%@ bounds=%@ textRect=%@ editingRect=%@ font=%@ color=%@ alpha=%f hidden=%d attributes=%@", NSStringFromCGRect(field.frame), NSStringFromCGRect(field.bounds), NSStringFromCGRect(textRect), NSStringFromCGRect(editingRect), field.font, field.textColor, field.alpha, field.hidden, field.defaultTextAttributes);
    NSLog(@"OC_SEARCHER_ACCESSORY left=%@ bounds=%@ right=%@", NSStringFromCGRect(field.leftView.frame), NSStringFromCGRect(field.leftView.bounds), NSStringFromCGRect(field.rightView.frame));
    XCTAssertGreaterThan(field.bounds.size.width, 100);
    XCTAssertGreaterThan(textRect.size.width, 50);
    XCTAssertGreaterThan(textRect.size.height, 12);
    XCTAssertGreaterThan(editingRect.size.width, 50);
    XCTAssertGreaterThan(editingRect.size.height, 12);
    XCTAssertGreaterThan(field.font.pointSize, 12);
    XCTAssertGreaterThan(field.alpha, 0.9);
    XCTAssertFalse(field.hidden);
    UIImage *image = JobsRenderImage(view.bounds.size, YES, 1, ^(CGContextRef context) {
        [view.layer renderInContext:context];
    });
    XCTAttachment *attachment = [XCTAttachment attachmentWithImage:image];
    attachment.name = @"Searcher-native-input-layout";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
