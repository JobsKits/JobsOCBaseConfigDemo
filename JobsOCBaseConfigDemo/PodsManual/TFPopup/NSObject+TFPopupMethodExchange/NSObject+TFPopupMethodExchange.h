//
//  NSObject+TFPopupMethodExchange.h
//  JobsOCBaseConfigDemo
//
//  Created by zhutaofeng on 2019/8/15.
//  Copyright © 2019 ztf. All rights reserved.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

@interface NSObject (TFPopupMethodExchange)
/**
 *  交换类方法和交换实例方法
 */
+(BOOL)popup_instanceMethodExchange:(SEL)originSel toClass:(Class)toClass  toSel:(SEL)toSel;

+(BOOL)popup_classMethodExchange:(SEL)originSel toClass:(Class)toClass  toSel:(SEL)toSel;

@end

