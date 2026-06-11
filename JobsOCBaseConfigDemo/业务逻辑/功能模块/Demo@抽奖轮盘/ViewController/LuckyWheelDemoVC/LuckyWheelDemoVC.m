//
//  LuckyWheelDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LuckyWheelDemoVC.h"

@interface LuckyWheelDemoVC ()

Prop_strong()LuckyWheelView *wheelView;
Prop_strong()NSMutableArray<LuckyWheelSegment *> *segments;

@end

@implementation LuckyWheelDemoVC

- (void)dealloc{
    JobsNotificationCenter.remove(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = @"返回".tr;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = @"抽奖转盘".tr;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = @"新首页的底图".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
//    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsRedCor(1));

    @jobs_weakify(self)
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
                                        .jobsResetBtnTitle(@"停止".tr)
                                        .jobsResetBtnTitleCor(JobsBlueCor(0.7))
                                        .onClickBy(^(UIButton *x){
                                            @jobs_strongify(self)
                                            [self.wheelView stopSpin];
                                        }).onLongPressGestureBy(^(id data){
                                            JobsLog(@"");
                                        })
                                        .bySize(CGSizeMake(JobsWidth(24), JobsWidth(24)))));
    });
    self.makeNavByAlpha(1);
    self.wheelView.byVisible(YES);
}
#pragma mark —— Lazyload
-(NSMutableArray<LuckyWheelSegment *> *)segments{
    if(!_segments){
        _segments = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            arr.add([LuckyWheelSegment.alloc initWithText:@"一等奖".tr
                                                 textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                                textColor:JobsBlackColor
                                           attributedText:nil
                                          backgroundColor:JobsRandomCor(1)
                                         placeholderImage:@"globe".sys_img
                                           imageURLString:@"https://picsum.photos/30"])
            .add([LuckyWheelSegment.alloc initWithText:@"二等奖".tr
                                              textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                             textColor:JobsBlackColor
                                        attributedText:nil
                                       backgroundColor:JobsRandomCor(1)
                                      placeholderImage:@"plus".sys_img
                                        imageURLString:@"https://picsum.photos/30"])
            .add([LuckyWheelSegment.alloc initWithText:@"三等奖".tr
                                              textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                             textColor:JobsBlackColor
                                        attributedText:nil
                                       backgroundColor:JobsRandomCor(1)
                                      placeholderImage:@"message".sys_img
                                        imageURLString:@"https://picsum.photos/30"])
            .add([LuckyWheelSegment.alloc initWithText:@"谢谢参与".tr
                                              textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                             textColor:JobsBlackColor
                                        attributedText:nil
                                       backgroundColor:JobsRandomCor(1)
                                      placeholderImage:@"tray".sys_img
                                        imageURLString:@"https://picsum.photos/30"]);
        });
    };return _segments;
}

-(LuckyWheelView *)wheelView{
    if(!_wheelView){
        @jobs_weakify(self)
        _wheelView = jobsMakeLuckyWheelView(^(__kindof LuckyWheelView * _Nullable wheel) {
            @jobs_strongify(self)
            wheel.translatesAutoresizingMaskIntoConstraints = NO;
            wheel.bySegments(self.segments)
                .byPointerDirection(JobsDirectionUp)
                .bySpinDuration(3.0)
                .byCustomInitialVelocity(@25)
                .byPanRotationEnabled(YES)
                .bySegmentTap(^(LuckyWheelSegment * _Nonnull segment) {
                    [NSString stringWithFormat:@"🍀 短按 / 停止命中：%@", segment.text ?: @""].toast();
                })
                .bySegmentLongPress(^(LuckyWheelSegment * _Nonnull segment,
                                      UILongPressGestureRecognizer * _Nonnull gr) {
                 if (gr.state == UIGestureRecognizerStateBegan) {
                     [NSString stringWithFormat:@"👆 长按开始：%@", segment.text ?: @""].toast();
                 }
             }).byBgColor(JobsRandomCor(.7));
        })
        .addOn(self.view)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(300.0, 300.0));
        });
    };return _wheelView;
}

@end
