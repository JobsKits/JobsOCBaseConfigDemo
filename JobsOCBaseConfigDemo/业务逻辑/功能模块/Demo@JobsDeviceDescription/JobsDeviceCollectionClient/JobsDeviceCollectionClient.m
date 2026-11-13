//
//  JobsDeviceCollectionClient.m
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年11月6日，星期五.
//

#import "JobsDeviceCollectionClient.h"

static NSString *const JobsDeviceCollectionOrigin = @"https://jobs-device-info-pages.pages.dev";

@interface JobsDeviceCollectionClient ()

@property(nonatomic, strong) NSURLSession *transport;
@property(nonatomic, strong) NSURLSessionDataTask *task;
@property(nonatomic, strong) NSDictionary *storedSession;
@property(nonatomic, strong) NSURL *storedBrowserURL;
@property(nonatomic, strong) NSDate *expiresAt;
@property(nonatomic) NSUInteger generation;
@property(nonatomic) BOOL clearing;
@property(nonatomic, strong) NSURL *baseURL;

@end

@implementation JobsDeviceCollectionClient

-(instancetype)init {
    self = [super init];
    if (self) {
        id configuredURL = [NSBundle.mainBundle objectForInfoDictionaryKey:@"JobsDeviceInfoBaseURL"];
        NSURLComponents *components = [configuredURL isKindOfClass:NSString.class] ? [NSURLComponents componentsWithString:configuredURL] : nil;
        BOOL safe = [components.scheme.lowercaseString isEqual:@"https"] && components.host.length && !components.user.length && !components.password.length && !components.query.length && !components.fragment.length && (!components.path.length || [components.path isEqual:@"/"]);
        _baseURL = [NSURL URLWithString:safe ? [NSString stringWithFormat:@"https://%@%@", components.host, components.port ? [@":" stringByAppendingString:components.port.stringValue] : @""] : JobsDeviceCollectionOrigin];
        id configuredTimeout = [NSBundle.mainBundle objectForInfoDictionaryKey:@"JobsDeviceInfoRequestTimeout"];
        double timeout = [configuredTimeout respondsToSelector:@selector(doubleValue)] ? [configuredTimeout doubleValue] : 6;
        _requestTimeout = isfinite(timeout) && timeout > 0 ? MIN(30, timeout) : 6;

    }
    return self;
}

-(void)dealloc {
    [_task cancel];
    [_transport invalidateAndCancel];
}

-(NSURLSession *)transport {
    if (!_transport) {
        // 采集凭据不能混入业务网络的全局 Cookie、缓存、凭据存储与日志链路。
        NSURLSessionConfiguration *configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration;
        configuration.URLCache = nil;
        configuration.URLCredentialStorage = nil;
        configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        _transport = [NSURLSession sessionWithConfiguration:configuration];
    }
    return _transport;
}

-(NSDictionary *)session {
    return self.expiresAt.timeIntervalSinceNow > 0 ? self.storedSession : nil;
}

-(NSURL *)browserURL {
    return self.expiresAt.timeIntervalSinceNow > 0 ? self.storedBrowserURL : nil;
}

-(BOOL)loading {
    return self.task != nil;
}

-(NSURL *)siteURL {
    return self.baseURL;
}

-(dispatch_block_t _Nonnull)cancelPendingRequest {
    __weak typeof(self) weakSelf = self;
    return ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) {
            return;
        }
        self.generation++;
        [self.task cancel];
        self.task = nil;
        if (self.clearing) {
            [self.transport invalidateAndCancel];
            self.transport = nil;
            self.clearing = NO;
        }
    };
}

-(void)requestCreatingPair:(BOOL)create
               completion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completion {
    if (self.loading) {
        return;
    }
    NSUInteger generation = ++self.generation;
    NSURL *url = [NSURL URLWithString:[self.baseURL.absoluteString stringByAppendingString:create ? @"/api/pair" : @"/api/session"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = create ? @"POST" : @"GET";
    request.timeoutInterval = (isfinite(self.requestTimeout) && self.requestTimeout > 0 ? MIN(30, self.requestTimeout) : 6);
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (create) {
        [request setValue:self.baseURL.absoluteString forHTTPHeaderField:@"Origin"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        request.HTTPBody = [@"{}" dataUsingEncoding:NSUTF8StringEncoding];
    }
    __weak typeof(self) weakSelf = self;
    self.task = [self.transport dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) self = weakSelf;
            if (!self || self.generation != generation) {
                return;
            }
            self.task = nil;
            NSInteger status = [response isKindOfClass:NSHTTPURLResponse.class] ? ((NSHTTPURLResponse *)response).statusCode : 0;
            NSDictionary *object = data.length && data.length < 262144 ? [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL] : nil;
            BOOL sameOrigin = [response.URL.scheme.lowercaseString isEqual:self.baseURL.scheme] && [response.URL.host.lowercaseString isEqual:self.baseURL.host.lowercaseString] && [response.URL.port ?: @443 isEqual:self.baseURL.port ?: @443];
            BOOL valid = sameOrigin && [object isKindOfClass:NSDictionary.class] && [object[@"ok"] isEqual:@YES] && status >= 200 && status < 300;
            id session = valid ? object[@"session"] : nil;
            if (!error && valid && session == NSNull.null && !create) {
                self.storedSession = nil;
                self.storedBrowserURL = nil;
                self.expiresAt = nil;
                completion(nil, nil);
                return;
            }
            NSISO8601DateFormatter *formatter = NSISO8601DateFormatter.new;
            formatter.formatOptions = NSISO8601DateFormatWithInternetDateTime | NSISO8601DateFormatWithFractionalSeconds;
            NSString *expiry = [session isKindOfClass:NSDictionary.class] ? session[@"expiresAt"] : nil;
            NSDate *expiresAt = [expiry isKindOfClass:NSString.class] ? [formatter dateFromString:expiry] : nil;
            if (!expiresAt && [expiry isKindOfClass:NSString.class]) {
                formatter.formatOptions = NSISO8601DateFormatWithInternetDateTime;
                expiresAt = [formatter dateFromString:expiry];
            }
            NSString *state = [session isKindOfClass:NSDictionary.class] ? session[@"state"] : nil;
            BOOL validSession = expiresAt && expiresAt.timeIntervalSinceNow > 0 && ([@"waiting" isEqual:state] || [@"received" isEqual:state]);
            if ([@"received" isEqual:state]) {
                validSession = validSession && [session[@"device"] isKindOfClass:NSDictionary.class] && ([@"signature-only" isEqual:session[@"verification"]] || [@"browser-reported" isEqual:session[@"verification"]]);
            }
            NSString *token = [object isKindOfClass:NSDictionary.class] ? object[@"pairToken"] : nil;
            BOOL validToken = [token isKindOfClass:NSString.class] && [token rangeOfString:@"^[0-9a-f]{64}$" options:NSRegularExpressionSearch].location != NSNotFound;
            if (error || !valid || !validSession || (create && !validToken)) {
                completion(self.session, [NSError errorWithDomain:@"JobsDeviceCollection" code:status == 429 ? 429 : 1 userInfo:nil]);
                return;
            }
            self.storedSession = session;
            self.expiresAt = expiresAt;
            if (create) {
                self.storedBrowserURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/#pair=%@", self.baseURL.absoluteString, token]];
            }
            completion(self.session, nil);
        });
    }];
    [self.task resume];
}

-(void)clearRemotely:(BOOL)remote
         completion:(void (^)(BOOL))completion {
    self.cancelPendingRequest();
    self.storedSession = nil;
    self.storedBrowserURL = nil;
    self.expiresAt = nil;
    if (!remote) {
        [self.transport invalidateAndCancel];
        self.transport = nil;
        completion(YES);
        return;
    }
    self.clearing = YES;
    NSUInteger generation = ++self.generation;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[self.baseURL.absoluteString stringByAppendingString:@"/api/session"]]];
    request.HTTPMethod = @"DELETE";
    request.timeoutInterval = (isfinite(self.requestTimeout) && self.requestTimeout > 0 ? MIN(30, self.requestTimeout) : 6);
    [request setValue:self.baseURL.absoluteString forHTTPHeaderField:@"Origin"];
    __weak typeof(self) weakSelf = self;
    self.task = [self.transport dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) self = weakSelf;
            if (!self || self.generation != generation) {
                return;
            }
            self.task = nil;
            NSInteger status = [response isKindOfClass:NSHTTPURLResponse.class] ? ((NSHTTPURLResponse *)response).statusCode : 0;
            NSDictionary *object = data.length && data.length < 262144 ? [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL] : nil;
            BOOL valid = [object isKindOfClass:NSDictionary.class] && [object[@"ok"] isEqual:@YES] && object[@"session"] == NSNull.null;
            [self.transport invalidateAndCancel];
            self.transport = nil;
            self.clearing = NO;
            completion(!error && valid && status >= 200 && status < 300);
        });
    }];
    [self.task resume];
}

@end
