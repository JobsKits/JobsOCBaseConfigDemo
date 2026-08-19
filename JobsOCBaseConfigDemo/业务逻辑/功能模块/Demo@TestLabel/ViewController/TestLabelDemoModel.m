//
//  TestLabelDemoModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "TestLabelDemoModel.h"

@implementation TestLabelDemoModel
#define JOBS_TEST_LABEL_STRING_DSL(_selector_, _property_) \
-(JobsRetTestLabelDemoModelByStrBlock _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof TestLabelDemoModel *_Nullable(NSString *_Nullable data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

#define JOBS_TEST_LABEL_BOOL_DSL(_selector_, _property_) \
-(JobsRetTestLabelDemoModelByBOOLBlock _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof TestLabelDemoModel *_Nullable(BOOL data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_TEST_LABEL_STRING_DSL(byTitle, title)
JOBS_TEST_LABEL_STRING_DSL(bySubTitle, subTitle)
JOBS_TEST_LABEL_STRING_DSL(byDetailTitle, detailTitle)
JOBS_TEST_LABEL_STRING_DSL(byDetailSubTitle, detailSubTitle)
JOBS_TEST_LABEL_BOOL_DSL(byRichText, richText)
JOBS_TEST_LABEL_BOOL_DSL(byManualNewline, manualNewline)
JOBS_TEST_LABEL_BOOL_DSL(byScrollLabelDemo, scrollLabelDemo)

#undef JOBS_TEST_LABEL_STRING_DSL
#undef JOBS_TEST_LABEL_BOOL_DSL

-(JobsRetTestLabelDemoModelByShowingTypeBlock _Nonnull)byShowingType{
    @jobs_weakify(self)
    return ^__kindof TestLabelDemoModel *_Nullable(UILabelShowingType data){
        @jobs_strongify(self)
        self.showingType = data;
        return self;
    };
}

-(JobsRetTestLabelDemoModelByControlTypeBlock _Nonnull)byControlType{
    @jobs_weakify(self)
    return ^__kindof TestLabelDemoModel *_Nullable(TestLabelDemoControlType data){
        @jobs_strongify(self)
        self.controlType = data;
        return self;
    };
}

+(instancetype)modelWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                  showingType:(UILabelShowingType)showingType
                  controlType:(TestLabelDemoControlType)controlType
                     richText:(BOOL)richText
                manualNewline:(BOOL)manualNewline{
    return TestLabelDemoModel.new
        .byTitle(title)
        .bySubTitle(subTitle)
        .byShowingType(showingType)
        .byControlType(controlType)
        .byRichText(richText)
        .byManualNewline(manualNewline);
}

@end
