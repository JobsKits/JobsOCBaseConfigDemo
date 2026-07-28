//
//  ProtocolKitVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ProtocolKitVC.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

@interface ProtocolKitVC ()

Prop_strong()UIScrollView *protocolScrollView;
Prop_strong()UIView *protocolContentView;
Prop_strong()UIStackView *protocolStackView;
Prop_strong()NSMutableArray <UIView *>*protocolCardViewMutArr;
Prop_strong()NSMutableArray <UIStackView *>*protocolCardStackViewMutArr;
Prop_strong()NSMutableArray <UILabel *>*protocolLabelMutArr;

@end

@implementation ProtocolKitVC
- (instancetype)init{
    if (self = [super init]) {
    };return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ProtocolKit";
    self.view.byBgColor(JobsSystemBackgroundColor);
    [self jobs_setupProtocolKitContentView];
}

- (void)jobs_setupProtocolKitContentView {
    [self.view addSubview:self.protocolScrollView];
    [self.protocolScrollView addSubview:self.protocolContentView];
    [self.protocolContentView addSubview:self.protocolStackView];
    [self.protocolScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    [self.protocolContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.protocolScrollView);
        make.width.equalTo(self.view);
    }];
    [self.protocolStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.protocolContentView).offset(24.0);
        make.left.equalTo(self.protocolContentView).offset(20.0);
        make.right.equalTo(self.protocolContentView).offset(-20.0);
        make.bottom.equalTo(self.protocolContentView).offset(-28.0);
    }];
    UILabel *titleLabel = [self jobs_protocolKitLabelWithText:@"Objective-C 协议扩展"
                                                         font:[UIFont boldSystemFontOfSize:26.0]
                                                        color:JobsLabelColor
                                                numberOfLines:0];
    [self.protocolStackView addArrangedSubview:titleLabel];
    UILabel *summaryLabel = [self jobs_protocolKitLabelWithText:@"这个页面承载 ProtocolKit Demo：用 runtime 给遵守协议的类注入默认方法，让 OC 也能获得类似 Swift protocol extension 的体验。"
                                                           font:[UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular]
                                                          color:JobsSecondaryLabelColor
                                                  numberOfLines:0];
    [self.protocolStackView addArrangedSubview:summaryLabel];
    [self.protocolStackView addArrangedSubview:[self jobs_protocolKitCardWithTitle:@"页面状态"
                                                               detail:@"已补齐可见 UI。后续如果把 ProtocolKit 源码正式接入编译，这里可以继续加按钮触发真实注入验证。"
                                                            highlight:@"当前目标：点进来不再黑屏，并能看懂这个 Demo 对应的能力。"]];
    [self.protocolStackView addArrangedSubview:[self jobs_protocolKitCardWithTitle:@"实现思路"
                                                               detail:@"@defs(Protocol) 会生成一个容器类，容器类在 +load 中登记协议默认实现；改良版再通过 resolveInstanceMethod: / resolveClassMethod: 按需注入，减少启动期遍历所有 Class 的成本。"
                                                            highlight:@"关键路径：登记默认实现 -> 命中协议类 -> 动态补 Method。"]];
    [self.protocolStackView addArrangedSubview:[self jobs_protocolKitCardWithTitle:@"工程目录"
                                                               detail:@"当前目录保留了作者原版、改良版本和说明文档。VC 层先做展示入口，不主动改动底层 runtime 方案。"
                                                            highlight:@"PKProtocolExtension / 作者原版 / 改良版本 / ProtocolKit.md"]];
    [self.protocolStackView addArrangedSubview:[self jobs_protocolKitCodeCard]];
}

- (UIView *)jobs_protocolKitCardWithTitle:(NSString *)title
                                   detail:(NSString *)detail
                                highlight:(NSString *)highlight {
    UIView *cardView = [self jobs_protocolKitBaseCardView];
    UIStackView *stackView = UIStackView.new;
    self.protocolCardStackViewMutArr.add(stackView);
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 8.0;
    [cardView addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cardView).insets(UIEdgeInsetsMake(16.0, 16.0, 16.0, 16.0));
    }];
    [stackView addArrangedSubview:[self jobs_protocolKitLabelWithText:title
                                                                 font:[UIFont boldSystemFontOfSize:17.0]
                                                                color:JobsLabelColor
                                                        numberOfLines:0]];
    [stackView addArrangedSubview:[self jobs_protocolKitLabelWithText:detail
                                                                 font:[UIFont systemFontOfSize:14.0]
                                                                color:JobsSecondaryLabelColor
                                                        numberOfLines:0]];
    UILabel *highlightLabel = [self jobs_protocolKitPillLabelWithText:highlight];
    if (highlight.length) [stackView addArrangedSubview:highlightLabel];
    UIView *resultView = cardView;
    return resultView;
}

- (UIView *)jobs_protocolKitCodeCard {
    UIView *cardView = [self jobs_protocolKitBaseCardView];
    UIStackView *stackView = UIStackView.new;
    self.protocolCardStackViewMutArr.add(stackView);
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 10.0;
    [cardView addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cardView).insets(UIEdgeInsetsMake(16.0, 16.0, 16.0, 16.0));
    }];
    [stackView addArrangedSubview:[self jobs_protocolKitLabelWithText:@"典型写法"
                                                                 font:[UIFont boldSystemFontOfSize:17.0]
                                                                color:JobsLabelColor
                                                        numberOfLines:0]];
    NSString *codeText =
    @"\n"
    @"  @protocol Forkable <NSObject>\n"
    @"  @optional\n"
    @"  - (void)fork;\n"
    @"  @end\n"
    @"\n"
    @"  @defs(Forkable)\n"
    @"  - (void)fork {\n"
    @"      JobsLog(@\"default implementation\");\n"
    @"  }\n"
    @"  @end\n";
    UILabel *codeLabel = [self jobs_protocolKitLabelWithText:codeText
                                                        font:[UIFont fontWithName:@"Menlo-Regular" size:13.0] ?: [UIFont systemFontOfSize:13.0]
                                                       color:JobsLabelColor
                                               numberOfLines:0];
    codeLabel.byBgColor(JobsTertiarySystemBackgroundColor);
    codeLabel.layer.cornerRadius = 8.0;
    codeLabel.layer.masksToBounds = YES;
    [stackView addArrangedSubview:codeLabel];
    UIView *resultView = cardView;
    return resultView;
}

- (UIView *)jobs_protocolKitBaseCardView {
    UIView *cardView = UIView.new;
    self.protocolCardViewMutArr.add(cardView);
    cardView.byBgColor(JobsSecondarySystemBackgroundColor);
    cardView.layer.cornerRadius = 8.0;
    cardView.layer.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.08].CGColor;
    cardView.layer.shadowOpacity = 1.0;
    cardView.layer.shadowRadius = 14.0;
    cardView.layer.shadowOffset = CGSizeMake(0.0, 8.0);
    return cardView;
}

- (UILabel *)jobs_protocolKitLabelWithText:(NSString *)text
                                      font:(UIFont *)font
                                     color:(UIColor *)color
                             numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = UILabel.new;
    self.protocolLabelMutArr.add(label);
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.numberOfLines = numberOfLines;
    return label;
}

- (UILabel *)jobs_protocolKitPillLabelWithText:(NSString *)text {
    UILabel *label = [self jobs_protocolKitLabelWithText:text
                                                    font:[UIFont systemFontOfSize:13.0 weight:UIFontWeightMedium]
                                                   color:JobsSystemBlueColor
                                           numberOfLines:0];
    label.text = [NSString stringWithFormat:@"  %@  ", text];
    label.byBgColor([JobsSystemBlueColor colorWithAlphaComponent:0.12]);
    label.layer.cornerRadius = 8.0;
    label.layer.masksToBounds = YES;
    return label;
}

#pragma mark —— LazyLoad
-(UIScrollView *)protocolScrollView{
    if (!_protocolScrollView) {
        _protocolScrollView = UIScrollView.new;
        _protocolScrollView.alwaysBounceVertical = YES;
        _protocolScrollView.showsVerticalScrollIndicator = NO;
    };return _protocolScrollView;
}

-(UIView *)protocolContentView{
    if (!_protocolContentView) {
        _protocolContentView = UIView.new;
    };return _protocolContentView;
}

-(UIStackView *)protocolStackView{
    if (!_protocolStackView) {
        _protocolStackView = UIStackView.new;
        _protocolStackView.axis = UILayoutConstraintAxisVertical;
        _protocolStackView.spacing = 14.0;
    };return _protocolStackView;
}

-(NSMutableArray<UIView *> *)protocolCardViewMutArr{
    if (!_protocolCardViewMutArr) {
        _protocolCardViewMutArr = NSMutableArray.array;
    };return _protocolCardViewMutArr;
}

-(NSMutableArray<UIStackView *> *)protocolCardStackViewMutArr{
    if (!_protocolCardStackViewMutArr) {
        _protocolCardStackViewMutArr = NSMutableArray.array;
    };return _protocolCardStackViewMutArr;
}

-(NSMutableArray<UILabel *> *)protocolLabelMutArr{
    if (!_protocolLabelMutArr) {
        _protocolLabelMutArr = NSMutableArray.array;
    };return _protocolLabelMutArr;
}

@end
