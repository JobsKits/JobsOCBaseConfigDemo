# JobsOCNumberStepper

`JobsOCNumberStepper` 是 Jobs Objective-C 工程使用的整数步进输入控件，统一封装“减号按钮 + 数字输入框 + 加号按钮”。

## 能力

- 输入框只接受合法整数。
- 下限与上限均可独立省略。
- 到达下限时减号按钮自动禁用并置灰；到达上限时加号按钮自动禁用并置灰。
- 点击按钮或输入有效值后，通过 `UIControlEventValueChanged` 对外通知。
- 设置值与修改边界时会自动收敛到当前有效区间。

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
