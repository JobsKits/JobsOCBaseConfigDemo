//
//  UIContextMenuInteraction+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIContextMenuInteraction+Extra.h"

@implementation UIContextMenuInteraction (Extra)

+(JobsRetContextMenuInteractionByIDBlock _Nonnull)initByDelegate{
    return ^UIContextMenuInteraction *_Nonnull(id <UIContextMenuInteractionDelegate>_Nullable data){
        return [UIContextMenuInteraction.alloc initWithDelegate:data];
    };
}

@end
