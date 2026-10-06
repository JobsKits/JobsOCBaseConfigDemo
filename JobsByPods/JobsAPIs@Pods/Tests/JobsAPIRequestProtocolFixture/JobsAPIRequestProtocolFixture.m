//
//  JobsAPIRequestProtocolFixture.m
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAPIRequestProtocolFixture.h"

static void (^JobsAPIRequestObserver)(NSURLRequest *, NSData *);
static void (^JobsAPIStopObserver)(NSURLRequest *);

@implementation JobsAPIRequestProtocolFixture

+(void)setRequestObserver:(void (^)(NSURLRequest *, NSData *))observer{
    @synchronized (self) {
        JobsAPIRequestObserver = [observer copy];
    }
}

+(void)setStopObserver:(void (^)(NSURLRequest *))observer{
    @synchronized (self) {
        JobsAPIStopObserver = [observer copy];
    }
}

+(BOOL)canInitWithRequest:(NSURLRequest *)request{
    return [request.URL.host isEqualToString:@"jobs-stability.invalid"];
}

+(NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request{
    return request;
}

-(void)startLoading{
    NSMutableData *body = [NSMutableData dataWithData:self.request.HTTPBody ?: NSData.data];
    NSInputStream *stream = self.request.HTTPBodyStream;
    if (stream) {
        [stream open];
        uint8_t buffer[1024];
        NSInteger count;
        while ((count = [stream read:buffer maxLength:sizeof(buffer)]) > 0) {
            [body appendBytes:buffer length:(NSUInteger)count];
        }
        NSError *error = stream.streamError;
        [stream close];
        if (count < 0 || error) {
            [self.client URLProtocol:self didFailWithError:error ?: [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorCannotDecodeContentData userInfo:nil]];
            return;
        }
    }
    void (^observer)(NSURLRequest *, NSData *);
    @synchronized (self.class) {
        observer = [JobsAPIRequestObserver copy];
    }
    if (observer) {
        observer(self.request, body);
    }
    if ([self.request.URL.path isEqualToString:@"/hold"]) {
        return;
    }
    if ([self.request.URL.path isEqualToString:@"/error"]) {
        [self.client URLProtocol:self didFailWithError:[NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorTimedOut userInfo:nil]];
        return;
    }
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:self.request.URL statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:@{@"Content-Type": @"application/json"}];
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [self.client URLProtocol:self didLoadData:[@"{\"imageId\":\"fixture-image\"}" dataUsingEncoding:NSUTF8StringEncoding]];
    [self.client URLProtocolDidFinishLoading:self];
}

-(void)stopLoading{
    void (^observer)(NSURLRequest *);
    @synchronized (self.class) {
        observer = [JobsAPIStopObserver copy];
    }
    if (observer) {
        observer(self.request);
    }
}

@end
