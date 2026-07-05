//
//  UITableViewHeaderFooterView+Attribute.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITableViewHeaderFooterView+Attribute.h"
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
    Jobs_setAssociatedRETAIN_NONATOMIC(_section, @(section))
    [self didChangeValueForKey:NSStringFromSelector(selector)];
}

-(NSUInteger)section{
    return [Jobs_getAssociatedObject(_section) unsignedIntegerValue];
}

@end
