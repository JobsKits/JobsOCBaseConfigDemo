//
//  NSObject+TFPopupMethodExchange.h
//  TFPopup
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (TFPopupMethodExchange)
/// 交换类方法和交换实例方法
+(BOOL)popup_instanceMethodExchange:(SEL)originSel toClass:(Class)toClass toSel:(SEL)toSel;
+(BOOL)popup_classMethodExchange:(SEL)originSel toClass:(Class)toClass toSel:(SEL)toSel;

@end

