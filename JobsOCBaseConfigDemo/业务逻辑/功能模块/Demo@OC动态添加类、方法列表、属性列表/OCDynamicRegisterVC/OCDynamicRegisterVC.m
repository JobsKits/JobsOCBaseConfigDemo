//
//  OCDynamicRegisterVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "OCDynamicRegisterVC.h"

static NSString * const JobsDynamicRegisterDemoClassName = @"JobsRuntimeDynamicPerson";
static NSString * const JobsDynamicRegisterDemoIvarName = @"_jobsName";
static NSString * const JobsDynamicRegisterDemoPropertyName = @"jobsName";

static BOOL JobsDynamicRegisterAddStringProperty(Class targetClass,
                                                 const char *propertyName,
                                                 const char *backingIvarName) {
    objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass(NSString.class)] UTF8String] }; //type
    objc_property_attribute_t ownership = { "C", "" }; // C = copy
    objc_property_attribute_t nonatomic = { "N", "" }; //N = nonatomic
    objc_property_attribute_t backingivar  = { "V", backingIvarName };  //variable name
    objc_property_attribute_t attrs[] = {type,
                                         ownership,
                                         nonatomic,
                                         backingivar};
    /// 第一个参数是给哪个类添加属性
    /// 第二个参数是属性名
    /// 第三个参数是所添加的属性的一些属性，比如所属类、读写性、原子性、内存管理策略等。见图：objc_property_attribute_t
    /// 第四个参数是属性的属性的数量。
    return class_addProperty(targetClass,
                             propertyName,
                             attrs,
                             4);
}

static void JobsDynamicRegisterDemoSetJobsName(id self, SEL _cmd, NSString *value) {
    objc_setAssociatedObject(self,
                             @selector(jobsName),
                             value,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static NSString *JobsDynamicRegisterDemoJobsName(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, @selector(jobsName));
}

static void JobsDynamicRegisterDemoTest(id self, SEL _cmd) {
    JobsLog(@"动态方法 test 被 %@ 调用，jobsName = %@",
            NSStringFromClass([self class]),
            JobsDynamicRegisterDemoJobsName(self, @selector(jobsName)));
}

@interface OCDynamicRegisterVC (){
    Class newClass;
}

Prop_strong()UIScrollView *contentScrollView;
Prop_strong()UIView *headerCardView;
Prop_strong()UILabel *titleLabel;
Prop_strong()UILabel *subTitleLabel;
Prop_strong()UILabel *classNameValueLabel;
Prop_strong()UIView *logCardView;
Prop_strong()UILabel *logTitleLabel;
Prop_strong()UILabel *runtimeLogLabel;
Prop_strong()UIButton *runDemoBtn;
Prop_strong()UIButton *messageForwardBtn;
Prop_strong()NSMutableArray <UIView *>*stepCardMutArr;
Prop_strong()NSMutableArray <UIView *>*stepAccentViewMutArr;
Prop_strong()NSMutableArray <UILabel *>*stepTitleLabMutArr;
Prop_strong()NSMutableArray <UILabel *>*stepDetailLabMutArr;
Prop_strong()NSMutableArray <NSString *>*runtimeLogMutArr;
Prop_strong()id runtimeObject;

@end
/**
 资料来源：
 https://cloud.tencent.com/developer/article/1799505
 http://southpeak.github.io/2014/10/25/objective-c-runtime-1/
 https://github.com/zhiyongzou/DynamicOC

 */
@implementation OCDynamicRegisterVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byText(data.attributedTitle.string)
                .byFont(UIFontWeightRegularSize(16));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(RGBA_COLOR(246, 248, 252, 1));
    self.makeNavByAlpha(1);
    self.contentScrollView.addOn(self.view);
    [self buildRuntimeDemoView];
    [self work];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self layoutRuntimeDemoViews];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self triggerMessageForwardDemo];
}
#pragma mark —— Demo UI
-(void)buildRuntimeDemoView{
    if (self.headerCardView.superview) return;
    self.headerCardView.addOn(self.contentScrollView);
    self.titleLabel.addOn(self.headerCardView);
    self.subTitleLabel.addOn(self.headerCardView);
    self.classNameValueLabel.addOn(self.headerCardView);
    self.runDemoBtn.addOn(self.contentScrollView);
    self.messageForwardBtn.addOn(self.contentScrollView);
    NSArray <NSString *>*titles = @[
        @"1. 动态创建类",
        @"2. 添加成员变量和属性",
        @"3. 添加方法和协议",
        @"4. 注册实例并调用"
    ];
    NSArray <UIColor *>*tintColors = @[
        RGBA_COLOR(0.20 * 255.0, 0.49 * 255.0, 0.95 * 255.0, 1),
        RGBA_COLOR(0.16 * 255.0, 0.62 * 255.0, 0.45 * 255.0, 1),
        RGBA_COLOR(0.93 * 255.0, 0.42 * 255.0, 0.21 * 255.0, 1),
        RGBA_COLOR(0.66 * 255.0, 0.36 * 255.0, 0.86 * 255.0, 1)
    ];
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                         NSUInteger idx,
                                         BOOL * _Nonnull stop) {
        UIView *card = [self demoCardByTitle:obj
                                      detail:@"等待执行"
                                   tintColor:tintColors[idx]];
        [self.stepCardMutArr addObject:card];
        card.addOn(self.contentScrollView);
    }];
    self.logCardView.addOn(self.contentScrollView);
    self.logTitleLabel.addOn(self.logCardView);
    self.runtimeLogLabel.addOn(self.logCardView);
}

-(UILabel *)demoLabelByFont:(UIFont *)font
                      color:(UIColor *)color
              numberOfLines:(NSInteger)numberOfLines{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byFont(font)
            .byTextCor(color)
            .byNumberOfLines(numberOfLines)
            .byLineBreakMode(NSLineBreakByWordWrapping);
    });
}

-(UIView *)demoCardByTitle:(NSString *)title
                    detail:(NSString *)detail
                 tintColor:(UIColor *)tintColor{
    UIView *card = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byBgColor(JobsWhiteColor)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(8)
                    .byBorderWidth(0.5)
                    .byBorderColor(RGBA_SAMECOLOR(0, 0.08).CGColor);
            });
    });
    UIView *accentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byTag(100)
            .byBgColor(tintColor)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer.byCornerRadius(3);
            })
            .addOn(card);
    });
    [self.stepAccentViewMutArr addObject:accentView];
    UILabel *titleLabel = [self demoLabelByFont:UIFontWeightSemiboldSize(15)
                                          color:HEXCOLOR(0x2B3340)
                                  numberOfLines:1];
    titleLabel
        .byText(title)
        .byTag(101)
        .addOn(card);
    [self.stepTitleLabMutArr addObject:titleLabel];
    UILabel *detailLabel = [self demoLabelByFont:UIFontSystemFontOfSize(13)
                                           color:HEXCOLOR(0x5D6877)
                                   numberOfLines:0];
    detailLabel
        .byText(detail)
        .byTag(102)
        .addOn(card);
    [self.stepDetailLabMutArr addObject:detailLabel];
    return card;
}

-(UIButton *)demoButtonByTitle:(NSString *)title
               backgroundColor:(UIColor *)backgroundColor
                        action:(jobsByBtnBlock)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(14))
            .jobsResetBtnBgCor(backgroundColor)
            .byTitleLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumScaleFactor(0.82);
            })
            .onClickBy(action)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer.byCornerRadius(8);
            });
    });
}

-(void)layoutRuntimeDemoViews{
    if (!self.contentScrollView.superview || !self.headerCardView.superview) return;
    self.contentScrollView.byFrame(self.view.bounds);
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        safeAreaInsets = self.view.safeAreaInsets;
    }
    CGFloat contentWidth = CGRectGetWidth(self.contentScrollView.bounds) - 32;
    CGFloat left = 16;
    CGFloat top = MAX(16, safeAreaInsets.top + 12);
    self.headerCardView.byFrame(CGRectMake(left, top, contentWidth, 132));
    self.titleLabel.byFrame(CGRectMake(16, 18, contentWidth - 32, 26));
    self.subTitleLabel.byFrame(CGRectMake(16, CGRectGetMaxY(self.titleLabel.frame) + 8, contentWidth - 32, 40));
    self.classNameValueLabel.byFrame(CGRectMake(16, CGRectGetMaxY(self.subTitleLabel.frame) + 12, contentWidth - 32, 22));
    top = CGRectGetMaxY(self.headerCardView.frame) + 14;
    CGFloat buttonGap = 10;
    CGFloat buttonWidth = (contentWidth - buttonGap) / 2;
    self.runDemoBtn.byFrame(CGRectMake(left, top, buttonWidth, 44));
    self.messageForwardBtn.byFrame(CGRectMake(CGRectGetMaxX(self.runDemoBtn.frame) + buttonGap, top, buttonWidth, 44));
    top = CGRectGetMaxY(self.runDemoBtn.frame) + 14;
    for (NSUInteger idx = 0; idx < self.stepCardMutArr.count; idx++) {
        UIView *card = self.stepCardMutArr[idx];
        UIView *accentView = self.stepAccentViewMutArr[idx];
        UILabel *titleLabel = self.stepTitleLabMutArr[idx];
        UILabel *detailLabel = self.stepDetailLabMutArr[idx];
        CGFloat detailWidth = contentWidth - 46;
        CGSize detailSize = [detailLabel sizeThatFits:CGSizeMake(detailWidth, CGFLOAT_MAX)];
        CGFloat cardHeight = MAX(94, detailSize.height + 54);
        card.byFrame(CGRectMake(left, top, contentWidth, cardHeight));
        accentView.byFrame(CGRectMake(16, 17, 6, 20));
        titleLabel.byFrame(CGRectMake(32, 14, detailWidth, 24));
        detailLabel.byFrame(CGRectMake(32, CGRectGetMaxY(titleLabel.frame) + 4, detailWidth, detailSize.height));
        top = CGRectGetMaxY(card.frame) + 12;
    }
    CGSize logSize = [self.runtimeLogLabel sizeThatFits:CGSizeMake(contentWidth - 32, CGFLOAT_MAX)];
    self.logCardView.byFrame(CGRectMake(left, top, contentWidth, MAX(120, logSize.height + 58)));
    self.logTitleLabel.byFrame(CGRectMake(16, 14, contentWidth - 32, 24));
    self.runtimeLogLabel.byFrame(CGRectMake(16, CGRectGetMaxY(self.logTitleLabel.frame) + 8, contentWidth - 32, logSize.height));
    top = CGRectGetMaxY(self.logCardView.frame) + MAX(24, safeAreaInsets.bottom + 16);
    self.contentScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.contentScrollView.bounds), top);
}

-(void)refreshRuntimeCardDetailsByClass:(Class)cls
                               instance:(id)instance
                               jobsName:(NSString *)jobsName{
    if (!cls) return;
    NSArray <NSString *>*details = @[
        [NSString stringWithFormat:@"父类：%@\n子类：%@\n创建方式：objc_allocateClassPair",
         NSStringFromClass(class_getSuperclass(cls)),
         NSStringFromClass(cls)],
        [NSString stringWithFormat:@"Ivar：%@\nProperty：%@\n当前 Ivar 列表：%@\n当前属性列表：%@",
         JobsDynamicRegisterDemoIvarName,
         JobsDynamicRegisterDemoPropertyName,
         [self runtimeNamesTextByArray:[self ivarNamesByClass:cls]],
         [self runtimeNamesTextByArray:[self propertyNamesByClass:cls]]],
        [NSString stringWithFormat:@"Method：%@\nProtocol：%@\n当前方法列表：%@",
         @"setJobsName: / jobsName / test",
         [self runtimeNamesTextByArray:[self protocolNamesByClass:cls]],
         [self runtimeNamesTextByArray:[self methodNamesByClass:cls]]],
        [NSString stringWithFormat:@"Instance：%@\nKVC 写入 / IMP 读取结果：%@\n控制台 JobsLog 会同步打印动态方法调用",
         instance ? NSStringFromClass([instance class]) : @"创建失败",
         jobsName ?: @"nil"]
    ];
    [details enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                          NSUInteger idx,
                                          BOOL * _Nonnull stop) {
        if (idx < self.stepDetailLabMutArr.count) {
            self.stepDetailLabMutArr[idx].byText(obj);
        }
    }];
    self.classNameValueLabel.byText([NSString stringWithFormat:@"Runtime Class：%@", NSStringFromClass(cls)]);
    [self layoutRuntimeDemoViews];
}

-(void)appendRuntimeLog:(NSString *)logText{
    if (!logText.length) return;
    [self.runtimeLogMutArr addObject:[NSString stringWithFormat:@"- %@",logText]];
    self.runtimeLogLabel.byText([self.runtimeLogMutArr componentsJoinedByString:@"\n"]);
    [self layoutRuntimeDemoViews];
}

-(void)clearRuntimeLog{
    [self.runtimeLogMutArr removeAllObjects];
    self.runtimeLogLabel.byText(nil);
}
#pragma mark —— Actions
-(void)runDemoAction{
    [self work];
}

-(void)messageForwardAction{
    [self triggerMessageForwardDemo];
}

-(void)triggerMessageForwardDemo{
    [self appendRuntimeLog:@"触发 OCDynamic 的动态方法解析和 DynamicInvoke 示例"];
    [OCDynamic Test];
    OCDynamic *dynamic = OCDynamic.new;
    [dynamic test];
    DynamicInvoke.new;
    [self appendRuntimeLog:@"OCDynamic Test / test / DynamicInvoke 已触发，详情看控制台 JobsLog"];
}
/**
 参考资料：https://www.iloveanan.com/new-prototype-of-objc_msgsend.html

 ABI的匹配：对于原来的实现，最后的参数是一个可变参数，在转化成最终的函数调用时，系统需要将其转化成“固定”参数的调用。比如按照定义，调用者将参数 self 放入某个寄存器来传递，执行者去该寄存器取该参数，并认为是该类型的。但问题是，如果两者不一致问题就打了。而不同处理器架构上，这样的处理过程是不一样的。

     【Intel 架构对可变参数函数的处理】
      对标准的System V ABI for x86-64，参数是这样传递到寄存器的：

        整型参数：依次使用 rdi, rsi, rcx, r8 和 r9。
        浮点参数：使用 SSE 寄存器 xmm0 ~ xmm7 (每个128位)
        当调用含可变参数函数时，可变参数的实际个数使用寄存器 al 存储；整型返回值放置在 rax 和 rdx，浮点型返回值放置在 xmm0 和 xmm1。
        但是，当调用可变参数函数时，C语言中会将某些特定的数据类型字节数变宽：比 int 字节数少的会使用 int 的字节宽度，float 会使用 double 的字节数。对于整型数据而言，这不会有影响，因为数据优先存储在低位，高位为零。但是对于浮点数而言，float和double各个位数的定义不一样，不能像整型那样简单地进行高位填充。因此， 对于含可变参数的函数而言，传 float 类型的参数就会造成错误。

     【ARM64 架构对可变参数函数的处理】
      众所周知，iOS上使用的 ARM64 处理器，其使用的是 ARM64 标准 ABI 的变体：

        整型参数：依次使用 x0 ~ x7。
        浮点参数：依次使用 v0 ~ v7。
        其余参数存储在栈上，返回值放置在对应的传参寄存器中。
        对于含可变参数的函数，可变参数一直放置在栈上。因此，对于固定参数函数和可变参数函数而言，ABI 就不一致了。

 严格的类型检查可以降低代码出现异常的几率，因此：
 1、尽量使用“新”的 objc_msgSend 如果需要自己传递消息
 2、对 Mac 平台，使用可变参数形式的 objc_msgSend 时要注意避免 float 参数

 */
-(void)msgSend{
    /// macOS升级到10.15后，宏OBJC_OLD_DISPATCH_PROTOTYPES的值变为0，导致objc_msgSend 定义发生变化
    /// 使用 objc_msgSend 的时候，要需要将Xcode中build setting中的 Enbale Strict of Checking of objc_msgSend Calls 设置为 NO。这样才不会报警告。（搜索objc_msgSend）
    /// 无返回值的调用
    ((void (*)(id, SEL, float)) objc_msgSend)(self, @selector(sendObjMsg:), (float)M_PI);
    /// 有返回值的调用，需要注明返回类型
    id f = ((NSString * (*)(id, SEL, float)) objc_msgSend)(self, @selector(sendObjMsg:), (float)M_PI);
    JobsLog(@"%@",f);
}

-(NSString *)sendObjMsg: (float)x{
    JobsLog(@"%f",x);
    return @"Jobs";
}

-(void)work{
    [self clearRuntimeLog];
    [self appendRuntimeLog:@"开始执行 Runtime 动态注册流程"];
    BOOL needsCreate = NSClassFromString(JobsDynamicRegisterDemoClassName) == Nil;
    Class MyClass = [self createClass:JobsDynamicRegisterDemoClassName];
    if (!MyClass) {
        [self appendRuntimeLog:@"动态类创建失败，流程终止"];
        return;
    }
    if (needsCreate) {
        [self appendRuntimeLog:[NSString stringWithFormat:@"创建 Class：%@",JobsDynamicRegisterDemoClassName]];
        [self appendRuntimeLog:[NSString stringWithFormat:@"添加 Ivar：%@",JobsDynamicRegisterDemoIvarName]];
        [self addIvarStr:JobsDynamicRegisterDemoIvarName
                 toClass:MyClass];
        [self appendRuntimeLog:[NSString stringWithFormat:@"添加 Property：%@",JobsDynamicRegisterDemoPropertyName]];
        [self addProperty:JobsDynamicRegisterDemoPropertyName
                  toClass:MyClass
              backingIvar:JobsDynamicRegisterDemoIvarName];
        [self appendRuntimeLog:@"添加 setter / getter / test 方法"];
        [self addMethodToClass:MyClass];
        [self appendRuntimeLog:@"添加 NSCopying 协议标记"];
        [self addProtocolToClass:MyClass];
        [self registerClass:MyClass];
        [self appendRuntimeLog:@"objc_registerClassPair 完成"];
    }else{
        [self appendRuntimeLog:@"动态类已经注册，本次直接复用"];
    }
    id myobjc = [self createInstanceByClass:JobsDynamicRegisterDemoClassName];
    self.runtimeObject = myobjc;
    NSString *jobsNameValue = @"我是 Jobs 动态对象";
    SEL setterSEL = NSSelectorFromString(@"setJobsName:");
    if ([myobjc respondsToSelector:setterSEL]) {
        [myobjc setValue:jobsNameValue
                  forKey:JobsDynamicRegisterDemoPropertyName];
        [self appendRuntimeLog:[NSString stringWithFormat:@"KVC 写入 jobsName：%@",jobsNameValue]];
    }
    NSString *currentJobsName = nil;
    SEL getterSEL = NSSelectorFromString(JobsDynamicRegisterDemoPropertyName);
    if ([myobjc respondsToSelector:getterSEL]) {
        IMP getterIMP = [myobjc methodForSelector:getterSEL];
        NSString *(*getterFunc)(id, SEL) = (void *)getterIMP;
        currentJobsName = getterFunc(myobjc, getterSEL);
        [self appendRuntimeLog:[NSString stringWithFormat:@"IMP 读取 jobsName：%@",currentJobsName]];
    }
    SEL testSEL = NSSelectorFromString(@"test");
    if ([myobjc respondsToSelector:testSEL]) {
        IMP testIMP = [myobjc methodForSelector:testSEL];
        void (*testFunc)(id, SEL) = (void *)testIMP;
        testFunc(myobjc, testSEL);
        [self appendRuntimeLog:@"动态 test 方法调用成功"];
    }
    [self refreshRuntimeCardDetailsByClass:MyClass
                                  instance:myobjc
                                  jobsName:currentJobsName];
}
#pragma mark —— 一些私有方法
/// 动态创建类并添加：成员变量、属性、方法、协议
-(Class)createClass:(NSString *)className {
    Class existClass = NSClassFromString(className);
    if (existClass) {
        newClass = existClass;
        return existClass;
    }
    /// ❤️添加一个继承 OCDynamic 的类 类名是 className；注意：调用的 C 语言的方法 所以不要使用 @"".tr 表示字符串 应该使用 ""❤️
    /// 我们如果使用 objc_allocateClassPair 函数来创建一个类对象失败了，那么 objc_allocateClassPair 就会返回 Nil。如果所要创建的类已经存在了，那么就会返回 Nil.
    newClass = objc_allocateClassPair(OCDynamic.class,/// 第一个参数是父类对象，如果传nil那么新创建的类就是跟NSObject同等级别的根类对象;
                                      className.UTF8String,/// 第二个参数是本类类名;
                                      0);/// 第三个参数是初始的内存空间大小;
    return newClass;
/*
 1、objc_registerClassPair函数是将创建的类对象加载到内存，加载完成之后，本类中的ro就已经确定了;
 2、我们知道，ro是只读的，它在确定之后就不可以动态增加内容了，如果我们想在运行时增加一些内容，只能是往rw中去增加;
 3、存储成员变量的数组ivars只在ro中有，rw中是没有ivars的;
 4、因此，成员变量在ro初始化了之后就不能再继续动态新增了;
 5、所以，必须在ro初始化之前（即在调用objc_registerClassPair函数之前）完成成员变量的定义;
 6、rw的结构，可以看到是有methods、properties和protocols三个变量的

 结论：
 1、【在类注册完成之后，不可以继续添加成员变量了】
 2、【所以，在类注册完成之后，可以继续添加方法、属性和协议】
 */
}
/// 【添加属性】
-(BOOL)addProperty:(NSString *)propertyName
           toClass:(Class)cls
       backingIvar:(NSString *)backingIvar{
    if (!cls || !propertyName.length || !backingIvar.length) return NO;
    return JobsDynamicRegisterAddStringProperty(cls,
                                                propertyName.UTF8String,
                                                backingIvar.UTF8String);
}
/// 【添加方法】
-(BOOL)addMethodToClass:(Class)cls{
    if (!cls) return NO;
    BOOL setterAdded = class_addMethod(cls,
                                       @selector(setJobsName:),
                                       (IMP)JobsDynamicRegisterDemoSetJobsName,
                                       "v@:@");
    BOOL getterAdded = class_addMethod(cls,
                                       @selector(jobsName),
                                       (IMP)JobsDynamicRegisterDemoJobsName,
                                       "@@:");
    BOOL testAdded = class_addMethod(cls,/// 第一个参数是在哪个类中添加方法
                                     @selector(test),/// 第二个参数是所添加方法的编号SEL
                                     (IMP)JobsDynamicRegisterDemoTest,/// 第三个参数是所添加方法的函数实现的指针IMP
                                     "v@:");/// 第四个参数是所添加方法的签名
    return setterAdded && getterAdded && testAdded;
}
/// 【添加协议】❤️
-(BOOL)addProtocolToClass:(Class)cls{
    if (!cls) return NO;
    return class_addProtocol(cls, @protocol(NSCopying));
}
/// 【添加成员变量NSString *】
-(BOOL)addIvarStr:(NSString *)ivarName
          toClass:(Class)cls{
    if (!cls || !ivarName.length) return NO;
    /// ⚠️注意⚠️：不能在objc_registerClassPair之后进行调用
    return class_addIvar(cls,/// 第一个参数cls是类对象，它表示是往哪个类添加成员变量。需要注意的是，这个cls不能是元类对象，因为我们不支持在元类中添加实例变量;
                         ivarName.UTF8String,/// 第二个参数name是成员变量的名字;
                         sizeof(id),/// 第三个参数size是成员变量的类型的大小;
                         (uint8_t)log2(sizeof(id)),/// 第四个参数alignment是对齐处理方式，即二进制对齐位数，对于所有指针类型的变量，都是取成员变量类型大小以2为底的对数。比如8=2^3，因此这里就应该赋值3;
                         @encode(id));/// 第五个参数types是签名
}
/// 注册到内存
-(BOOL)registerClass:(Class)cls{
    if (!cls) return NO;
    NSString *className = NSStringFromClass(cls);
    if (NSClassFromString(className)) return YES;
    objc_registerClassPair(cls);
    return NSClassFromString(className) != Nil;
}
/// 生成类的实例
-(id)createInstanceByClass:(NSString *)className {
    Class targetClass = NSClassFromString(className);
    if (!targetClass) return nil;
    id intanceOfClass = targetClass.new;
    [self appendRuntimeLog:[NSString stringWithFormat:@"实例创建：%@",NSStringFromClass([intanceOfClass class])]];
    return intanceOfClass;
}
-(NSArray <NSString *>*)propertyNamesByClass:(Class)cls{
    if (!cls) return @[];
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    NSMutableArray <NSString *>*names = NSMutableArray.array;
    for (unsigned int i = 0; i < count; i++) {
        const char *name = property_getName(propertyList[i]);
        if (name) [names addObject:[NSString stringWithUTF8String:name]];
    }
    free(propertyList);
    return [names sortedArrayUsingSelector:@selector(compare:)];
}

-(NSArray <NSString *>*)ivarNamesByClass:(Class)cls{
    if (!cls) return @[];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(cls, &count);
    NSMutableArray <NSString *>*names = NSMutableArray.array;
    for (unsigned int i = 0; i < count; i++) {
        const char *name = ivar_getName(ivarList[i]);
        if (name) [names addObject:[NSString stringWithUTF8String:name]];
    }
    free(ivarList);
    return [names sortedArrayUsingSelector:@selector(compare:)];
}

-(NSArray <NSString *>*)methodNamesByClass:(Class)cls{
    if (!cls) return @[];
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    NSMutableArray <NSString *>*names = NSMutableArray.array;
    for (unsigned int i = 0; i < count; i++) {
        SEL sel = method_getName(methodList[i]);
        if (sel) [names addObject:NSStringFromSelector(sel)];
    }
    free(methodList);
    return [names sortedArrayUsingSelector:@selector(compare:)];
}

-(NSArray <NSString *>*)protocolNamesByClass:(Class)cls{
    if (!cls) return @[];
    unsigned int count = 0;
    Protocol *__unsafe_unretained *protocolList = class_copyProtocolList(cls, &count);
    NSMutableArray <NSString *>*names = NSMutableArray.array;
    for (unsigned int i = 0; i < count; i++) {
        const char *name = protocol_getName(protocolList[i]);
        if (name) [names addObject:[NSString stringWithUTF8String:name]];
    }
    free(protocolList);
    return [names sortedArrayUsingSelector:@selector(compare:)];
}

-(NSString *)runtimeNamesTextByArray:(NSArray <NSString *>*)array{
    return array.count ? [array componentsJoinedByString:@"、"] : @"无";
}

-(void)知识点{
    /// Class 反射创建
    // 方式1
    NSClassFromString(@"NSObject");
    // 方式2
    objc_getClass("NSObject");
    /// SEL 反射创建
    // 方式1
    @selector(init);
    // 方式2
    sel_registerName("init");
    // 方式3
    NSSelectorFromString(@"init");
    /*
     IMP是”implementation”的缩写,它是objetive-C 方法 (method)实现代码块的地址,类似函数指针,通过它可以 直接访问任意一个方法。免去发送消息的代价
     获取方法的IMP：-(IMP)methodForSelector:(SEL)aSelector;
     */
}
#pragma mark —— lazyLoad
-(UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byAlwaysBounceVertical(YES)
                .byShowsVerticalScrollIndicator(NO)
                .byDelaysContentTouches(NO)
                .byBgColor(UIColor.clearColor);
        });
    };return _contentScrollView;
}

-(UIView *)headerCardView{
    if (!_headerCardView) {
        _headerCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsWhiteColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(8)
                        .byBorderWidth(0.5)
                        .byBorderColor(RGBA_SAMECOLOR(0, 0.08).CGColor);
                });
        });
    };return _headerCardView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [self demoLabelByFont:UIFontWeightBoldSize(20)
                                      color:HEXCOLOR(0x2B3340)
                              numberOfLines:1];
        _titleLabel.byText(@"OC Runtime 动态注册".tr);
    };return _titleLabel;
}

-(UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [self demoLabelByFont:UIFontSystemFontOfSize(13)
                                         color:HEXCOLOR(0x667085)
                                 numberOfLines:2];
        _subTitleLabel.byText(@"演示 objc_allocateClassPair、class_addIvar、class_addProperty、class_addMethod 和 objc_registerClassPair 的完整流程。".tr);
    };return _subTitleLabel;
}

-(UILabel *)classNameValueLabel{
    if (!_classNameValueLabel) {
        _classNameValueLabel = [self demoLabelByFont:fontName(@"Menlo-Regular", 12) ?: UIFontSystemFontOfSize(12)
                                               color:HEXCOLOR(0x1F7A53)
                                       numberOfLines:1];
        _classNameValueLabel
            .byText(@"Runtime Class：等待执行".tr)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.72);
    };return _classNameValueLabel;
}

-(UIView *)logCardView{
    if (!_logCardView) {
        _logCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(HEXCOLOR(0x202734))
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer.byCornerRadius(8);
                });
        });
    };return _logCardView;
}

-(UILabel *)logTitleLabel{
    if (!_logTitleLabel) {
        _logTitleLabel = [self demoLabelByFont:UIFontWeightSemiboldSize(15)
                                         color:JobsWhiteColor
                                 numberOfLines:1];
        _logTitleLabel.byText(@"执行日志".tr);
    };return _logTitleLabel;
}

-(UILabel *)runtimeLogLabel{
    if (!_runtimeLogLabel) {
        _runtimeLogLabel = [self demoLabelByFont:fontName(@"Menlo-Regular", 12) ?: UIFontSystemFontOfSize(12)
                                           color:RGBA_COLOR(0.78 * 255.0, 0.85 * 255.0, 0.92 * 255.0, 1)
                                   numberOfLines:0];
    };return _runtimeLogLabel;
}

-(UIButton *)runDemoBtn{
    if (!_runDemoBtn) {
        @jobs_weakify(self)
        _runDemoBtn = [self demoButtonByTitle:@"重新执行注册流程"
                              backgroundColor:RGBA_COLOR(0.20 * 255.0, 0.49 * 255.0, 0.95 * 255.0, 1)
                                       action:^(__kindof UIButton * _Nullable button) {
            [weak_self runDemoAction];
        }];
    };return _runDemoBtn;
}

-(UIButton *)messageForwardBtn{
    if (!_messageForwardBtn) {
        @jobs_weakify(self)
        _messageForwardBtn = [self demoButtonByTitle:@"触发消息转发"
                                     backgroundColor:RGBA_COLOR(0.93 * 255.0, 0.42 * 255.0, 0.21 * 255.0, 1)
                                              action:^(__kindof UIButton * _Nullable button) {
            [weak_self messageForwardAction];
        }];
    };return _messageForwardBtn;
}

-(NSMutableArray<UIView *> *)stepCardMutArr{
    if (!_stepCardMutArr) {
        _stepCardMutArr = NSMutableArray.array;
    };return _stepCardMutArr;
}

-(NSMutableArray<UIView *> *)stepAccentViewMutArr{
    if (!_stepAccentViewMutArr) {
        _stepAccentViewMutArr = NSMutableArray.array;
    };return _stepAccentViewMutArr;
}

-(NSMutableArray<UILabel *> *)stepTitleLabMutArr{
    if (!_stepTitleLabMutArr) {
        _stepTitleLabMutArr = NSMutableArray.array;
    };return _stepTitleLabMutArr;
}

-(NSMutableArray<UILabel *> *)stepDetailLabMutArr{
    if (!_stepDetailLabMutArr) {
        _stepDetailLabMutArr = NSMutableArray.array;
    };return _stepDetailLabMutArr;
}

-(NSMutableArray<NSString *> *)runtimeLogMutArr{
    if (!_runtimeLogMutArr) {
        _runtimeLogMutArr = NSMutableArray.array;
    };return _runtimeLogMutArr;
}

@end
