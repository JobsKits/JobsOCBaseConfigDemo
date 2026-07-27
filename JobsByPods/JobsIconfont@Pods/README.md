# JobsIconfont

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
