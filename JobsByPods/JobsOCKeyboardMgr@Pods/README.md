# JobsOCKeyboardMgr

`JobsOCKeyboardMgr` 是 Jobs 项目里的键盘遮挡处理本地 Pod。

它只做三件事：

- `JobsOCKeyboardConfig`：描述目标视图、当前触发输入控件、容器、键盘附属视图、间距和应用方式。
- `JobsOCKeyboardCalculator`：基于系统键盘通知计算是否遮挡，以及需要位移多少。
- `JobsOCKeyboardMgr`：监听键盘生命周期，按 `JobsOCKeyboardResult` 抬起或复位目标视图。

业务侧推荐写法：

```objc
JobsOCKeyboardMgr.shared
    .byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
        data.byTargetView(self.contentView)
            .byTriggerView(self.textField)
            .byContainerView(self.view)
            .byExtraSpacing(16)
            .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
    }));
```

`byTargetView` 必填，表示真正要被移动的小窗或父视图；`byTriggerView` 可选，表示当前正在编辑、需要避免被遮挡的输入控件。未显式传入时，`JobsOCKeyboardMgr` 会自动从 `targetView` 内寻找当前 first responder。若当前输入控件带有 `inputAccessoryView`，自动模式会把它纳入键盘遮挡区域；也可以通过 `byAccessoryView` 或 `byAccessoryHeight` 显式声明。
