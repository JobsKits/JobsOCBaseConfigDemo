//
//  FindCodeFlowChartView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FindCodeFlowChartView.h"

@interface FlowChartSingleElementView ()

@end

@implementation FlowChartSingleElementView

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.bacKIMGV.byAlpha(1);

    self.titleLab.byAlpha(1);

    self.subTitleLab.byAlpha(1);

}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightHeavySize(JobsWidth(20)))
            .bySizeToFit()
            .addOn(self.bacKIMGV)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.bacKIMGV);
                make.bottom.equalTo(self.bacKIMGV.mas_centerY).offset(JobsWidth(7));
            });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightRegularSize(JobsWidth(8)))
            .bySizeToFit()
            .addOn(self.bacKIMGV)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.bacKIMGV);
                make.top.equalTo(self.bacKIMGV.mas_centerY).offset(JobsWidth(7));
            });
        });
    };return _subTitleLab;
}

-(UIImageView *)bacKIMGV{
    if (!_bacKIMGV) {
        @jobs_weakify(self)
        _bacKIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });
        });
    };return _bacKIMGV;
}

@end

@interface FindCodeFlowChartView ()

Prop_strong()NSMutableArray <FlowChartSingleElementView *>*singleElementMutArr;

@end

@implementation FindCodeFlowChartView

static dispatch_once_t dispatchOnce;
-(instancetype)init{
    if (self = [super init]) {
        dispatchOnce = 0;
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&dispatchOnce, ^{
        [self makeFlowChart];
    });
}

-(void)makeFlowChart{
    if (self.flowNum) {
        /// 单个节点的高度
//        CGFloat singleElementH = self.mj_h;
        /// 每个节点的宽度
        CGFloat singleElementW = JobsMainScreen_WIDTH() / self.flowNum;
        for (int t = 0; t < self.flowNum; t++) {
            FlowChartSingleElementView *singleElement = FlowChartSingleElementView.new;
            singleElement.titleLab.byText(self.titleMutArr[t]);
            singleElement.subTitleLab.byText(self.subTitleMutArr[t]);
            [self changeState:singleElement index:t];
            singleElement.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.width.mas_equalTo(singleElementW);
                make.top.bottom.equalTo(self);
                if (t == 0) {/// 第一个元素，从左边开始布局
                    make.left.equalTo(self);
                }else{
                    FlowChartSingleElementView *lastSingleElement = self.singleElementMutArr[t - 1];
                    make.left.equalTo(lastSingleElement.mas_right);
                }self.singleElementMutArr.add(singleElement);
            });
        }
    }
}

-(void)changeState:(FlowChartSingleElementView *)singleElement
             index:(int)index{
    if (self.backImageMutArr.count - 1 > self.currentFlowSerialNum) {
        if (index > self.currentFlowSerialNum) {
            singleElement.bacKIMGV.image = self.backImageMutArr[0];
            singleElement.titleLab.byTextCor(JobsLightGrayColor);
            singleElement.subTitleLab.byTextCor(JobsLightGrayColor);
        }else{
            singleElement.bacKIMGV.image = self.backImageMutArr[index + 1];
            singleElement.titleLab.byTextCor(JobsBlackColor);
            singleElement.subTitleLab.byTextCor(JobsBlackColor);
        }
    }else{
        NSAssert(0,@"数组越界");
    }
}

-(void)setCurrentFlowSerialNum:(NSInteger)currentFlowSerialNum{
    _currentFlowSerialNum = currentFlowSerialNum;
    if (self.singleElementMutArr.count) {
        for (int i = 0;  i < self.singleElementMutArr.count; i++) {
            FlowChartSingleElementView *singleElement = self.singleElementMutArr[i];
            [self changeState:singleElement
                        index:i];
        }
    }
}
#pragma mark —— lazyLoad
-(NSMutableArray<FlowChartSingleElementView *> *)singleElementMutArr{
    if (!_singleElementMutArr) {
        _singleElementMutArr = NSMutableArray.array;
    };return _singleElementMutArr;
}

@end
