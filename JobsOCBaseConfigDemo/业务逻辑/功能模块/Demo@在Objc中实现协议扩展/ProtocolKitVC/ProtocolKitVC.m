//
//  ProtocolKitVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ProtocolKitVC.h"

@interface ProtocolKitVC ()

@end

@implementation ProtocolKitVC

- (instancetype)init{
    if (self = [super init]) {

    };return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ProtocolKit";
    self.view.backgroundColor = [UIColor colorWithRed:245.0 / 255.0
                                                green:247.0 / 255.0
                                                 blue:252.0 / 255.0
                                                alpha:1.0];
    [self jobs_setupProtocolKitContentView];
}

- (void)jobs_setupProtocolKitContentView {
    UIScrollView *scrollView = UIScrollView.new;
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];

    UIView *contentView = UIView.new;
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addSubview:contentView];

    UIStackView *stackView = UIStackView.new;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 14.0;
    [contentView addSubview:stackView];

    NSLayoutConstraint *scrollTopConstraint = nil;
    NSLayoutConstraint *scrollBottomConstraint = nil;
    if (@available(iOS 11.0, *)) {
        scrollTopConstraint = [scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor];
        scrollBottomConstraint = [scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        scrollTopConstraint = [scrollView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor];
        scrollBottomConstraint = [scrollView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor];
#pragma clang diagnostic pop
    }

    [NSLayoutConstraint activateConstraints:@[
        scrollTopConstraint,
        [scrollView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [scrollView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        scrollBottomConstraint,
        [contentView.topAnchor constraintEqualToAnchor:scrollView.topAnchor],
        [contentView.leftAnchor constraintEqualToAnchor:scrollView.leftAnchor],
        [contentView.rightAnchor constraintEqualToAnchor:scrollView.rightAnchor],
        [contentView.bottomAnchor constraintEqualToAnchor:scrollView.bottomAnchor],
        [contentView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [stackView.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:24.0],
        [stackView.leftAnchor constraintEqualToAnchor:contentView.leftAnchor constant:20.0],
        [stackView.rightAnchor constraintEqualToAnchor:contentView.rightAnchor constant:-20.0],
        [stackView.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:-28.0]
    ]];

    UILabel *titleLabel = [self jobs_protocolKitLabelWithText:@"Objective-C 协议扩展"
                                                         font:[UIFont boldSystemFontOfSize:26.0]
                                                        color:[UIColor colorWithRed:27.0 / 255.0
                                                                              green:35.0 / 255.0
                                                                               blue:51.0 / 255.0
                                                                              alpha:1.0]
                                                numberOfLines:0];
    [stackView addArrangedSubview:titleLabel];

    UILabel *summaryLabel = [self jobs_protocolKitLabelWithText:@"这个页面承载 ProtocolKit Demo：用 runtime 给遵守协议的类注入默认方法，让 OC 也能获得类似 Swift protocol extension 的体验。"
                                                           font:[UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular]
                                                          color:[UIColor colorWithRed:88.0 / 255.0
                                                                                green:98.0 / 255.0
                                                                                 blue:115.0 / 255.0
                                                                                alpha:1.0]
                                                  numberOfLines:0];
    [stackView addArrangedSubview:summaryLabel];

    [stackView addArrangedSubview:[self jobs_protocolKitCardWithTitle:@"页面状态"
                                                               detail:@"已补齐可见 UI。后续如果把 ProtocolKit 源码正式接入编译，这里可以继续加按钮触发真实注入验证。"
                                                            highlight:@"当前目标：点进来不再黑屏，并能看懂这个 Demo 对应的能力。"]];

    [stackView addArrangedSubview:[self jobs_protocolKitCardWithTitle:@"实现思路"
                                                               detail:@"@defs(Protocol) 会生成一个容器类，容器类在 +load 中登记协议默认实现；改良版再通过 resolveInstanceMethod: / resolveClassMethod: 按需注入，减少启动期遍历所有 Class 的成本。"
                                                            highlight:@"关键路径：登记默认实现 -> 命中协议类 -> 动态补 Method。"]];

    [stackView addArrangedSubview:[self jobs_protocolKitCardWithTitle:@"工程目录"
                                                               detail:@"当前目录保留了作者原版、改良版本和说明文档。VC 层先做展示入口，不主动改动底层 runtime 方案。"
                                                            highlight:@"PKProtocolExtension / 作者原版 / 改良版本 / ProtocolKit.md"]];

    [stackView addArrangedSubview:[self jobs_protocolKitCodeCard]];
}

- (UIView *)jobs_protocolKitCardWithTitle:(NSString *)title
                                   detail:(NSString *)detail
                                highlight:(NSString *)highlight {
    UIView *cardView = [self jobs_protocolKitBaseCardView];

    UIStackView *stackView = UIStackView.new;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 8.0;
    [cardView addSubview:stackView];

    [NSLayoutConstraint activateConstraints:@[
        [stackView.topAnchor constraintEqualToAnchor:cardView.topAnchor constant:16.0],
        [stackView.leftAnchor constraintEqualToAnchor:cardView.leftAnchor constant:16.0],
        [stackView.rightAnchor constraintEqualToAnchor:cardView.rightAnchor constant:-16.0],
        [stackView.bottomAnchor constraintEqualToAnchor:cardView.bottomAnchor constant:-16.0]
    ]];

    [stackView addArrangedSubview:[self jobs_protocolKitLabelWithText:title
                                                                 font:[UIFont boldSystemFontOfSize:17.0]
                                                                color:[UIColor colorWithRed:32.0 / 255.0
                                                                                      green:43.0 / 255.0
                                                                                       blue:60.0 / 255.0
                                                                                      alpha:1.0]
                                                        numberOfLines:0]];
    [stackView addArrangedSubview:[self jobs_protocolKitLabelWithText:detail
                                                                 font:[UIFont systemFontOfSize:14.0]
                                                                color:[UIColor colorWithRed:94.0 / 255.0
                                                                                      green:103.0 / 255.0
                                                                                       blue:119.0 / 255.0
                                                                                      alpha:1.0]
                                                        numberOfLines:0]];
    UILabel *highlightLabel = [self jobs_protocolKitPillLabelWithText:highlight];
    if (highlight.length) [stackView addArrangedSubview:highlightLabel];
    UIView *resultView = cardView;
    return resultView;
}

- (UIView *)jobs_protocolKitCodeCard {
    UIView *cardView = [self jobs_protocolKitBaseCardView];

    UIStackView *stackView = UIStackView.new;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 10.0;
    [cardView addSubview:stackView];

    [NSLayoutConstraint activateConstraints:@[
        [stackView.topAnchor constraintEqualToAnchor:cardView.topAnchor constant:16.0],
        [stackView.leftAnchor constraintEqualToAnchor:cardView.leftAnchor constant:16.0],
        [stackView.rightAnchor constraintEqualToAnchor:cardView.rightAnchor constant:-16.0],
        [stackView.bottomAnchor constraintEqualToAnchor:cardView.bottomAnchor constant:-16.0]
    ]];

    [stackView addArrangedSubview:[self jobs_protocolKitLabelWithText:@"典型写法"
                                                                 font:[UIFont boldSystemFontOfSize:17.0]
                                                                color:[UIColor colorWithRed:32.0 / 255.0
                                                                                      green:43.0 / 255.0
                                                                                       blue:60.0 / 255.0
                                                                                      alpha:1.0]
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
                                                       color:[UIColor colorWithRed:36.0 / 255.0
                                                                             green:48.0 / 255.0
                                                                              blue:64.0 / 255.0
                                                                             alpha:1.0]
                                               numberOfLines:0];
    codeLabel.backgroundColor = [UIColor colorWithRed:243.0 / 255.0
                                                green:246.0 / 255.0
                                                 blue:250.0 / 255.0
                                                alpha:1.0];
    codeLabel.layer.cornerRadius = 8.0;
    codeLabel.layer.masksToBounds = YES;
    [stackView addArrangedSubview:codeLabel];

    UIView *resultView = cardView;
    return resultView;
}

- (UIView *)jobs_protocolKitBaseCardView {
    UIView *cardView = UIView.new;
    cardView.translatesAutoresizingMaskIntoConstraints = NO;
    cardView.backgroundColor = UIColor.whiteColor;
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
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.numberOfLines = numberOfLines;
    return label;
}

- (UILabel *)jobs_protocolKitPillLabelWithText:(NSString *)text {
    UILabel *label = [self jobs_protocolKitLabelWithText:text
                                                    font:[UIFont systemFontOfSize:13.0 weight:UIFontWeightMedium]
                                                   color:[UIColor colorWithRed:38.0 / 255.0
                                                                         green:96.0 / 255.0
                                                                          blue:176.0 / 255.0
                                                                         alpha:1.0]
                                           numberOfLines:0];
    label.text = [NSString stringWithFormat:@"  %@  ", text];
    label.backgroundColor = [UIColor colorWithRed:232.0 / 255.0
                                            green:241.0 / 255.0
                                             blue:255.0 / 255.0
                                            alpha:1.0];
    label.layer.cornerRadius = 8.0;
    label.layer.masksToBounds = YES;
    return label;
}

@end
