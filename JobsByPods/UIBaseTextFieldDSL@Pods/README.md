# `UIBaseTextFieldDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

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

<a id="jobs-architecture"></a>

## 八、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 8.1、设计目的与职责划分

将 JobsBaseUI 的具体输入框 DSL 从通用 JobsOCDSL 中分离。CJTextField、HQTextField、ZYTextField、JobsMagicTextField 各有专属配置，分类把这些配置接回对应输入框类型。

### 8.2、运行脉络

创建具体输入框 → 配置该类型的专属能力 → 接续通用视图配置 → 挂载与接收输入。

### 8.3、关键设计与边界

- 独立 Pod 是为了隔离对 JobsBaseUI 的依赖，不应为了复用而反向把具体输入框类型拉回通用 DSL。
- 删除代理、警告显示、清除按钮、文字/占位区域和占位动画是不同输入框的能力，不能假设每个子类都支持全部入口。
- 返回类型应保留具体输入框，避免链式调用中途失去子类能力。

### 8.4、阅读与重建顺序

先按分类所属类型阅读，再核对对应 JobsBaseUI 实现；重建时先有具体输入框，再添加 DSL 门面。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [UIBaseTextFieldDSL.h](<./UIBaseTextFieldDSL.h>)
- [Core/UIBaseTextField+DSL/UIBaseTextField+DSL.h](<./Core/UIBaseTextField+DSL/UIBaseTextField+DSL.h>)

依赖与编译入口：[UIBaseTextFieldDSL.podspec](<./UIBaseTextFieldDSL.podspec>)。其中显式依赖声明包括 `JobsBaseUI`、`JobsBlock`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
