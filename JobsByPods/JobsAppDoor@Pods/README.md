# `JobsAppDoor`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> `JobsAppDoor` 将 `JobsAppDoorVC` 和 `JobsAppDoorVC_Style2` 两套注册、登录、忘记密码模板收口为独立 Pod。外部只需选择页面风格并传入 `JobsAppDoorConfig`，不再直接组装内部视图。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsAppDoor` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `iOS 12.0` |
| 入口 | `JobsAppDoor.h` |
| 页面模板 | `JobsAppDoorVC`、`JobsAppDoorVC_Style2` |

两套模板都是全屏认证页面，默认不安装系统或 GK 导航栏，也不显示导航标题和左上角返回按钮。

## 二、默认注册规则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsAppDoorConfig.defaultConfig` 只展示注册的三个基础字段：

1. 用户名。
2. 密码。
3. 二次确认密码。

手机号绑定与短信验证码、图形验证码都是可选能力，分别由 `showsMobileBinding` 和 `showsGraphicCaptcha` 控制。两套页面使用同一份配置语义，只保留动效和布局差异。

## 三、引用与基础用法 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsAppDoor/JobsAppDoor.h>)
#import <JobsAppDoor/JobsAppDoor.h>
#else
#import "JobsAppDoor.h"
#endif
```

第一套面板切换风格，使用默认基础注册表单：

```objc
JobsAppDoorConfig *config = JobsAppDoorConfig.defaultConfig;
JobsAppDoorVC *vc = [[JobsAppDoorVC alloc] initWithConfiguration:config];
```

第二套卡片横滑风格，开启手机绑定和图形验证码：

```objc
JobsAppDoorConfig *config = JobsAppDoorConfig.fullConfig;
JobsAppDoorVC_Style2 *vc = [[JobsAppDoorVC_Style2 alloc] initWithConfiguration:config];
```

也可继续使用项目统一的 `requestParams`。控制器会识别 `JobsAppDoorConfig`，同时保留旧版 `JobsAppDoorBgType` 数值参数的兼容解析。

## 四、可选手机绑定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
JobsAppDoorConfig *config = JobsAppDoorConfig.defaultConfig;
config.registerConfig.showsMobileBinding = YES;
```

开启后会同时加入手机号与短信验证码两个字段，并自动重算注册容器高度和位置。

## 五、图形验证码组合 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

认证模块将大写和小写字母统一视为“英文”一类。每个已选字符组都保证至少出现一次。

| 组合 | 工厂配置 |
| ---- | ---- |
| 数字 + 英文（含大小写） | `numberAndEnglishConfig` |
| 数字 + 中文 | `numberAndChineseConfig` |
| 英文（含大小写）+ 中文 | `englishAndChineseConfig` |
| 数字 + 英文（含大小写）+ 中文 | `allCharactersConfig` |

```objc
JobsAppDoorConfig *config = JobsAppDoorConfig.defaultConfig;
config.registerConfig.showsGraphicCaptcha = YES;
config.registerConfig.graphicCaptchaConfig = JobsAppDoorGraphicCaptchaConfig.numberAndEnglishConfig;
```

验证码长度和大小写校验策略可继续细化：

```objc
config.registerConfig.graphicCaptchaConfig.length = 6;
config.registerConfig.graphicCaptchaConfig.caseSensitive = YES;
```

## 六、背景配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `backgroundType`：选择图片或视频背景。
- `backgroundImageName`：图片资源名。
- `notchVideoResourceName`：刘海屏视频资源名。
- `compactVideoResourceName`：非刘海屏视频资源名。
- AppDoor-1、AppDoor-2 使用视频背景时，App 进入后台立即暂停播放；回到前台后，只恢复本次由后台切换自动暂停且仍处于可见窗口中的页面。

## 七、第一套面板的视觉规则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 输入框采用静态占位符；聚焦后由系统隐藏，不再叠加旧悬浮标签。
- 占位符与真实输入文字保持相同字号，颜色比真实文字更暗，避免两种状态混淆。
- 切换到注册态或键盘出现时隐藏 Logo；返回登录态且键盘收起后恢复。
- 登录态 Logo 使用 `150pt × 50pt` 横向比例；“记住我 / 忘记密码”按输入框中心线分栏，字号与 AppDoor-2 对齐为 `12pt`，图标使用 `14pt`，并强制单行显示。
- “去注册 / 返回登录”侧栏与“返回首页”统一使用 `UIFontWeightSemiboldSize(JobsWidth(15))`；字体同时写入 `UIButtonConfiguration` 兼容入口和标题标签，避免 iOS 16+ 回退成系统默认字体。注册输入框使用 `12pt` 纵向间距整体上提，提交按钮与最后一个输入框保留 `16pt` 间距，避免贴近面板底部。
- 手机号国家区号固定单行显示，使用紧凑 `12pt` 字号；注册提交按钮与上方输入框使用相同宽高和水平中线。
- “获取验证码”按钮默认宽度收紧为 `82pt`，标题使用 `10pt` 单行自适应；倒计时文案居中显示本地化的剩余时间。AppDoor-1 通过手机号 `rac_textSignal` 单向驱动按钮状态，手机号为空或倒计时执行中时禁用；组件点击同样使用 RAC 信号，启用后触发验证码回调和倒计时。AppDoor-2 当前不监控手机号，按钮保持可点击。
- “返回首页”固定跟在登录 / 注册提交按钮下方，不按切换前的面板高度缓存位置。
- “返回首页”从按钮当前可见标题和普通态标题中兼容识别动作，再调用控制器统一返回链；页面需要通过 `push` / `present` 进入，若业务把认证页直接设为根控制器，则必须由宿主提供首页替换逻辑，因为根控制器本身没有可返回目标。
- AppDoor-1、AppDoor-2 及共用忘记密码页的“在线客服”按钮统一使用同一枚耳麦客服头像前景图、双行文案和紧凑字号。
- 忘记密码页的密码输入框先完成明文 / 密文按钮挂载与内部文本信号初始化，再绑定外部密码一致性校验回调；初始渲染不得在懒加载属性赋值前触发校验，避免 getter 同步重入和约束引擎崩溃。

## 八、第二套卡片视觉规则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

第二套卡片横滑风格遵守以下页面级规则：

- 页面不创建或展示系统 / GK 导航栏，不保留导航标题和返回按钮；Logo 只服务初始登录卡片，切到注册或忘记密码卡片时立即隐藏，音量入口仍作为背景视频的独立悬浮控件存在。
- 登录态 Logo 使用 `82pt × 82pt` 正方形容器和等比缩放，禁止把正方形原图横向拉伸；用户名、密码、确认密码、短信验证码和图形验证码的占位文字与真实输入起点统一前移。手机号继续使用独立的国旗 / 区号复合布局，号码占位文字、光标与真实输入使用 `4pt` 内部起点，缩短和 `+86` 之间的空白。
- 登录卡片保留“返回首页”；注册卡片的提交按钮上移，并在其下方提供同样的“返回首页”。
- 注册卡片按字段数使用 `12pt` 纵向间距动态计算高度；标题、输入文字、占位符、切换栏与提交按钮使用更紧凑的字号，完整六字段表单也不再被上下边缘挤压。

## 九、目录边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsAppDoor@Pods/
├── JobsAppDoor.h
├── JobsAppDoor.podspec
├── Core/
│   ├── 登录注册模块公共件/
│   ├── JobsAppDoorStyle1/
│   └── JobsAppDoorStyle2/
├── Resource/
│   ├── AppDoor.xcassets
│   ├── Images/
│   └── Videos/
├── LICENSE
└── README.md
```

- `Core/登录注册模块公共件`：两套认证页面共用的资源访问、基础内容视图、忘记密码页、Logo、输入组件和配置模型。
- `Core/JobsAppDoorStyle1`：第一套面板变形动效和页面编排。
- `Core/JobsAppDoorStyle2`：第二套登录、注册卡片横滑实现。
- `Resource`：认证页面内部使用的图片和视频资源；Podspec 通过 `Resource` 分组映射真实目录，并由 `JobsAppDoorResource` 从 `JobsAppDoorResources.bundle` 统一读取，业务工程不需要再单独复制这批素材。

## 十、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 分别进入 AppDoor-1 和 AppDoor-2，点击“忘记密码”，确认页面首帧不崩溃；连续输入、删除两次密码，确认“确认”按钮仅在内容相同且非空时启用。

```shell
ruby -c JobsAppDoor.podspec
pod install --no-repo-update
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsAppDoor -sdk iphonesimulator build
```

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 11.1、设计目的与职责划分

将登录、注册、忘记密码及公共输入件分层，Style1 采用侧栏/面板切换，Style2 采用独立卡片横滑。公共层提供配置、资源与输入组件，验证码、倒计时、键盘和国家代码由独立 Pod 组合。

### 11.2、运行脉络

选择样式并注入配置 → 构建登录/注册输入内容 → 用户切换页面状态 → 校验并回调业务 → 根据结果更新界面。

下图用于说明主要关系；异常、退出与线程边界结合下一节阅读。

```mermaid
flowchart LR
    A["配置与公共表单"] --> B{"选择样式"}
    B --> C["Style1 侧轨面板"]
    B --> D["Style2 独立卡片"]
    C --> E["登录、注册、找回密码模式"]
    D --> E
    E --> F["收集输入并分发动作"]
    F --> G["宿主执行认证业务"]
```

### 11.3、关键设计与边界

- 两套样式共享公共能力，但切换布局与运动方式不同，不能只换颜色。
- 认证页面只收集输入并分发业务动作，真实账号认证仍需宿主接入。
- 资源统一放在 JobsAppDoorResources.bundle；键盘跟随与页面切换需要协调，不能让旧状态继续驱动新卡片。
- Style2 的 Logo 只属于初始登录态，注册/忘记密码和返回首页的行为需按原文保持。

### 11.4、阅读与重建顺序

先读配置和公共输入件，再分别跟踪 Style1/Style2 的切换，最后组合验证码、倒计时、键盘与业务回调。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsAppDoor.h](<./JobsAppDoor.h>)
- [Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.h](<./Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.h>)
- [Core/登录注册模块公共件/View/BaseContentView/BaseContentView.h](<./Core/登录注册模块公共件/View/BaseContentView/BaseContentView.h>)
- [Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.h](<./Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.h>)
- [Core/登录注册模块公共件/View/JobsAppDoorInputViewBaseStyle/JobsAppDoorInputViewBaseStyle.h](<./Core/登录注册模块公共件/View/JobsAppDoorInputViewBaseStyle/JobsAppDoorInputViewBaseStyle.h>)

依赖与编译入口：[JobsAppDoor.podspec](<./JobsAppDoor.podspec>)。其中显式依赖声明包括 `Masonry`、`ReactiveObjC`、`ZFPlayer`、`JobsBlock`、`JobsMakes`、`JobsModel`、`JobsModelDSL`、`JobsOCDSL`、`JobsBaseUI`、`UIBaseTextFieldDSL`、`JobsOCDefs`、`JobsCountdownBtn`、`JobsOCGraphicCaptcha`、`JobsOCKeyboardMgr`、`JobsByOCPods`、`JobsOCTools`、`JobsHotLabel`、`JobsDeviceInfo`、`JobsOCProtocols`、`JobsLanMgr`、`JobsOCCountryCodeCtrl`、`JobsFuseAnimation`、`ZFPlayerExtra`、`XYColorOC`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
