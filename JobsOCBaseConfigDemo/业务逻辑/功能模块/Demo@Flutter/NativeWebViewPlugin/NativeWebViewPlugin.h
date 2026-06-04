//
//  NativeWebViewPlugin.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 15/7/25.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

#if __has_include(<Flutter/Flutter.h>)
#import <Flutter/Flutter.h>
#else
#import "Flutter.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NativeWebViewPlugin : NSObject<FlutterPlugin>

@end

NS_ASSUME_NONNULL_END
