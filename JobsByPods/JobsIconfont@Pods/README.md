# JobsIconfont

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsIconfont` 是面向 Objective-C iOS 业务层的 iconfont 全功能门面。业务代码只使用框架提供的资源常量或语义枚举，不直接维护 URL、Unicode、字体文件名、SDWebImage 配置和错误兜底。

## 能力

- 远程图片加载前立即显示本地 icon font 占位图，成功后替换，失败后保留兜底图。
- `UIImageView` 复用时取消旧任务，并按资源 ID 拦截过期回调。
- 统一清理 SDWebImage 内存与磁盘缓存。
- CoreText 动态注册图标字体与阿里妈妈文字字体。
- 统一输出 `UILabel`、`UIButton` 和 `UIImage`。

## 适用场景

- 项目需要把 iconfont 上选定的远程图片作为运行时资源，并保留本地首帧占位和错误兜底。
- 多个页面共享同一套图标字体、文字字体和缓存策略。
- 业务代码不希望持有 CDN 地址、Unicode、PostScript 名称或具体缓存实现。

## 目录与职责

```text
JobsIconfont@Pods
├── Core/JobsIconfont/            # 公开门面、语义类型、加载与 UIKit 分类
├── Resource/                     # 本地字体、资源来源与校验信息
├── JobsIconfontHeader.h          # Pod 聚合头
├── JobsIconfont.podspec          # 源码、资源 bundle 和依赖声明
└── README.md
```

- `Core` 是唯一代码入口；公开层只暴露语义资源、图标枚举、字体 / 图片输出与加载结果。
- `Resource` 只保存框架内置资源和治理清单，不由业务层直接读取。
- URL、Unicode、字体内部名称、资源 bundle 查找和 SDWebImage 配置均为私有实现。

## 依赖与引用

- 直接依赖 `SDWebImage`，统一由 `JobsIconfontManager` 管理请求、缓存和取消。
- 通过 `Podfile.deps` 的本地路径接入，安装后使用 `#import <JobsIconfont/JobsIconfontHeader.h>`。
- Pod 内动态注册字体，无需在业务工程的 `Info.plist` 维护 `UIAppFonts`。

## 最小使用

```objc
[self.iconView byJobsIconfontAsset:JobsIconfontRemoteAssetLogo
                        targetSize:CGSizeMake(96, 96)
                      forceRefresh:NO
                        completion:^(JobsIconfontLoadResult *result) {
    NSLog(@"%@", result.loaderName);
}];

[self.glyphLabel byJobsIconfontGlyph:JobsIconfontGlyphVerified
                                size:28
                               color:UIColor.systemBlueColor];

[JobsIconfontManager.shared clearImageCache:nil];
```

内置资源的官方来源与字体转换记录见 `Resource/JobsIconfontCatalog.json`。框架不会在 App 运行时抓取 iconfont 网页，也不依赖登录态或未公开接口。

## 验证与风险

- 修改 podspec 或资源后执行 `pod ipc spec JobsIconfont.podspec`、`pod install --no-repo-update`，并检查 `PodspecDependencyReport`。
- 远程资源仍受网络与 CDN 可用性影响；框架保证失败时保留本地兜底，不保证第三方地址永久有效。
- 字体授权、商用范围与再分发条件必须以资源清单记录的官方来源为准；替换资源时同步更新清单和 Demo。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

集中管理字体图标的语义枚举、字体获取与资源加载结果。Manager 负责资源访问，LoadResult 描述加载阶段、缓存命中和错误，LoadToken 提供取消入口，调用方消费字体或图像。

### 1.2、运行脉络

按语义选择图标/资源 → 管理器加载或读取缓存 → 产生结果与阶段信息 → 更新使用方；不再需要时取消。

### 1.3、关键设计与边界

- 图标语义、字形与字体文件必须对应，枚举名称正确不代表资源已注册。
- 取消令牌属于某次加载，不能拿旧令牌控制另一项任务。
- 缓存命中、成功和失败是不同信息；重建时要保留加载结果中的可观察状态。

### 1.4、阅读与重建顺序

先看 Glyph/RemoteAsset 与资源映射，再看 Manager、LoadResult、LoadToken；最后连接 UI 使用点。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsIconfont/JobsIconfont.h](<./Core/JobsIconfont/JobsIconfont.h>)
- [JobsIconfontHeader.h](<./JobsIconfontHeader.h>)

依赖与编译入口：[JobsIconfont.podspec](<./JobsIconfont.podspec>)。其中显式依赖声明包括 `SDWebImage`、`JobsBlock`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
