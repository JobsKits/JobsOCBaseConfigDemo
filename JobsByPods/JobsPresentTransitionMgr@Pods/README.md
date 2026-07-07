# `JobsPresentTransitionMgr`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这份自述用于记录 `JobsPresentTransitionMgr` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsPresentTransitionMgr` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Custom present transition manager for Jobs projects. |
| podspec | `JobsByPods/JobsPresentTransitionMgr@Pods/JobsPresentTransitionMgr.podspec` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 通过 `UIModalPresentationCustom` 呈现任意 `UIViewController`。
- 支持 `JobsTransitionDirectionTop / Bottom / Left / Right` 四方向进入，并从同方向退出。
- 外部只需要传入待呈现 VC；动画时间、方向、推出比例都有默认值。
- 默认值：`direction = JobsTransitionDirectionBottom`、`time = 0.35`、`presentedRatio = 0.5`。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsPresentTransitionMgr@Pods/
├── JobsPresentTransitionMgr.podspec
├── JobsPresentTransitionMgrHeader.h
├── README.md
├── JobsPodspecKit.rb
├── Core/
│   ├── JobsPresentTransitionMgr/
│   └── UIViewController+JobsPresentTransition/
└── LICENSE
```

## 四、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、公开头文件

- `JobsPresentTransitionMgrHeader.h`
- `Core/**/*.h`

### 4.2、核心 API

```objc
[self jobs_presentViewController:vc
                       configure:^(__kindof JobsPresentTransitionMgr * _Nullable manager) {
    manager.direction = JobsTransitionDirectionBottom;
    manager.time = 0.35;
    manager.presentedRatio = 0.5;
} completion:nil];
```

### 4.3、Pod 依赖

- `JobsBlock`
- `JobsMakes`
- `JobsOCDefs`
- `JobsOCDSL`

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsPresentTransitionMgr` 后，优先按风险从低到高验证：

```shell
ruby -c JobsPresentTransitionMgr.podspec
```

```shell
pod install --no-repo-update
```

- 修改 `Podfile.deps` 后需要重新执行 `pod install --no-repo-update` 才会进入 `Pods.xcodeproj`。
- 若未执行 `pod install`，`Podfile.lock`、`Pods/` 和 `PodspecDependencyReport` 仍可能保留旧状态。

## 六、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `transitioningDelegate` 是弱引用，`JobsPresentTransitionMgr` 会关联到 presented VC，保证 present 生命周期内不提前释放。
- `presentedRatio` 对上下方向表示高度比例，对左右方向表示宽度比例。
- 如果外部没有设置比例，但 presented VC 已设置 `preferredContentSize` 或兼容字段 `presentUpHeight`，会优先按内容尺寸换算比例。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
