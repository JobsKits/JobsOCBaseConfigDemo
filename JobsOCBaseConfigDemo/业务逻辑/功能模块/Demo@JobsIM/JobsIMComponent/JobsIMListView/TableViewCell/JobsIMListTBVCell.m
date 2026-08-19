//
//  JobsIMListTBVCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMListTBVCell.h"

@interface JobsIMListTBVCell ()

Prop_strong()UIImageView *avatarIMGV;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *messageLab;
Prop_strong()UILabel *timeLab;
Prop_strong()UIView *separatorLine;
Prop_strong()UILongPressGestureRecognizer *longPG;
Prop_strong()NSMutableArray <MGSwipeButtonModel *>*leftBtnMutArr;
Prop_strong()NSMutableArray <MGSwipeButtonModel *>*rightBtnMutArr;
Prop_copy()NSString *usernameStr;
Prop_copy()NSString *contentStr;
Prop_copy()NSString *timeStr;
Prop_strong()UIImage *userHeaderIMG;
Prop_copy()NSString *userHeaderURLStr;

-(JobsRetJobsIMListTBVCellByStrBlock _Nonnull)byUsernameStr;
-(JobsRetJobsIMListTBVCellByStrBlock _Nonnull)byContentStr;
-(JobsRetJobsIMListTBVCellByStrBlock _Nonnull)byTimeStr;
-(JobsRetJobsIMListTBVCellByImageBlock _Nonnull)byUserHeaderIMG;
-(JobsRetJobsIMListTBVCellByStrBlock _Nonnull)byUserHeaderURLStr;

@end

@implementation JobsIMListTBVCell

#define JobsIMListTBVCellStrSetter(_method_, _setter_) \
-(JobsRetJobsIMListTBVCellByStrBlock _Nonnull)_method_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsIMListTBVCell *_Nullable(NSString *_Nullable string){ \
        @jobs_strongify(self) \
        if (!self) return nil; \
        [self _setter_:string]; \
        return self; \
    }; \
}

JobsIMListTBVCellStrSetter(byUsernameStr, setUsernameStr)
JobsIMListTBVCellStrSetter(byContentStr, setContentStr)
JobsIMListTBVCellStrSetter(byTimeStr, setTimeStr)
JobsIMListTBVCellStrSetter(byUserHeaderURLStr, setUserHeaderURLStr)

-(JobsRetJobsIMListTBVCellByImageBlock _Nonnull)byUserHeaderIMG{
    @jobs_weakify(self)
    return ^__kindof JobsIMListTBVCell *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setUserHeaderIMG:image];
        return self;
    };
}

UITextFieldProtocol_synthesize_part2
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1ByTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsIMListTBVCell *cell = (JobsIMListTBVCell *)tableView.tableViewCellClass(JobsIMListTBVCell.class,@"");
        if (!cell) {
            cell = JobsIMListTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell
                .bySelectionStyle(UITableViewCellSelectionStyleDefault)
                .byContentView(^(__kindof UIView * _Nullable view) {
                    view.byBgColor(JobsSystemBackgroundColor);
                })
                .byBgColor(JobsSystemBackgroundColor);
        };return cell;
    };
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        if (self.longPG) self.longPG.byEnabled(YES);
        self.swipeBackgroundColor = JobsClearColor;
        self.bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsTertiarySystemBackgroundColor);
        }));
        self.leftSwipeSettings.transition = MGSwipeTransitionBorder;
        self.rightSwipeSettings.transition = MGSwipeTransitionDrag;
        self.leftExpansion.buttonIndex = 0;
        self.leftExpansion.fillOnTrigger = NO;
        self.rightExpansion.buttonIndex = 0;
        self.rightExpansion.fillOnTrigger = YES;
        self.leftButtons = self.createLeftButtons();
        self.rightButtons = self.createRightButtons();
        self.avatarIMGV.byAlpha(1);
        self.titleLab.byAlpha(1);
        self.messageLab.byAlpha(1);
        self.timeLab.byAlpha(1);
        self.separatorLine.byAlpha(1);
    };return self;
}

+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(72);
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:JobsIMListDataModel.class]) {
            JobsIMListDataModel *listDataModel = (JobsIMListDataModel *)model;
            self.byUsernameStr(listDataModel.usernameStr)
                .byContentStr(listDataModel.contentStr)
                .byUserHeaderIMG(listDataModel.userHeaderIMG)
                .byUserHeaderURLStr(listDataModel.userHeaderURLStr)
                .byTimeStr(listDataModel.timeStr);
        }else{
            self.byUsernameStr(@"数据异常".jobsTr())
                .byContentStr(@"数据异常".jobsTr())
                .byUserHeaderIMG(nil)
                .byUserHeaderURLStr(@"https://picsum.photos/126")
                .byTimeStr(@"数据异常".jobsTr());
        }
        self.titleLab
            .byText(self.usernameStr)
            .byTextCor(JobsLabelColor)
            .byAlpha(1);
        self.messageLab
            .byText(self.contentStr)
            .byTextCor(JobsSecondaryLabelColor)
            .byAlpha(1);
        if (self.userHeaderIMG) {
            self.avatarIMGV.byImage(self.userHeaderIMG);
        }else{
            self.avatarIMGV
                .imageURL(self.userHeaderURLStr.jobsURL())
                .placeholderImage(UIImage.animatedGIFByName(@"动态头像_1 尺寸126"))
                .options(self.jobsMakeSDWebImageOptions())
                .load();
        }
        self.timeLab
            .byText(self.timeStr)
            .byTextCor(JobsTertiaryLabelColor)
            .byAlpha(1);
        return self;
    };
}

-(void)prepareForReuse{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMListTBVCell.class, @selector(jobsPrepareForReuse)))(self, @selector(jobsPrepareForReuse));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareForReuse{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareForReuse];
        self.avatarIMGV.byImage(nil);
        self.titleLab.byText(nil);
        self.messageLab.byText(nil);
        self.timeLab.byText(nil);
    };
}

-(JobsRetArrByVoidBlock _Nonnull)createLeftButtons{
    @jobs_weakify(self)
    return ^NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return jobsMakeMutArr(^(__kindof NSMutableArray <MGSwipeButton *>*_Nullable arr) {
            @jobs_strongify(self)
            for (MGSwipeButtonModel *model in self.leftBtnMutArr) {
                arr.add([MGSwipeButton buttonWithTitle:model.titleStr
                                                  icon:model.IconIMG
                                       backgroundColor:model.bgCor
                                               padding:15
                                              callback:^BOOL(MGSwipeTableCell * sender){
                    JobsLog(@"Convenience callback received (left).");
                    return YES;
                }]);
            }
        });
    };
}

-(JobsRetArrByVoidBlock _Nonnull)createRightButtons{
    @jobs_weakify(self)
    return ^NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return jobsMakeMutArr(^(__kindof NSMutableArray <MGSwipeButton *>*_Nullable arr) {
            @jobs_strongify(self)
            for (MGSwipeButtonModel *model in self.rightBtnMutArr) {
                arr.add([MGSwipeButton buttonWithTitle:model.titleStr
                                                  icon:model.IconIMG
                                       backgroundColor:model.bgCor
                                               padding:15
                                              callback:^BOOL(MGSwipeTableCell * sender){
                    JobsLog(@"Convenience callback received (left).");
                    return YES;
                }]);
            }
        });
    };
}

-(BOOL)canBecomeFirstResponder{
    JobsRetBOOLByVoidBlock action = ((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMListTBVCell.class, @selector(jobsCanBecomeFirstResponder)))(self, @selector(jobsCanBecomeFirstResponder));
    return action ? action() : (BOOL){0};
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanBecomeFirstResponder{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return YES;
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)avatarIMGV{
    if (!_avatarIMGV) {
        @jobs_weakify(self)
        _avatarIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byContentMode(UIViewContentModeScaleAspectFill)
                .cornerCutToCircleWithCornerRadius(JobsWidth(6))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView).offset(JobsWidth(16));
                    make.centerY.equalTo(self.contentView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(48),
                                                     JobsWidth(48)));
                });
        });
    };return _avatarIMGV;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(JobsWidth(17)))
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(JobsWidth(10));
                    make.left.equalTo(self.avatarIMGV.mas_right).offset(JobsWidth(12));
                    make.right.lessThanOrEqualTo(self.timeLab.mas_left).offset(JobsWidth(-8));
                    make.height.mas_equalTo(JobsWidth(22));
                });
        });
    };return _titleLab;
}

-(UILabel *)messageLab{
    if (!_messageLab) {
        @jobs_weakify(self)
        _messageLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(JobsWidth(14)))
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(2));
                    make.left.equalTo(self.titleLab);
                    make.right.equalTo(self.contentView).offset(JobsWidth(-16));
                    make.height.mas_equalTo(JobsWidth(20));
                });
        });
    };return _messageLab;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        @jobs_weakify(self)
        _timeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.timeStr)
                .byTextCor(JobsTertiaryLabelColor)
                .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                .byNumberOfLines(1)
                .byTextAlignment(NSTextAlignmentRight)
                .bySizeToFit()
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(JobsWidth(12));
                    make.right.equalTo(self.contentView).offset(JobsWidth(-16));
                });
        });
    };return _timeLab;
}

-(UIView *)separatorLine{
    if (!_separatorLine) {
        @jobs_weakify(self)
        _separatorLine = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsSeparatorColor)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.titleLab);
                    make.right.bottom.equalTo(self.contentView);
                    make.height.mas_equalTo(1.0f / UIScreen.mainScreen.scale);
                });
        });
    };return _separatorLine;
}

-(UILongPressGestureRecognizer *)longPG{
    if (!_longPG) {
        _longPG = (jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
            /// 这里写手势的配置
        })).GestureActionBy(^(__kindof UIGestureRecognizer * _Nullable gesture) {
            /// 这里写手势的触发
            if (gesture.state == UIGestureRecognizerStateBegan) {
                JobsLog(@"长按手势做什么");
            }
        });self.addGesture(_longPG);
    };return _longPG;
}

-(NSMutableArray<MGSwipeButtonModel *> *)leftBtnMutArr{
    if (!_leftBtnMutArr) {
        _leftBtnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.byTitleStr(@"L1")
                    .byIconIMG(@"Check".img)
                    .byBgCor(JobsGreenColor);
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.byTitleStr(@"L2")
                    .byIconIMG(@"Fav".img)
                    .byBgCor(RGBA_COLOR(0, 0x99, 0xcc, 1));
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.byTitleStr(@"L3")
                    .byIconIMG(@"Menu".img)
                    .byBgCor(RGBA_COLOR(0.59, 0.29, 0.08, 1));
            }));
        });
    };return _leftBtnMutArr;
}

-(NSMutableArray<MGSwipeButtonModel *> *)rightBtnMutArr{
    if (!_rightBtnMutArr) {
        _rightBtnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.byTitleStr(@"Class")
                    .byIconIMG(@"Check".img)
                    .byBgCor(JobsPurpleColor);
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.byTitleStr(@"R2")
                    .byIconIMG(@"Drop".img)
                    .byBgCor(JobsDarkTextColor);
            }))
            .add(jobsMakeMGSwipeButtonModel(^(__kindof MGSwipeButtonModel * _Nullable model) {
                model.byTitleStr(@"R3")
                    .byIconIMG(@"Header".img)
                    .byBgCor(JobsCyanColor);
            }));
        });
    };return _rightBtnMutArr;
}

@end
