# `JobsCountdownBtn`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsCountdownBtn` 是验证码倒计时按钮 Pod，把 `UIButton+Timer` 的倒计时配置收口成一个可复用按钮。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认标题为 `获取验证码`。
- 点击后先回调 `jobsCountdownClickBlock`，再启动倒计时。
- 倒计时期间显示 `N 秒`，结束后恢复默认标题。
- 内部复用 `UIButton+Timer` 和 `JobsTimer`，不重复造定时器。

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
