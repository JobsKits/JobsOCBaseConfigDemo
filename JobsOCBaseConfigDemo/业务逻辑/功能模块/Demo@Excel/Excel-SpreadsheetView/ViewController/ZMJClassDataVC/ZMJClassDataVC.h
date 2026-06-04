//
//  ZMJClassDataVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "TextCell.h"
#import "HeaderCell.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

typedef NS_ENUM(NSInteger, ZMJSorting) {
    ZMJAscending = 0,
    ZMJDsescending
};

static NSString * getSymbol(ZMJSorting sorting) {
    switch (sorting) {
        case ZMJAscending:
            return @"\u25B2";/// 黑色上三角形（▲）
            break;
        case ZMJDsescending:
            return @"\u25BC";/// 黑色下三角形（▼）
            break;
        default:
            break;
    }
}

typedef struct SortedColumn {
    NSInteger column;
    ZMJSorting sorting;
} SortedColumn;

NS_ASSUME_NONNULL_BEGIN

@interface ZMJClassDataVC : BaseViewController
<SpreadsheetViewDelegate, SpreadsheetViewDataSource>

@end

NS_ASSUME_NONNULL_END
