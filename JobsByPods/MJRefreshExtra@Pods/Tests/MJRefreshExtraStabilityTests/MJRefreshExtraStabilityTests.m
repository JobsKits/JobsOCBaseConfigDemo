//
//  MJRefreshExtraStabilityTests.m
//  MJRefreshExtra
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "MJRefreshExtraStabilityTests.h"
#import "../../Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.h"

@interface UIButton (JobsMJRefreshOptionalTextViewTesting)
-(Class _Nullable)jobs_mjRefreshTextViewClass;
@end

@interface JobsMJRefreshProvidedTextViewFixture : UITextView
@end

@implementation JobsMJRefreshProvidedTextViewFixture
@end

@interface JobsMJRefreshNilTextViewFixture : UITextView
@end

@implementation JobsMJRefreshNilTextViewFixture
-(instancetype)init{
    return nil;
}
@end

@interface JobsMJRefreshTextViewButtonFixture : UIButton
@property(nonatomic,assign,nullable)Class providedTextViewClass;
@end

@implementation JobsMJRefreshTextViewButtonFixture
-(Class _Nullable)jobs_mjRefreshTextViewClass{
    return self.providedTextViewClass;
}
@end

@implementation MJRefreshExtraStabilityTests

-(void)performTextViewAssertionsOnMain:(jobsByVoidBlock)assertions{
    if (NSThread.isMainThread) {
        assertions();
    } else {
        dispatch_sync(dispatch_get_main_queue(), assertions);
    }
}

-(void)testDefaultTextViewResolverUsesOnlyAvailableRuntimeProvider{
    [self performTextViewAssertionsOnMain:^{
        UIButton *button = [UIButton new];
        Class provider = NSClassFromString(@"BaseTextView");
        if (provider && [provider isSubclassOfClass:UITextView.class]) {
            XCTAssertTrue([button.titleTextView isKindOfClass:provider]);
            XCTAssertTrue([button.subtitleTextView isKindOfClass:provider]);
        } else {
            XCTAssertNil(button.titleTextView);
            XCTAssertNil(button.subtitleTextView);
        }
    }];
}

-(void)testMissingAndInvalidTextViewProvidersReturnNilAndCanRecover{
    [self performTextViewAssertionsOnMain:^{
        JobsMJRefreshTextViewButtonFixture *button = [JobsMJRefreshTextViewButtonFixture new];
        XCTAssertNil(button.titleTextView);
        XCTAssertNil(button.subtitleTextView);
        button.providedTextViewClass = NSObject.class;
        XCTAssertNil(button.titleTextView);
        XCTAssertNil(button.subtitleTextView);
        button.providedTextViewClass = JobsMJRefreshProvidedTextViewFixture.class;
        XCTAssertNotNil(button.titleTextView);
        XCTAssertNotNil(button.subtitleTextView);
    }];
}

-(void)testProvidedTextViewsKeepConfigurationAndCachedIdentity{
    [self performTextViewAssertionsOnMain:^{
        JobsMJRefreshTextViewButtonFixture *button = [JobsMJRefreshTextViewButtonFixture new];
        button.providedTextViewClass = JobsMJRefreshProvidedTextViewFixture.class;
        button.titleLabel.frame = CGRectMake(3, 4, 90, 24);
        UITextView *title = button.titleTextView;
        UITextView *subtitle = button.subtitleTextView;
        XCTAssertNotNil(title);
        XCTAssertNotNil(subtitle);
        if (!title || !subtitle) {
            return;
        }
        XCTAssertTrue([title isKindOfClass:JobsMJRefreshProvidedTextViewFixture.class]);
        XCTAssertTrue([subtitle isKindOfClass:JobsMJRefreshProvidedTextViewFixture.class]);
        XCTAssertNotEqual(title, subtitle);
        for (UITextView *textView in @[title, subtitle]) {
            XCTAssertEqual(textView.delegate, button);
            XCTAssertFalse(textView.editable);
            XCTAssertTrue(textView.selectable);
            XCTAssertEqual(textView.dataDetectorTypes, UIDataDetectorTypeLink);
            XCTAssertFalse(textView.scrollEnabled);
            XCTAssertTrue(textView.userInteractionEnabled);
            XCTAssertEqual(textView.textAlignment, NSTextAlignmentCenter);
            XCTAssertEqualObjects(textView.linkTextAttributes, NSObject.linkTextAttributes());
            XCTAssertEqual(textView.superview, button);
            XCTAssertTrue(CGRectEqualToRect(textView.frame, button.titleLabel.frame));
        }
        button.providedTextViewClass = Nil;
        XCTAssertEqual(button.titleTextView, title);
        XCTAssertEqual(button.subtitleTextView, subtitle);
    }];
}

-(void)testNilTextViewInitializationDoesNotCacheOrConfigureAView{
    [self performTextViewAssertionsOnMain:^{
        JobsMJRefreshTextViewButtonFixture *button = [JobsMJRefreshTextViewButtonFixture new];
        button.providedTextViewClass = JobsMJRefreshNilTextViewFixture.class;
        NSUInteger subviews = button.subviews.count;
        XCTAssertNil(button.titleTextView);
        XCTAssertNil(button.subtitleTextView);
        XCTAssertEqual(button.subviews.count, subviews);
        button.providedTextViewClass = JobsMJRefreshProvidedTextViewFixture.class;
        XCTAssertNotNil(button.titleTextView);
        XCTAssertNotNil(button.subtitleTextView);
    }];
}

-(void)testSavedRefreshCompletionAfterFooterReleaseIsSafe{
    [self performTextViewAssertionsOnMain:^{
        __weak LOTAnimationMJRefreshFooter *weakFooter = nil;
        __block jobsByVoidBlock completion;
        @autoreleasepool {
            LOTAnimationMJRefreshFooter *footer = LOTAnimationMJRefreshFooter.new;
            LOTAnimationView *animation = [footer valueForKey:@"animationView"];
            XCTAssertNotNil(animation);
            XCTAssertTrue(animation.loopAnimation);
            XCTAssertTrue(CGSizeEqualToSize(animation.frame.size, CGSizeMake(30, 30)));
            XCTAssertEqual(animation.superview, footer);
            XCTAssertEqual([footer valueForKey:@"animationView"], animation);
            weakFooter = footer;
            completion = footer.endRefreshingCompletionBlock;
        }
        XCTAssertNil(weakFooter);
        XCTAssertNotNil(completion);
        completion();
    }];
}

-(void)testHeaderInitializationAndSavedCompletionKeepIndependentPodContract{
    [self performTextViewAssertionsOnMain:^{
        __weak LOTAnimationMJRefreshHeader *weakHeader = nil;
        __block jobsByVoidBlock completion;
        __block JobsRetLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock lateConfigBlock;
        MJRefreshConfigModel *model = MJRefreshConfigModel.new;
        model.stateIdleTitle = @"Jobs saved header configuration";
        @autoreleasepool {
            LOTAnimationMJRefreshHeader *header = LOTAnimationMJRefreshHeader.new;
            LOTAnimationView *animation = [header valueForKey:@"animationView"];
            XCTAssertNotNil(animation);
            XCTAssertTrue(animation.loopAnimation);
            XCTAssertTrue(CGSizeEqualToSize(animation.frame.size, CGSizeMake(30, 30)));
            XCTAssertEqual(animation.superview, header);
            XCTAssertEqual([header valueForKey:@"animationView"], animation);
            weakHeader = header;
            completion = header.endRefreshingCompletionBlock;
            lateConfigBlock = header.byRefreshConfigModel;
            XCTAssertNotNil(lateConfigBlock);
            XCTAssertEqual(lateConfigBlock(model), header);
            XCTAssertEqualObjects(header.stateLabel.text, model.stateIdleTitle);
        }
        XCTAssertNil(weakHeader);
        XCTAssertNotNil(completion);
        completion();
        XCTAssertNotNil(lateConfigBlock);
        XCTAssertNil(lateConfigBlock(model));
    }];
}

@end
