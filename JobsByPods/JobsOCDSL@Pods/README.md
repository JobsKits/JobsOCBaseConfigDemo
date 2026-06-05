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
- 对照 Swift 侧 `JobsSwiftDSL` 的 [**SnapKit**](https://github.com/SnapKit/SnapKit) 链式封装，OC 侧通过 [**Masonry**](https://github.com/SnapKit/Masonry) 补齐 `byAddTo`、`byMakeConstraints`、`byUpdateConstraints`、`byRemakeConstraints`。
- 对照 Swift 侧 `BMPlayer+DSL`、`GKNavigationBarSwift+DSL`、`YTKNetwork+DSL`，OC 侧分别补齐当前工程实际使用的 `ZFPlayer`、`GKNavigationBar`、`YTKNetwork` 链式入口；其中 `GKNavigationBar` 的手势配置在 OC 版里属于 `GKGestureHandleConfigure`。

## 二、目录结构

```text
JobsOCDSL@Pods/
├── Core/
│   ├── UIKit/
│   └── ThirdParty/
│       ├── GKNavigationBar/
│       │   ├── GKGestureHandleConfigure/
│       │   └── GKNavigationBarConfigure/
│       ├── Masonry/
│       ├── Texture/
│       ├── YTKNetwork/
│       └── ZFPlayer/
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
- `GKNavigationBar`：服务 OC 侧导航栏全局配置 DSL。
- `Masonry`：服务 OC 侧约束链式 DSL。
- `Texture`：服务当前已迁入的 Texture DSL 分类。
- `YTKNetwork`：服务请求、批量请求、链式请求 DSL。
- `ZFPlayer`：服务 OC 侧播放器 DSL，对齐 Swift 项目中的 `BMPlayer+DSL` 职责。

## 五、Masonry 链式约束

- `UIView+MasonryDSL` 只做公共链式入口，不承接旧 Pod 私有的网格算法、约束动画和 `masonryBlock` 存储。
- 推荐写法是先调用本层类型 DSL，再调用 `UIView` / `Masonry` 父层 DSL。比如 `UILabel` 先写 `byText`、`byFont`、`byTextAlignment`，最后再写 `byAddTo` 或 `byMakeConstraints`，避免父类方法返回 `UIView` 后丢失 `UILabel` 本层链式能力。

  ```objc
  UILabel *label = UILabel.alloc.init
      .byText(@"Demo")
      .byFont([UIFont systemFontOfSize:16])
      .byTextAlignment(NSTextAlignmentCenter)
      .byAddTo(self.view, ^(MASConstraintMaker *make) {
          make.center.equalTo(self.view);
          make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(20)));
      });
  ```

## 六、第三方 DSL 对照

| Swift DSL | OC 侧 DSL | 说明 |
| --- | --- | --- |
| `SnapKit+DSL` | `Masonry/UIView+MasonryDSL` | 约束创建、更新、重建与添加到父视图。 |
| `BMPlayer+DSL` | `ZFPlayer/ZFPlayerController+DSL`、`ZFAVPlayerManager+DSL` | OC 工程使用 `ZFPlayer`，不硬引 Swift-only 的 `BMPlayer`。 |
| `GKNavigationBarSwift+DSL` | `GKNavigationBar/GKNavigationBarConfigure+DSL`、`GKGestureHandleConfigure+DSL` | 全局导航栏背景、标题、返回按钮、间距、状态栏、手势和转场参数配置。 |
| `YTKNetwork+DSL` | `YTKBaseRequest+DSL`、`YTKBatchRequest+DSL`、`YTKChainRequest+DSL` | 请求配置、成功失败回调、启动停止、批量和链式请求，并补齐 `jobs_requests` 等语义访问。 |

- Swift 可以通过参数重载复用 `byBack(...)` 这类方法名；OC 侧不能只靠 Block 返回类型重载，所以图片别名使用 `byBack`，返回样式继续使用 `byBackStyle`，组合式配置使用 `byBackPreset`。

## 七、风险说明

- 不把非 DSL 辅助文件迁入本 Pod；如果某个旧 `+DSL` 文件混入了业务辅助能力，需要先拆干净再迁入。
- 修改 `Core`、podspec 或依赖后，需要重新执行 `pod install --no-repo-update` 并检查依赖报告。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
