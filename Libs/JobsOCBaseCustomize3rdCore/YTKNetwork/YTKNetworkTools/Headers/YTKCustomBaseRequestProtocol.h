//
//  YTKCustomBaseRequestProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 31/10/2024.
//

#import <Foundation/Foundation.h>
#import "JobsDefineProperty.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YTKCustomBaseRequestProtocol <NSObject>
@optional
Prop_strong(nullable)id urlParameters;
Prop_strong(nullable)NSMutableDictionary *parameters;
Prop_strong(nullable)NSMutableDictionary *customHTTPHeader;

#pragma mark —— 加请求头参数
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters;
#pragma mark —— 加Body参数
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byBodyParameters;
#pragma mark —— 加URL参数
-(JobsRetYTKBaseRequestByIDBlock _Nonnull)byURLParameters;
#pragma mark —— 错误打印
-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)handleErr;

@end

NS_ASSUME_NONNULL_END

#ifndef YTKCustomBaseRequestProtocol_synthesize
#define YTKCustomBaseRequestProtocol_synthesize \
\
@synthesize urlParameters = _urlParameters;\
@synthesize parameters = _parameters;\
@synthesize customHTTPHeader = _customHTTPHeader;\

#endif /* YTKCustomBaseRequestProtocol_synthesize */

#ifndef YTKCustomBaseRequestProtocol_dynamic
#define YTKCustomBaseRequestProtocol_dynamic \
\
@dynamic urlParameters;\
@dynamic parameters;\
@dynamic customHTTPHeader;\

#endif /* YTKCustomBaseRequestProtocol_dynamic */
