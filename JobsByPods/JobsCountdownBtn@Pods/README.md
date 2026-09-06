# `JobsCountdownBtn`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsCountdownBtn` 是验证码倒计时按钮 Pod，把 `UIButton+Timer` 的倒计时配置收口成一个可复用按钮。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认标题为 `获取验证码`。
- `verificationCodeButton` 在组件内订阅 `UIControlEventTouchUpInside` 的 RAC 信号；重复配置前会先释放旧订阅，不会叠加响应。
- 点击后先回调 `jobsCountdownClickBlock`，再启动倒计时。
- 倒计时期间居中显示本地化的剩余时间，例如中文 `还剩 49 秒`、英文 `49 sec left`，结束后恢复默认标题。
- 默认标题使用紧凑 `10pt` 单行布局，在固定宽度内自动缩放；旧标题层与 iOS 16+ `UIButtonConfiguration` 标题管线都禁止换行。
- 内部复用 `UIButton+Timer` 和 `JobsTimer`，不重复造定时器。
- 默认标题色通过 `JobsOCDefs` 的 `RGBA_COLOR` 工厂表达，输入继续使用 0～255 分量语义。

依赖：`JobsBlock`、`JobsOCDefs`、`JobsByOCPods`、`JobsOCTimer`、`JobsLanMgr`。

## 二、接入示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsCountdownBtn/JobsCountdownBtn.h>

JobsCountdownBtn *button = [JobsCountdownBtn verificationCodeButton];
[button byJobsCountdownDuration:60];
[button byJobsCountdownClickBlock:^(id data) {
    JobsLog(@"获取验证码");
}];
```

## 三、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsCountdownBtn.podspec
```

```shell
pod install --no-repo-update
```

<a id="jobs-architecture"></a>

## 四、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 4.1、设计目的与职责划分

把验证码按钮的普通标题、倒计时标题、点击回调与计时生命周期封装在 UIButton 子类。JobsOCTimer 驱动倒计时，JobsLanMgr 提供文字表达，按钮不负责发送短信请求。

### 4.2、运行脉络

配置普通标题与时长 → 业务决定启动倒计时 → 定时更新剩余时间和按钮状态 → 结束后恢复普通标题。

### 4.3、关键设计与边界

- 点击业务回调与开始计时有独立入口，重建时需明确验证码请求成功/失败与计时启动的关系。
- 重复开始、重新配置时长和恢复标题要分别处理，不能只追加另一个 timer。
- 代码创建与 nib 唤醒最终都需要建立一致的默认配置。

### 4.4、阅读与重建顺序

先看验证码按钮工厂和默认值，再看 jobsStartCountdown、标题生成与重置；外部请求留给宿主。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsCountdownBtn.h](<./JobsCountdownBtn.h>)
- [Core/JobsCountdownBtn/JobsCountdownButton/JobsCountdownButton.h](<./Core/JobsCountdownBtn/JobsCountdownButton/JobsCountdownButton.h>)

依赖与编译入口：[JobsCountdownBtn.podspec](<./JobsCountdownBtn.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsOCDefs`、`JobsByOCPods`、`JobsOCTimer`、`JobsLanMgr`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
