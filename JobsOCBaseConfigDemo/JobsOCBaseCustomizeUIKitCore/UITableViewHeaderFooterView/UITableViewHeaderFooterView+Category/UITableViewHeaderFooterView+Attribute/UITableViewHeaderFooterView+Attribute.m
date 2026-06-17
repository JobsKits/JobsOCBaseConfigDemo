//
//  UITableViewHeaderFooterView+Attribute.m
//  JobsOCBaseConfigDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import "UITableViewHeaderFooterView+Attribute.h"
#import "MacroDef_Sys.h"
/// 资料来源：https://github.com/Zydhjx/HeaderDemo
/// 在基类覆写- (void)setFrame:(CGRect)frame方法。比如基类：BaseTableViewHeaderFooterView

@implementation UITableViewHeaderFooterView (Attribute)
#pragma mark —— Prop_weak()UITableView *tbv;
JobsKey(_tbv)
@dynamic tbv;
-(void)setTbv:(UITableView *)tbv{
    SEL selector = @selector(tbv);
    [self willChangeValueForKey:NSStringFromSelector(selector)];
    Jobs_setAssociatedASSIGN(_tbv, tbv)
    [self didChangeValueForKey:NSStringFromSelector(selector)];
}

-(UITableView *)tbv{
    return Jobs_getAssociatedObject(_tbv);
}
#pragma mark —— Prop_assign()NSUInteger section;
JobsKey(_section)
@dynamic section;
-(void)setSection:(NSUInteger)section{
    SEL selector = @selector(section);
    [self willChangeValueForKey:NSStringFromSelector(selector)];
    Jobs_setAssociatedASSIGN(_section, @(section))
    [self didChangeValueForKey:NSStringFromSelector(selector)];
}

-(NSUInteger)section{
    return [Jobs_getAssociatedObject(_section) unsignedIntegerValue];
}

@end
