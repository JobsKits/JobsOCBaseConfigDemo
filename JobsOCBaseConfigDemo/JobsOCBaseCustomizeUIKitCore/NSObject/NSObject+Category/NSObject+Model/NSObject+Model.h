//
//  NSObject+Model.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#ifndef NSObject_Model_h
#define NSObject_Model_h

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "JobsUserModel.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Model)

Prop_strong(nullable)JobsUserModel *doorModel;

@end

NS_ASSUME_NONNULL_END

#endif /* NSObject_Model_h */
