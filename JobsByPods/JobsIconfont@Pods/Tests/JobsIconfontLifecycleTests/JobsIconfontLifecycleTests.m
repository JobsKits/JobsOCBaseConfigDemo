//
//  JobsIconfontLifecycleTests.m
//  JobsIconfont
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsIconfontLifecycleTests.h"
#import <objc/runtime.h>

static char JobsIconfontViewLifetimeWitnessKey;

@interface JobsIconfontViewLifetimeWitness : NSObject
@property(nonatomic,copy)dispatch_block_t onDeallocation;
@end

@implementation JobsIconfontViewLifetimeWitness
-(void)dealloc {
    if (_onDeallocation) {
        _onDeallocation();
    }
}
@end

@interface JobsIconfontLifecycleTests () <SDImageLoader>
@property(nonatomic,strong)NSMutableArray *acceptanceLoaderCompletions;
@property(nonatomic,strong)NSMutableArray<NSBlockOperation *> *acceptanceLoaderOperations;
@property(nonatomic,strong)XCTestExpectation *acceptanceLoaderStarted;
@end

@implementation JobsIconfontLifecycleTests

-(void)testCancellationRunsOnceAndOnDeallocation {
    __block NSUInteger calls = 0;
    @autoreleasepool {
        JobsIconfontLoadToken *token = JobsIconfontLoadToken.new;
        token.byCancellation(^{ calls++; });
        [token cancel];
        token.jobsCancel();
        XCTAssertEqual(calls, 1u);
    }
    XCTAssertEqual(calls, 1u);
    @autoreleasepool {
        JobsIconfontLoadToken *token = JobsIconfontLoadToken.new;
        token.byCancellation(^{ calls++; });
    }
    XCTAssertEqual(calls, 2u);
}

-(void)testSavedCancellationBlockAfterOwnerReleaseIsSafe {
    jobsByVoidBlock action;
    __weak JobsIconfontLoadToken *weakToken;
    @autoreleasepool {
        JobsIconfontLoadToken *token = JobsIconfontLoadToken.new;
        weakToken = token;
        action = token.jobsCancel;
    }
    XCTAssertNil(weakToken);
    XCTAssertNoThrow(action());
}

-(void)testConcurrentCancellationClaimsCallbackOnce {
    __block NSUInteger calls = 0;
    JobsIconfontLoadToken *token = JobsIconfontLoadToken.new;
    token.byCancellation(^{ calls++; });
    dispatch_apply(128, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
        [token cancel];
    });
    XCTAssertEqual(calls, 1u);
}
-(BOOL)canRequestImageForURL:(NSURL *)url {
    return url != nil;
}

-(BOOL)shouldBlockFailedURLWithURL:(NSURL *)url error:(NSError *)error {
    return NO;
}

-(id<SDWebImageOperation>)requestImageWithURL:(NSURL *)url
                                    options:(SDWebImageOptions)options
                                    context:(SDWebImageContext *)context
                                   progress:(SDImageLoaderProgressBlock)progressBlock
                                  completed:(SDImageLoaderCompletedBlock)completedBlock {
    NSBlockOperation *operation = NSBlockOperation.new;
    @synchronized (self) {
        [self.acceptanceLoaderCompletions addObject:[completedBlock copy]];
        [self.acceptanceLoaderOperations addObject:operation];
    }
    [self.acceptanceLoaderStarted fulfill];
    return (id<SDWebImageOperation>)operation;
}

-(void)testActualLoaderReplacementCancellationAndLateCompletionsKeepCurrentImage {
    SDWebImageManager *sdkManager = SDWebImageManager.sharedManager;
    id<SDWebImageOptionsProcessor> previousProcessor = sdkManager.optionsProcessor;
    self.acceptanceLoaderCompletions = NSMutableArray.new;
    self.acceptanceLoaderOperations = NSMutableArray.new;
    sdkManager.optionsProcessor = [SDWebImageOptionsProcessor optionsProcessorWithBlock:^SDWebImageOptionsResult *(NSURL *url, SDWebImageOptions options, SDWebImageContext *context) {
        NSMutableDictionary *modified = [context mutableCopy] ?: NSMutableDictionary.new;
        modified[SDWebImageContextImageLoader] = self;
        modified[SDWebImageContextStoreCacheType] = @(SDImageCacheTypeNone);
        return [[SDWebImageOptionsResult alloc] initWithOptions:options | SDWebImageFromLoaderOnly | SDWebImageAvoidDecodeImage context:modified];
    }];
    void (^onMain)(dispatch_block_t) = ^(dispatch_block_t action) {
        dispatch_block_t pooledAction = ^{
            @autoreleasepool {
                action();
            }
        };
        if (NSThread.isMainThread) {
            pooledAction();
        }else {
            dispatch_sync(dispatch_get_main_queue(), pooledAction);
        }
    };
    __block UIImageView *view = nil;
    __block __weak UIImageView *weakView;
    __block JobsIconfontLoadToken *firstToken = nil;
    __block JobsIconfontLoadToken *secondToken = nil;
    __block NSUInteger firstTerminal = 0;
    __block NSUInteger secondTerminal = 0;
    XCTestExpectation *currentFinished = [self expectationWithDescription:@"Actual SDK current load completed"];
    XCTestExpectation *viewReleased = [self expectationWithDescription:@"Actual image view deallocated after SDK callbacks"];
    @try {
        // DSL returns and SDK callbacks may keep the view autoreleased until their pool drains.
        @autoreleasepool {
            self.acceptanceLoaderStarted = [self expectationWithDescription:@"First actual SDK loader request"];
            onMain(^{
                view = UIImageView.new;
                weakView = view;
                JobsIconfontViewLifetimeWitness *witness = JobsIconfontViewLifetimeWitness.new;
                witness.onDeallocation = ^{
                    [viewReleased fulfill];
                };
                objc_setAssociatedObject(view, &JobsIconfontViewLifetimeWitnessKey,
                                         witness, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                JobsIconfontManager.shared.cancelLoadInImageView(view);
                firstToken = [JobsIconfontManager.shared loadAsset:JobsIconfontRemoteAssetLogo
                                                   intoImageView:view targetSize:CGSizeMake(24, 24) forceRefresh:NO
                                                       completion:^(JobsIconfontLoadResult *result) {
                    if (result.stage != JobsIconfontLoadStagePlaceholder) {
                        firstTerminal++;
                    }
                }];
                XCTAssertNotNil(view.image);
            });
            [self waitForExpectations:@[self.acceptanceLoaderStarted] timeout:5];
            self.acceptanceLoaderStarted = [self expectationWithDescription:@"Replacement actual SDK loader request"];
            onMain(^{
                secondToken = [JobsIconfontManager.shared loadAsset:JobsIconfontRemoteAssetLogo
                                                    intoImageView:view targetSize:CGSizeMake(24, 24) forceRefresh:NO
                                                        completion:^(JobsIconfontLoadResult *result) {
                    if (result.stage != JobsIconfontLoadStagePlaceholder) {
                        secondTerminal++;
                        XCTAssertEqual(result.stage, JobsIconfontLoadStageSuccess);
                        XCTAssertNil(result.error);
                        [currentFinished fulfill];
                    }
                }];
            });
            [self waitForExpectations:@[self.acceptanceLoaderStarted] timeout:5];
            XCTAssertEqual(self.acceptanceLoaderCompletions.count, 2u);
            XCTAssertTrue(self.acceptanceLoaderOperations[0].isCancelled);
            onMain(^{
                [firstToken cancel];
                XCTAssertFalse(self.acceptanceLoaderOperations[1].isCancelled);
                UIImage *currentImage = [JobsIconfontManager.shared iconImageForGlyph:JobsIconfontGlyphVerified
                                                                                size:CGSizeMake(24, 24) color:UIColor.greenColor];
                SDImageLoaderCompletedBlock current = self.acceptanceLoaderCompletions[1];
                current(currentImage, nil, nil, YES);
            });
            [self waitForExpectations:@[currentFinished] timeout:5];
            onMain(^{
                UIImage *currentImage = view.image;
                SDImageLoaderCompletedBlock stale = self.acceptanceLoaderCompletions[0];
                UIImage *oldImage = [JobsIconfontManager.shared iconImageForGlyph:JobsIconfontGlyphPicture
                                                                            size:CGSizeMake(24, 24) color:UIColor.redColor];
                stale(oldImage, nil, nil, YES);
                XCTAssertEqual(view.image, currentImage);
                XCTAssertEqual(firstTerminal, 0u);
                XCTAssertEqual(secondTerminal, 1u);
                JobsIconfontManager.shared.cancelLoadInImageView(view);
                JobsIconfontManager.shared.cancelLoadInImageView(view);
            });
            onMain(^{
                view = nil;
                firstToken = nil;
                secondToken = nil;
            });
        }
        [self waitForExpectations:@[viewReleased] timeout:5];
        XCTAssertNil(weakView);
        onMain(^{
            SDImageLoaderCompletedBlock stale = self.acceptanceLoaderCompletions[0];
            stale(UIImage.new, nil, nil, YES);
        });
        XCTAssertEqual(firstTerminal, 0u);
        XCTAssertEqual(secondTerminal, 1u);
    } @finally {
        onMain(^{
            if (view) {
                JobsIconfontManager.shared.cancelLoadInImageView(view);
            }
            sdkManager.optionsProcessor = previousProcessor;
        });
        self.acceptanceLoaderStarted = nil;
        self.acceptanceLoaderCompletions = nil;
        self.acceptanceLoaderOperations = nil;
    }
}
@end
