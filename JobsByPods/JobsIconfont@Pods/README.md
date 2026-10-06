# <span id="前言">JobsIconfont</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsIconfont` 是面向 Objective-C iOS 业务层的 iconfont 全功能门面。业务代码只使用框架提供的资源常量或语义枚举，不直接维护 URL、Unicode、字体文件名、SDWebImage 配置和错误兜底。

## 一、能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 远程图片加载前立即显示本地 icon font 占位图，成功后替换，失败后保留兜底图。
- `UIImageView` 复用时取消旧任务，并按每次请求 UUID 拦截过期回调。
- 统一清理 SDWebImage 内存与磁盘缓存。
- CoreText 动态注册图标字体与阿里妈妈文字字体。
- 统一输出 `UILabel`、`UIButton` 和 `UIImage`。

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 项目需要把 iconfont 上选定的远程图片作为运行时资源，并保留本地首帧占位和错误兜底。
- 多个页面共享同一套图标字体、文字字体和缓存策略。
- 业务代码不希望持有 CDN 地址、Unicode、PostScript 名称或具体缓存实现。

## 三、目录与职责 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsIconfont@Pods
├── Core/JobsIconfont/            # 公开门面、语义类型、加载与 UIKit 分类
├── Resource/  # 非代码资源，3 个文件
├── JobsIconfontHeader.h          # Pod 聚合头
├── JobsIconfont.podspec          # 源码、资源 bundle 和依赖声明
├── README.md
└── Tests/  # 独立回归，2 个文件
```

- `Core` 是唯一代码入口；公开层只暴露语义资源、图标枚举、字体 / 图片输出与加载结果。
- `Resource` 只保存框架内置资源和治理清单，不由业务层直接读取。
- URL、Unicode、字体内部名称、资源 bundle 查找和 SDWebImage 配置均为私有实现。

## 四、依赖与引用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 直接依赖 `SDWebImage`，统一由 `JobsIconfontManager` 管理请求、缓存和取消。
- 通过 `Podfile.deps` 的本地路径接入，安装后使用 `#import <JobsIconfont/JobsIconfontHeader.h>`。
- Pod 内动态注册字体，无需在业务工程的 `Info.plist` 维护 `UIAppFonts`。

## 五、最小使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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

## 六、验证与风险 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 修改 podspec 或资源后执行 `pod ipc spec JobsIconfont.podspec`、`pod install --no-repo-update`，并检查 `PodspecDependencyReport`。
- 远程资源仍受网络与 CDN 可用性影响；框架保证失败时保留本地兜底，不保证第三方地址永久有效。
- 字体授权、商用范围与再分发条件必须以资源清单记录的官方来源为准；替换资源时同步更新清单和 Demo。

<a id="jobs-architecture"></a>

## 七、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 7.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

集中管理字体图标的语义枚举、字体获取与资源加载结果。Manager 负责资源访问，LoadResult 描述加载阶段、缓存命中和错误，LoadToken 提供取消入口，调用方消费字体或图像。

### 7.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

按语义选择图标/资源 → 管理器加载或读取缓存 → 产生结果与阶段信息 → 更新使用方；不再需要时取消。

### 7.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 图标语义、字形与字体文件必须对应，枚举名称正确不代表资源已注册。
- 取消令牌属于某次加载，不能拿旧令牌控制另一项任务。
- 缓存命中、成功和失败是不同信息；重建时要保留加载结果中的可观察状态。

### 7.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Glyph/RemoteAsset 与资源映射，再看 Manager、LoadResult、LoadToken；最后连接 UI 使用点。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsIconfont/JobsIconfont.h](<./Core/JobsIconfont/JobsIconfont.h>)
- [JobsIconfontHeader.h](<./JobsIconfontHeader.h>)

依赖与编译入口：[JobsIconfont.podspec](<./JobsIconfont.podspec>)。其中根级依赖声明包括 `SDWebImage`、`JobsBlock`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 八、取消与复用契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsIconfontLoadToken.cancel`、`jobsCancel()` 与释放清理共用一次性取消入口；并发取消最多领取一次回调，保存的取消 Block 在 token 释放后可安全调用。取消回调若用于 UI，调用方仍须在主线程执行。

图片加载以每次请求的 UUID 隔离，重复加载同一个资源也不会接受旧请求的完成回调。过期 token 不能取消图片视图的新请求；占位回调中立即取消或再次加载时，外层请求也不会继续启动。`loadAsset:intoImageView:...` 和图片视图操作在主线程调用。

[生命周期回归](<./Tests/JobsIconfontLifecycleTests/JobsIconfontLifecycleTests.m>) 当前4项：主动/释放取消、并发取消、保存 Block 后释放 owner，以及实际 SDWebImage 管线中的首次加载、同资源替换、过期 token、取消后迟到完成和 imageView 释放。新增场景通过公开 optionsProcessor/SDImageLoader 控制图片 IO，保留真实 Jobs manager 和 SDK 分派/取消，不访问 CDN；结束时恢复 SDK 配置。UI 操作在主线程；创建、SDK 回调与取消的完整生命周期使用显式自动释放池，等待真实 imageView 析构后再断言弱引用及迟到完成。运行结果由本 README 的统一验收区块记录。真实 CDN、失败恢复和缓存仍需网络集成验证。

## 九、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 2 | 2 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 3 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级命名资源 bundle：`JobsIconfontAssets.bundle`；已有运行资源保持各自 bundle 查找合同。

## 十、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsIconfont
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsIconfont --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
