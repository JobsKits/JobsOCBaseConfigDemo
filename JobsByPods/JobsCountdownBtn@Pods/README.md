# `JobsCountdownBtn`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsCountdownBtn` 是验证码倒计时按钮 Pod，把 `UIButton+Timer` 的倒计时配置收口成一个可复用按钮。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认标题为 `获取验证码`。
- `verificationCodeButton` 在组件内订阅 `UIControlEventTouchUpInside` 的 RAC 信号；重复配置前会先释放旧订阅，不会叠加响应。
- 点击后先回调 `jobsCountdownClickBlock`，再启动倒计时。
- 倒计时期间显示 `N 秒`，结束后恢复默认标题。
- 默认标题使用紧凑 `10pt` 单行布局，在固定宽度内自动缩放，不换行放大。
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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
