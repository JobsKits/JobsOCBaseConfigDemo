//
//  UIView+JHGestureBlock.m
//  JobsOCBaseConfigDemo
//
//  Created by HaoCold on 2019/4/9.
//  Copyright © 2019 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2019 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "UIView+JHGestureBlock.h"
#import "MacroDef_Sys.h"

@interface UIView (JHGestureBlock)

Prop_strong()NSMutableDictionary *jhGestureBlockMutDic;

@end

@implementation UIView (JHGestureBlock)
#pragma mark —— Prop_strong()NSMutableDictionary *jhGestureBlockMutDic;
JobsKey(_jhGestureBlockMutDic)
@dynamic jhGestureBlockMutDic;
- (__kindof UIGestureRecognizer *)addGestureRecognizer:(JHGestureType)type block:(JHGestureBlock)block{
    if (block) {
        NSDictionary *dic = @{@"0":@"UITapGestureRecognizer",
                              @"1":@"UILongPressGestureRecognizer",
                              @"2":@"UISwipeGestureRecognizer",
                              @"3":@"UIPanGestureRecognizer",
                              @"4":@"UIRotationGestureRecognizer",
                              @"5":@"UIPinchGestureRecognizer"};
        
        NSString *string = dic[@(type).stringValue];
        UIGestureRecognizer *gesture = [NSClassFromString(string).alloc initWithTarget:self action:@selector(gestureAction:)];
        [self addGestureRecognizer:gesture];
        
        NSMutableDictionary *blockDic = Jobs_getAssociatedObject(_jhGestureBlockMutDic);
        if (!blockDic) {
            blockDic = @{}.mutableCopy;
            Jobs_setAssociatedRETAIN_NONATOMIC(_jhGestureBlockMutDic, blockDic)
        }
        [blockDic setObject:block forKey:string];
    
        return gesture;
    };return nil;
}

- (void)gestureAction:(UIGestureRecognizer *)gesture{
    NSMutableDictionary *blockDic = Jobs_getAssociatedObjectByTargetRawKey(gesture.view, &_jhGestureBlockMutDic);
    JHGestureBlock block = blockDic[NSStringFromClass(gesture.class)];
    if (block) block(gesture.view, gesture);
}

@end
