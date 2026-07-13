# JobsOCKeyboardMgr

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsOCKeyboardMgr` 是 Jobs [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 项目里的键盘遮挡处理本地 Pod，用来保证当前激活的输入控件不会被软键盘或 `inputAccessoryView` 遮挡。

## 一、职责边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1.1、核心对象

- `JobsOCKeyboardConfig`：描述目标视图、触发输入控件、触发查找范围、容器、附属视图、输入流和生命周期 owner。
- `jobsMakeOCKeyboardConfig`：定义在 `Core/JobsOCKeyboardConfig` 并由本 Pod 聚合头导出，不再借道 `JobsMakes`。
- `JobsOCKeyboardCalculator`：基于系统键盘通知和当前 config 计算遮挡区域、触发控件 frame、位移值和动画参数。
- `JobsOCKeyboardResult`：承接计算结果，业务可通过 `resultBlock` 自定义处理。
- `JobsOCKeyboardMgr`：监听键盘通知，缓存最新键盘 frame，应用 transform 位移，处理可选的回车流转和空白收键盘。

### 1.2、目录结构

```text
JobsOCKeyboardMgr@Pods/
├── JobsOCKeyboardMgr.h
├── JobsOCKeyboardMgr.podspec
├── Core/
│   ├── JobsOCKeyboardCalculator/
│   ├── JobsOCKeyboardConfig/
│   ├── JobsOCKeyboardMgr/
│   └── JobsOCKeyboardResult/
└── README.md
```

## 二、推荐写法 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 2.1、页面配置

```objc
JobsOCKeyboardMgr.shared
    .byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
        data.byOwner(self)
            .byTargetView(self.contentView)
            .byTriggerScopeView(self.view)
            .byContainerView(self.view)
            .byInputFields(@[self.accountTF,self.passwordTF,self.codeTF])
            .byExtraSpacing(JobsWidth(16))
            .byTopSpacing(JobsWidth(12))
            .byShouldFlowByReturnKey(YES)
            .byShouldResignOnTouchOutside(YES)
            .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
    }));
```

### 2.2、页面清理

页面退出时按 owner 清理，避免旧页面误清掉新页面配置：

```objc
[JobsOCKeyboardMgr.shared clearConfigByOwner:self];
```

App 启动后全局开启监听：

```objc
JobsOCKeyboardMgr.shared.start();
```

## 三、配置说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、视图与生命周期

- `byOwner`：当前配置归属对象。多页面快速切换时，`clearConfigByOwner:` 只清理同一 owner 的配置。
- `byTargetView`：必填，真正要被移动的小窗、表单卡片或父视图。
- `byTriggerView`：可选，当前正在编辑、需要避让的输入控件。
- `byTriggerScopeView`：可选，自动查找 first responder 的范围；不传时默认在 `targetView` 内查找。
- `byContainerView`：可选，键盘 frame 坐标转换容器；不传时优先用 `targetView.window`。
- `byFollowViews`：跟随目标视图一起位移的视图，例如 logo、客服按钮。

### 3.2、输入流与附属视图

- `byInputFields`：按顺序声明输入框，用于软键盘 Return 跳转下一个输入框。
- `byShouldFlowByReturnKey`：开启后通过 `UIControlEventEditingDidEndOnExit` 做输入框流转，不抢业务 delegate。
- `byShouldResignOnTouchOutside`：开启后给容器加点击手势，点空白区域收起键盘，且不拦截 `UIControl` 点击。
- `byAccessoryPolicy`：控制 `inputAccessoryView` 是否纳入遮挡区域。
- `byResultBlock`：只想拿计算结果时可配合 `JobsOCKeyboardApplyModeNone` 自己处理位移。

## 四、设计边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、当前默认策略

- 默认位移方式是 `transform`，适合表单卡片、小窗、登录注册面板。
- 框架会在键盘隐藏、无需位移或 restore 后清理 transform 基准缓存，降低业务后续动画被旧基准覆盖的风险。
- 键盘通知到达时会先缓存最新键盘 frame；即使 config 稍后才设置，也能基于最新键盘状态重新计算。
- 本 Pod 直接依赖 `JobsBlock`、`JobsOCDSL`、`JobsOCDefs`；输入框回车流转的 target / action 通过 `byRemoveTarget` / `byAddTarget` 收口。

### 4.2、后续扩展方向

- `UIScrollView` 的 `contentInset` / `scrollRectToVisible` 不是当前默认模式；这类场景可先用 `resultBlock` 自定义，后续再扩展新的 `applyMode`。
- 如果输入控件被更深层业务组件包裹，优先由业务组件暴露真实 `UITextField` 后再传入 `byInputFields`。

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、轻量验证

```bash
git diff --check -- JobsByPods/JobsOCKeyboardMgr@Pods
rg -n -U "\\}\\n\\s*return\\b|\\}return\\b" JobsByPods/JobsOCKeyboardMgr@Pods --glob "*.m" --glob "*.mm"
```

### 5.2、工程验证

涉及 Pod 依赖或公开头变更后，再按工程需要执行 `pod install --no-repo-update` 和对应 scheme 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
