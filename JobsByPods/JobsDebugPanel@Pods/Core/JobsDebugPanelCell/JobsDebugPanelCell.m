//
//  JobsDebugPanelCell.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugPanelCell.h"

#if DEBUG
@implementation JobsDebugPanelCell

-(instancetype)init {
    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"JobsDebugPanelCell"];
}

@end
#endif

