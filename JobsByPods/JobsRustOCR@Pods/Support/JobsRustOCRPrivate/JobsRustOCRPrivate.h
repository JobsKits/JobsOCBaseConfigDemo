//
//  JobsRustOCRPrivate.h
//  JobsRustOCR
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <ImageIO/ImageIO.h>
#import <TargetConditionals.h>
#include <onnxruntime_c_api.h>

#if __has_include(<JobsOCRCore/JobsOCRCore.h>)
#import <JobsOCRCore/JobsOCRCore.h>
#else
#import "JobsOCRCore.h"
#endif

#ifdef __cplusplus
#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstring>
#endif
