//
//  TestLabelDemoModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import <UIKit/UIKit.h>

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

typedef NS_ENUM(NSUInteger, TestLabelDemoControlType) {
    TestLabelDemoControlTypeLabel,
    TestLabelDemoControlTypeButtonTitle
};

@interface TestLabelDemoModel : NSObject

Prop_copy()NSString *title;
Prop_copy()NSString *subTitle;
Prop_copy()NSString *detailTitle;
Prop_copy()NSString *detailSubTitle;
Prop_assign()UILabelShowingType showingType;
Prop_assign()TestLabelDemoControlType controlType;
Prop_assign()BOOL richText;
Prop_assign()BOOL manualNewline;
Prop_assign()BOOL scrollLabelDemo;

-(JobsRetTestLabelDemoModelByStrBlock _Nonnull)byTitle;
-(JobsRetTestLabelDemoModelByStrBlock _Nonnull)bySubTitle;
-(JobsRetTestLabelDemoModelByStrBlock _Nonnull)byDetailTitle;
-(JobsRetTestLabelDemoModelByStrBlock _Nonnull)byDetailSubTitle;
-(JobsRetTestLabelDemoModelByShowingTypeBlock _Nonnull)byShowingType;
-(JobsRetTestLabelDemoModelByControlTypeBlock _Nonnull)byControlType;
-(JobsRetTestLabelDemoModelByBOOLBlock _Nonnull)byRichText;
-(JobsRetTestLabelDemoModelByBOOLBlock _Nonnull)byManualNewline;
-(JobsRetTestLabelDemoModelByBOOLBlock _Nonnull)byScrollLabelDemo;

+(instancetype)modelWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                  showingType:(UILabelShowingType)showingType
                  controlType:(TestLabelDemoControlType)controlType
                     richText:(BOOL)richText
                manualNewline:(BOOL)manualNewline;

@end

NS_ASSUME_NONNULL_END
