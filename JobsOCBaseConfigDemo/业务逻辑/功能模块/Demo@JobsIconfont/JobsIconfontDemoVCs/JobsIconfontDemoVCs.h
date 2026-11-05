//
//  JobsIconfontDemoVCs.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsIconfont/JobsIconfont.h>)
#import <JobsIconfont/JobsIconfont.h>
#else
#import "JobsIconfont.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface JobsIconfontDemoBaseVC : BaseViewController

-(JobsRetStrByVoidBlock _Nonnull)demoTitle;

@end

@interface JobsIconfontDemoListVC : JobsIconfontDemoBaseVC
<UITableViewDataSource,UITableViewDelegate>

@end

@interface JobsIconfontRemoteImageDemoVC : JobsIconfontDemoBaseVC

@end

@interface JobsIconfontReuseListDemoVC : JobsIconfontDemoBaseVC
<UITableViewDataSource,UITableViewDelegate>

@end

@interface JobsIconfontCacheDemoVC : JobsIconfontDemoBaseVC

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsIconfontCacheDemoVC
-(JobsRetJobsIconfontCacheDemoVCByBOOLBlock _Nonnull)byAutomaticSecondLoadPending;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsIconfontCacheDemoVC
@end

@interface JobsIconfontGlyphDemoVC : JobsIconfontDemoBaseVC
<UITableViewDataSource,UITableViewDelegate>

@end

@interface JobsIconfontTextFontDemoVC : JobsIconfontDemoBaseVC

@end

NS_ASSUME_NONNULL_END
