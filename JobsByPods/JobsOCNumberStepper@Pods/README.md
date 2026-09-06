# JobsOCNumberStepper

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsOCNumberStepper` 是 Jobs Objective-C 工程使用的整数步进输入控件，统一封装“减号按钮 + 数字输入框 + 加号按钮”。

## 能力

- 输入框只接受合法整数。
- 下限与上限均可独立省略。
- 到达下限时减号按钮自动禁用并置灰；到达上限时加号按钮自动禁用并置灰。
- 点击按钮或输入有效值后，通过 `UIControlEventValueChanged` 对外通知。
- 设置值与修改边界时会自动收敛到当前有效区间。
- 减号、输入框、加号采用无间隙连体布局；输入框保留完整描边，仅减号左侧与加号右侧保留外圆角。

## 使用

```objc
JobsOCNumberStepper *stepper = JobsOCNumberStepper.new;
[stepper configureWithValue:4
               minimumValue:@4
               maximumValue:@8
                   stepValue:1];
stepper.onJobsChange(^(__kindof UIControl * _Nullable control) {
    JobsOCNumberStepper *stepper = (JobsOCNumberStepper *)control;
    JobsLog(@"当前值：%ld",(long)stepper.value);
});
```

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

将减号、整数输入框和加号封装为一个 UIControl，统一管理当前值、可选上下界和步长。按钮点击与文本输入最终进入同一数值收敛和界面更新流程。

### 1.2、运行脉络

点击加减或输入整数 → 校验并收敛到有效区间 → 更新文字与按钮禁用态 → 按要求发送 ValueChanged。

### 1.3、关键设计与边界

- 上下界均可独立省略，不能把 nil 当成零。
- 程序设置值可以选择是否发送事件，避免业务回写造成循环通知。
- 达到边界后按钮禁用状态必须与当前值同步。

### 1.4、阅读与重建顺序

先看 value/边界/步长，再看输入解析与 setValue:sendActions:；重建时先统一状态更新，再做连体外观。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsOCNumberStepper/JobsOCNumberStepper.h](<./Core/JobsOCNumberStepper/JobsOCNumberStepper.h>)
- [JobsOCNumberStepperHeader.h](<./JobsOCNumberStepperHeader.h>)

依赖与编译入口：[JobsOCNumberStepper.podspec](<./JobsOCNumberStepper.podspec>)。其中显式依赖声明包括 `Masonry`、`JobsBaseUI`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
