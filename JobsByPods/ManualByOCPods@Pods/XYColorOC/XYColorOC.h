//
//  XYColorOC.h
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

//! Project version number for XYColorOC.
FOUNDATION_EXPORT double XYColorOCVersionNumber;

//! Project version string for XYColorOC.
FOUNDATION_EXPORT const unsigned char XYColorOCVersionString[];

#if __has_include(<XYColorOC/UIColor+XYColorOC.h>)
#import <XYColorOC/UIColor+XYColorOC.h>
#elif __has_include("UIColor+XYColorOC.h")
#import "UIColor+XYColorOC.h"
#else
#import "Support/UIKit/UIColor/UIColor+XYColorOC/UIColor+XYColorOC.h"
#endif

#if __has_include(<XYColorOC/UIView+XYColorOC.h>)
#import <XYColorOC/UIView+XYColorOC.h>
#elif __has_include("UIView+XYColorOC.h")
#import "UIView+XYColorOC.h"
#else
#import "Support/UIKit/UIView/UIView+XYColorOC/UIView+XYColorOC.h"
#endif

#if __has_include(<XYColorOC/CALayer+XYColorOC.h>)
#import <XYColorOC/CALayer+XYColorOC.h>
#elif __has_include("CALayer+XYColorOC.h")
#import "CALayer+XYColorOC.h"
#else
#import "Support/UIKit/CALayer/CALayer+XYColorOC/CALayer+XYColorOC.h"
#endif
