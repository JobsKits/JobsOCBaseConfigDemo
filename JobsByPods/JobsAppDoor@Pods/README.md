# `JobsAppDoor`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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

## 七、第一套面板的视觉规则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 输入框采用静态占位符；聚焦后由系统隐藏，不再叠加旧悬浮标签。
- 占位符与真实输入文字保持相同字号，颜色比真实文字更暗，避免两种状态混淆。
- 切换到注册态或键盘出现时隐藏 Logo；返回登录态且键盘收起后恢复。
- 登录态 Logo 使用 `150pt × 50pt` 横向比例；“记住我 / 忘记密码”按输入框中心线分栏，字号与 AppDoor-2 对齐为 `12pt`，图标使用 `14pt`，并强制单行显示。
- “去注册 / 返回登录”侧栏与“返回首页”统一使用 `UIFontWeightSemiboldSize(JobsWidth(15))`；字体同时写入 `UIButtonConfiguration` 兼容入口和标题标签，避免 iOS 16+ 回退成系统默认字体。注册输入框使用 `12pt` 纵向间距整体上提，提交按钮与最后一个输入框保留 `16pt` 间距，避免贴近面板底部。
- 手机号国家区号固定单行显示，使用紧凑 `12pt` 字号；注册提交按钮与上方输入框使用相同宽高和水平中线。
- “获取验证码”按钮默认宽度收紧为 `82pt`，标题使用 `10pt` 单行自适应；AppDoor-1 通过手机号 `rac_textSignal` 单向驱动按钮状态，手机号为空或倒计时执行中时禁用；组件点击同样使用 RAC 信号，启用后触发验证码回调和倒计时。AppDoor-2 当前不监控手机号，按钮保持可点击。
- “返回首页”固定跟在登录 / 注册提交按钮下方，不按切换前的面板高度缓存位置。
- “返回首页”从按钮当前可见标题和普通态标题中兼容识别动作，再调用控制器统一返回链；页面需要通过 `push` / `present` 进入，若业务把认证页直接设为根控制器，则必须由宿主提供首页替换逻辑，因为根控制器本身没有可返回目标。
- AppDoor-1、AppDoor-2 及共用忘记密码页的“在线客服”按钮统一使用同一枚耳麦客服头像前景图、双行文案和紧凑字号。

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
│   ├── JobsAppDoor/
│   └── JobsAppDoorStyle2/
├── Resource/
│   ├── AppDoor.xcassets
│   ├── Images/
│   └── Videos/
├── LICENSE
└── README.md
```

- `Core/JobsAppDoor`：第一套面板变形动效、公共输入组件、忘记密码和所有配置模型。
- `Core/JobsAppDoorStyle2`：第二套登录、注册卡片横滑实现。
- `Resource`：认证页面内部使用的图片和视频资源；由 `JobsAppDoorResource` 从 `JobsAppDoorCore.bundle` 统一读取，业务工程不需要再单独复制这批素材。

## 十、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsAppDoor.podspec
pod install --no-repo-update
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsAppDoor -sdk iphonesimulator build
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
