//
//  JobsIMShowVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMShowVC.h"

@interface JobsIMShowVC ()

Prop_strong()JobsIMListView *listView;

@end

@implementation JobsIMShowVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMShowVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byAttributedTitle(nil)
                    .byText(@"JobsIM")
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightSemiboldSize(JobsWidth(17)));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(JobsSystemBackgroundColor)
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMShowVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.gk_navTitleViewBy(self.viewModel);
        self.makeNavByAlpha(1);
        self.listView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMShowVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMShowVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMShowVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}
#pragma mark —— 一些私有方法
-(JobsRetUIViewModelByJobsIMListDataModelBlock _Nonnull)makeData{
    @jobs_weakify(self)
    return ^UIViewModel *(JobsIMListDataModel * data){
        @jobs_strongify(self)
        if (!self) return nil;
        JobsIMChatInfoModel *chatInfoModel = JobsIMChatInfoModel.new;
        chatInfoModel.byMessageID(data.lastMessageID ?: NSUUID.UUID.UUIDString)
            .byConversationID(data.peerID)
            .byFromUserID(data.userID)
            .byToUserID(JobsIMLocalDemoUserID())
            .byUserID(data.userID)
            .byChatTextStr(data.contentStr)
            .byUserNameStr(data.usernameStr)
            .byChatTextTimeStr(data.timeStr)
            .byUserIconIMG(data.userHeaderIMG)
            .byUserIconURLStr(data.userHeaderURLStr)
            .byIdentification(JobsIMStringFromTransportKind(data.transportKind))
            .byMessageType(JobsIMChatMessageType_Text)
            .byChatInfoDirection(JobsIMChatInfoDirection_Send)
            .byPacketType(JobsIMPacketTypeText)
            .byDeliveryState(JobsIMDeliveryStateReceived)
            .byTransportKind(data.transportKind)
            .byRawPacket(JobsIMPacketMake(JobsIMPacketTypeText,
                                                   chatInfoModel.messageID,
                                                   chatInfoModel.fromUserID,
                                                   chatInfoModel.toUserID,
                                                   @{
                                                       @"text": chatInfoModel.chatTextStr ?: @"",
                                                       @"transport": JobsIMStringFromTransportKind(data.transportKind)
                                                   }));
        return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.byData(chatInfoModel)
                .byTextModelBlock(^(__kindof UITextModel * _Nullable textModel) {
                    textModel.byAttributedTitle(nil)
                        .byText(chatInfoModel.userNameStr);
                });
        });
    };
}
#pragma mark —— lazyLoad
-(JobsIMListView *)listView{
    if (!_listView) {
        _listView = JobsIMListView.new;
        @jobs_weakify(self)
        _listView.jobsRichViewByModel(nil);
        _listView.actionObjBlock(^(JobsIMListDataModel *data) {
            @jobs_strongify(self)
            self.comingToPushVCByRequestParams(JobsIMVC.new,self.makeData(data));
        });
        _listView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            if (self.gk_navBarAlpha && !self.gk_navigationBar.hidden) {//显示
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top);
            }
        });
    };return _listView;
}

@end
