//
//  ASStackLayoutSpec+DSL.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ASStackLayoutSpec+DSL.h"

@implementation ASStackLayoutSpec (DSL)
#pragma mark —— 方向 / 间距
-(JobsRetStackLayoutSpecByDirectionBlock _Nonnull)byDirection{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (ASStackLayoutDirection dir){
        spec.byDirection(dir);
        return spec;
    };
}

-(JobsRetStackLayoutSpecBySpacingBlock _Nonnull)bySpacing{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (CGFloat spacing){
        spec.bySpacing(spacing);
        return spec;
    };
}
#pragma mark —— 语义对齐（推荐优先用这两个）
-(JobsRetStackLayoutSpecByHorizontalAlignmentBlock _Nonnull)byHorizontalAlignment{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (ASHorizontalAlignment align){
        spec.byHorizontalAlignment(align);
        return spec;
    };
}

-(JobsRetStackLayoutSpecByVerticalAlignmentBlock _Nonnull)byVerticalAlignment{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (ASVerticalAlignment align){
        spec.byVerticalAlignment(align);
        return spec;
    };
}
#pragma mark —— Flex 对齐（底层等价字段）
-(JobsRetStackLayoutSpecByJustifyContentBlock _Nonnull)byJustifyContent{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (ASStackLayoutJustifyContent jc){
        spec.byJustifyContent(jc);
        return spec;
    };
}

-(JobsRetStackLayoutSpecByAlignItemsBlock _Nonnull)byAlignItems{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (ASStackLayoutAlignItems ai){
        spec.byAlignItems(ai);
        return spec;
    };
}

-(JobsRetStackLayoutSpecByFlexWrapBlock _Nonnull)byFlexWrap{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (ASStackLayoutFlexWrap wrap){
        spec.byFlexWrap(wrap);
        return spec;
    };
}

-(JobsRetStackLayoutSpecByAlignContentBlock _Nonnull)byAlignContent{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (ASStackLayoutAlignContent ac){
        spec.byAlignContent(ac);
        return spec;
    };
}

-(JobsRetStackLayoutSpecByLineSpacingBlock _Nonnull)byLineSpacing{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (CGFloat lineSpacing){
        spec.byLineSpacing(lineSpacing);
        return spec;
    };
}
#pragma mark —— 并发布局开关
-(JobsRetStackLayoutSpecByConcurrentBlock _Nonnull)byConcurrent{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (BOOL concurrent){
        spec.byConcurrent(concurrent);
        return spec;
    };
}
#pragma mark —— children 管理
-(JobsRetStackLayoutSpecByChildrenBlock _Nonnull)byChildren{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (NSArray<id<ASLayoutElement>> *children){
        spec.byChildren(children ?: @[]);
        return spec;
    };
}

-(JobsRetStackLayoutSpecByAppendChildrenBlock _Nonnull)byAppendChildren{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (NSArray<id<ASLayoutElement>> *children){
        NSArray *old = spec.children ?: @[];
        spec.byChildren([old arrayByAddingObjectsFromArray:(children ?: @[])]);
        return spec;
    };
}

-(JobsRetStackLayoutSpecByAddChildBlock _Nonnull)byAdd{
    ASStackLayoutSpec *spec = self;
    return ^ASStackLayoutSpec* (id<ASLayoutElement> child){
        if (!child) return spec;
        NSArray *old = spec.children ?: @[];
        spec.byChildren([old arrayByAddingObject:child]);
        return spec;
    };
}

@end
