# `UIBaseTextFieldDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `UIBaseTextFieldDSL` 是从 `JobsOCDSL/Core/ThirdParty/UIBaseTextField+DSL` 独立出来的本地 Pod，专门承接 `JobsBaseUI` 文本框族的链式 DSL。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 为 `CJTextField`、`HQTextField`、`ZYTextField`、`JobsMagicTextField`、`JobsTextField` 提供 Jobs 风格链式调用入口。
- 依赖 `JobsBaseUI`，不再把 `JobsBaseUI` 特有文本框 DSL 混在 `JobsOCDSL` 里。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
UIBaseTextFieldDSL@Pods/
├── Core/
│   ├── UIBaseTextField+DSL.h
│   └── UIBaseTextField+DSL.m
├── LICENSE
├── README.md
├── UIBaseTextFieldDSL.h
└── UIBaseTextFieldDSL.podspec
```

## 三、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `UIBaseTextFieldDSL.h` 是根入口头文件。
- `Core/UIBaseTextField+DSL.h` 暴露文本框族分类方法。
- `Core/UIBaseTextField+DSL.m` 承接分类实现。

## 四、依赖关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBaseUI`：提供文本框族主类。
- `JobsBlock`：提供 DSL Block typedef。
- `JobsOCDefs`：提供 Jobs 宏和基础定义。

## 五、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<UIBaseTextFieldDSL/UIBaseTextFieldDSL.h>)
#import <UIBaseTextFieldDSL/UIBaseTextFieldDSL.h>
#else
#import "UIBaseTextFieldDSL.h"
#endif
```

## 六、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c UIBaseTextFieldDSL.podspec
```

```shell
pod lib lint UIBaseTextFieldDSL.podspec --allow-warnings --verbose
```

## 七、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本 Pod 依赖 `JobsBaseUI`，不要让 `JobsBaseUI` 反向依赖本 Pod。
- `JobsOCDSL` 不再直接包含这组源码，使用方如需文本框族 DSL，应通过 Pod 依赖加载本 Pod。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
