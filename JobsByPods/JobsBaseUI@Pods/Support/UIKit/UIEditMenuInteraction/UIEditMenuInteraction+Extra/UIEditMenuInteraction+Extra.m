//
//  UIEditMenuInteraction+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIEditMenuInteraction+Extra.h"

@implementation UIEditMenuInteraction (Extra)
+(JobsRetUIEditMenuInteractionByIDBlock _Nonnull)initBy{
    return ^UIEditMenuInteraction *_Nullable(id<UIEditMenuInteractionDelegate>_Nullable data){
        return [UIEditMenuInteraction.alloc initWithDelegate:data];
    };
}

@end
