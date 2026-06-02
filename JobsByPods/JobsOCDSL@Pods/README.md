# `JobsOCDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsOCDSL` 用来集中管理 Objective-C 项目里的点语法 DSL 分类，只放 `+DSL` 分类本身，不承接按钮辅助、布局工具、业务 UI 或其它非 DSL 支撑文件。

## 一、适用场景

- 对系统类或少量第三方 UI 类的方法做链式封装，例如 `UIView`、`UITableView`、`UIControl`、`ASButtonNode`。
- OC 侧 DSL 统一依赖 `JobsBlock` 提供 Block typedef，避免每个 Pod 自己散落定义。
- 原本散在其它本地 Pod 里的纯 DSL 分类逐步迁移到这里，调用方通过 `JobsOCDSL` 暴露。

## 二、目录结构

```text
JobsOCDSL@Pods/
├── Core/
│   ├── UIKit/
│   └── ThirdParty/
├── JobsOCDSL.h
├── JobsOCDSL.podspec
└── JobsPodspecKit.rb
```

## 三、引用方式

```objc
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
```

## 四、依赖关系

- `JobsBlock`：集中提供 OC Block 类型别名。
- `JobsOCDefs`：提供基础宏、枚举和颜色等定义。
- `JobsOCProtocols`：提供 DSL 协议边界。
- `Texture`：服务当前已迁入的 Texture DSL 分类。

## 五、风险说明

- 不把非 DSL 辅助文件迁入本 Pod；如果某个旧 `+DSL` 文件混入了业务辅助能力，需要先拆干净再迁入。
- 修改 `Core`、podspec 或依赖后，需要重新执行 `pod install --no-repo-update` 并检查依赖报告。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
