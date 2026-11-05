//
//  UIContextMenuInteraction+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2025年5月3日，星期六.
//

#import "UIContextMenuInteraction+Extra.h"

@implementation UIContextMenuInteraction (Extra)

+(JobsRetContextMenuInteractionByIDBlock _Nonnull)initByDelegate{
    return ^UIContextMenuInteraction *_Nonnull(id <UIContextMenuInteractionDelegate>_Nullable data){
        return [UIContextMenuInteraction.alloc initWithDelegate:data];
    };
}

@end
