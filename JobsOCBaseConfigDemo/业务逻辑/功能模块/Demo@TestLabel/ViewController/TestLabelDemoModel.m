//
//  TestLabelDemoModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "TestLabelDemoModel.h"

@implementation TestLabelDemoModel
+(instancetype)modelWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                  showingType:(UILabelShowingType)showingType
                  controlType:(TestLabelDemoControlType)controlType
                     richText:(BOOL)richText
                manualNewline:(BOOL)manualNewline{
    TestLabelDemoModel *model = TestLabelDemoModel.new;
    model.title = title;
    model.subTitle = subTitle;
    model.showingType = showingType;
    model.controlType = controlType;
    model.richText = richText;
    model.manualNewline = manualNewline;
    return model;
}

@end
