//
//  JobsAPIsStabilityTests.m
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAPIsStabilityTests.h"
#import "JobsAPIRequestConstraintFixture.h"
#import "JobsAPIUploadConstraintFixture.h"
#import "JobsAPIRequestProtocolFixture.h"

// 仅声明锁定 YTK 3.0.6 已有测试入口；不替换其请求构建或结果处理实现。
@interface YTKNetworkAgent (JobsAPIsProtocolStabilityAccess)
-(AFHTTPSessionManager *)manager;
-(void)resetURLSessionManagerWithConfiguration:(NSURLSessionConfiguration *)configuration;
@end

@interface JobsAPIsStabilityTests ()
@property(nonatomic, strong) AFHTTPSessionManager *previousManager;
@end

@implementation JobsAPIsStabilityTests

-(void)setUp{
    [super setUp];
    YTKNetworkAgent *agent = YTKNetworkAgent.sharedAgent;
    self.previousManager = [agent manager];
    NSURLSessionConfiguration *configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration;
    configuration.protocolClasses = @[JobsAPIRequestProtocolFixture.class];
    [agent resetURLSessionManagerWithConfiguration:configuration];
    [agent manager].responseSerializer = [AFHTTPResponseSerializer serializer];
}

-(void)tearDown{
    YTKNetworkAgent *agent = YTKNetworkAgent.sharedAgent;
    [agent cancelAllRequests];
    [[agent manager] invalidateSessionCancelingTasks:YES resetSession:NO];
    // 恢复真实共享 agent 的原 manager，测试不污染后续调用。
    [agent setValue:self.previousManager forKey:@"manager"];
    self.previousManager = nil;
    [JobsAPIRequestProtocolFixture setRequestObserver:nil];
    [JobsAPIRequestProtocolFixture setStopObserver:nil];
    [super tearDown];
}

-(void)testUploadUsesMultipartCapableStandardPath{
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize:CGSizeMake(2, 2)];
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext *context) {
        [UIColor.redColor setFill];
        [context fillRect:CGRectMake(0, 0, 2, 2)];
    }];
    UploadImageApi *api = [UploadImageApi new];
    api.byImage(image);
    XCTAssertNil([api buildCustomUrlRequest]);
    XCTAssertEqual([api requestMethod], YTKRequestMethodPOST);
    XCTAssertEqual([api requestSerializerType], YTKRequestSerializerTypeJSON);
    XCTAssertEqual([api cacheTimeInSeconds], -1);
    AFConstructingBlock body = [api constructingBodyBlock];
    XCTAssertNotNil(body);
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer]
        multipartFormRequestWithMethod:@"POST"
                             URLString:@"https://fixture.invalid/upload"
                            parameters:@{@"fixture":@"value"}
             constructingBodyWithBlock:body
                                 error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([[request valueForHTTPHeaderField:@"Content-Type"] hasPrefix:@"multipart/form-data; boundary="]);
    XCTAssertNotNil(request.HTTPBodyStream);
    NSInputStream *stream = request.HTTPBodyStream;
    [stream open];
    NSMutableData *data = [NSMutableData data];
    uint8_t buffer[1024];
    NSInteger count;
    while ((count = [stream read:buffer maxLength:sizeof(buffer)]) > 0) {
        [data appendBytes:buffer length:(NSUInteger)count];
    }
    [stream close];
    XCTAssertGreaterThan(data.length, UIImageJPEGRepresentation(image, 0.9).length);
    NSString *payload = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
    XCTAssertTrue([payload containsString:@"name=\"image\"; filename=\"image\""]);
    XCTAssertTrue([payload containsString:@"Content-Type: image/jpeg"]);
}

-(void)testActualStandardGETEncodesParametersAndPreservesRequestConstraints{
    JobsAPIRequestConstraintFixture *api = [JobsAPIRequestConstraintFixture new];
    XCTestExpectation *finished = [self expectationWithDescription:@"actual YTK GET response"];
    __block NSURLRequest *captured = nil;
    __block NSData *capturedBody = nil;
    [JobsAPIRequestProtocolFixture setRequestObserver:^(NSURLRequest *request, NSData *body) {
        captured = request;
        capturedBody = body;
    }];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        [finished fulfill];
    } failure:^(YTKBaseRequest *request) {
        XCTFail(@"GET failed: %@", request.error);
        [finished fulfill];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[finished] timeout:5], XCTWaiterResultCompleted);
    XCTAssertNotNil(captured);
    XCTAssertEqualObjects(captured.HTTPMethod, @"GET");
    XCTAssertEqual(capturedBody.length, 0);
    XCTAssertEqualWithAccuracy(api.requestTask.originalRequest.timeoutInterval, 7.25, 0.001);
    XCTAssertFalse(api.requestTask.originalRequest.allowsCellularAccess);
    XCTAssertEqualWithAccuracy(captured.timeoutInterval, 7.25, 0.001);
    XCTAssertFalse(captured.allowsCellularAccess);
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    for (NSURLQueryItem *item in [NSURLComponents componentsWithURL:captured.URL resolvingAgainstBaseURL:NO].queryItems) {
        query[item.name] = item.value;
    }
    XCTAssertEqualObjects(query[@"unicode"], @"空 格&+");
    XCTAssertEqualObjects(query[@"integer"], @"42");
}

-(void)testActualRawHelperCarriesTimeoutAndDisallowsCellular{
    JobsAPIRequestConstraintFixture *api = [JobsAPIRequestConstraintFixture new];
    api.usesRawRequest = YES;
    NSURLRequest *request = [api buildCustomUrlRequest];
    XCTAssertNotNil(request);
    XCTAssertEqualObjects(request.URL.absoluteString, @"https://jobs-stability.invalid/get");
    XCTAssertEqualWithAccuracy(request.timeoutInterval, 7.25, 0.001);
    XCTAssertFalse(request.allowsCellularAccess);
}

-(void)testActualAgentUploadContainsJPEGPartAndParameters{
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize:CGSizeMake(2, 2)];
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext *context) {
        [UIColor.redColor setFill];
        [context fillRect:CGRectMake(0, 0, 2, 2)];
    }];
    JobsAPIUploadConstraintFixture *api = [JobsAPIUploadConstraintFixture new];
    api.byImage(image);
    api.parameters = [@{@"fixture": @"value"} mutableCopy];
    XCTestExpectation *finished = [self expectationWithDescription:@"actual YTK multipart response"];
    __block NSURLRequest *captured = nil;
    __block NSData *body = nil;
    [JobsAPIRequestProtocolFixture setRequestObserver:^(NSURLRequest *request, NSData *data) {
        captured = request;
        body = data;
    }];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        [finished fulfill];
    } failure:^(YTKBaseRequest *request) {
        XCTFail(@"upload failed: %@", request.error);
        [finished fulfill];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[finished] timeout:5], XCTWaiterResultCompleted);
    XCTAssertNotNil(captured);
    XCTAssertEqualObjects(captured.HTTPMethod, @"POST");
    XCTAssertTrue([[captured valueForHTTPHeaderField:@"Content-Type"] hasPrefix:@"multipart/form-data; boundary="]);
    XCTAssertFalse(api.requestTask.originalRequest.allowsCellularAccess);
    XCTAssertEqualWithAccuracy(api.requestTask.originalRequest.timeoutInterval, 7.25, 0.001);
    NSData *jpeg = UIImageJPEGRepresentation(image, 0.9);
    XCTAssertNotNil(jpeg);
    XCTAssertNotEqual([body rangeOfData:jpeg options:0 range:NSMakeRange(0, body.length)].location, NSNotFound);
    NSString *payload = [[NSString alloc] initWithData:body encoding:NSISOLatin1StringEncoding];
    XCTAssertTrue([payload containsString:@"name=\"fixture\"\r\n\r\nvalue"]);
    XCTAssertTrue([payload containsString:@"name=\"image\"; filename=\"image\""]);
    XCTAssertTrue([payload containsString:@"Content-Type: image/jpeg"]);
}

-(void)testActualAgentPropagatesErrorAndCancellationStopsProtocol{
    JobsAPIRequestConstraintFixture *failed = [JobsAPIRequestConstraintFixture new];
    failed.fixturePath = @"/error";
    XCTestExpectation *failure = [self expectationWithDescription:@"actual YTK error callback"];
    __block NSUInteger failureCalls = 0;
    [failed startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        XCTFail(@"transport error must not succeed");
        [failure fulfill];
    } failure:^(YTKBaseRequest *request) {
        failureCalls += 1;
        XCTAssertEqualObjects(request.error.domain, NSURLErrorDomain);
        XCTAssertEqual(request.error.code, NSURLErrorTimedOut);
        [failure fulfill];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[failure] timeout:5], XCTWaiterResultCompleted);
    XCTAssertEqual(failureCalls, 1);
    JobsAPIRequestConstraintFixture *cancelled = [JobsAPIRequestConstraintFixture new];
    cancelled.fixturePath = @"/hold";
    XCTestExpectation *entered = [self expectationWithDescription:@"protocol entered before cancellation"];
    XCTestExpectation *stopped = [self expectationWithDescription:@"native task cancelled protocol"];
    [JobsAPIRequestProtocolFixture setRequestObserver:^(NSURLRequest *request, NSData *body) {
        [entered fulfill];
    }];
    [JobsAPIRequestProtocolFixture setStopObserver:^(NSURLRequest *request) {
        if ([request.URL.path isEqualToString:@"/hold"]) {
            [stopped fulfill];
        }
    }];
    __block NSUInteger cancelCallbacks = 0;
    [cancelled startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        cancelCallbacks += 1;
    } failure:^(YTKBaseRequest *request) {
        cancelCallbacks += 1;
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[entered] timeout:5], XCTWaiterResultCompleted);
    NSURLSessionTask *task = cancelled.requestTask;
    [cancelled stop];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[stopped] timeout:5], XCTWaiterResultCompleted);
    XCTAssertTrue(task.state == NSURLSessionTaskStateCanceling || task.state == NSURLSessionTaskStateCompleted);
    XCTAssertNil(cancelled.successCompletionBlock);
    XCTAssertNil(cancelled.failureCompletionBlock);
    XCTAssertEqual(cancelCallbacks, 0);
}

@end
