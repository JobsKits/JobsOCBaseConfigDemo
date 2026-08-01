# `JobsOCGraphicCaptcha`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> `JobsOCGraphicCaptcha` 是 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的图形验证码 Pod，负责字符池、随机验证码文本、大小写校验策略和验证码绘制视图。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCGraphicCaptcha` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Graphic captcha generator and view for Jobs projects. |
| podspec | `JobsByPods/JobsOCGraphicCaptcha@Pods/JobsOCGraphicCaptcha.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 注册、登录、找回密码等页面需要本地图形验证码时使用。
- 支持单独数字、单独汉字、单独英文、英文大小写敏感 / 不敏感、以及数字 / 英文 / 汉字混合模式。
- 两两混合：大写英文 + 小写英文、大写英文 + 数字、小写英文 + 数字、大写英文 + 汉字、小写英文 + 汉字、汉字 + 数字。
- 三三混合：大写英文 + 小写英文 + 数字、大写英文 + 小写英文 + 汉字、大写英文 + 数字 + 汉字、小写英文 + 数字 + 汉字。
- 全部混合：大写英文 + 小写英文 + 数字 + 汉字。
- 混合模式由 `characterUnits` 明确指定具体组合，`mixedGroupCount` 记录参与混合的类别数；生成时会保证每个被选中的字符组至少出现一次，不再临时随机决定是哪一种组合。
- `customCharacterGroups` 支持把业务语义字符池作为独立分组传入。例如认证组件把英文大小写合并成一个“英文组”，因此“数字 + 英文”仍按两类组合处理。
- 默认验证码长度为 `4`，可通过 `JobsOCGraphicCaptchaConfig.length` 手动调整。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCGraphicCaptcha@Pods/
├── JobsOCGraphicCaptcha.podspec
├── JobsOCGraphicCaptchaHeader.h
├── JobsPodspecKit.rb
├── LICENSE
├── README.md
└── Core/
    ├── JobsOCGraphicCaptchaConfig/
    │   ├── JobsOCGraphicCaptchaConfig.h
    │   └── JobsOCGraphicCaptchaConfig.m
    ├── JobsOCGraphicCaptchaGenerator/
    │   ├── JobsOCGraphicCaptchaGenerator.h
    │   └── JobsOCGraphicCaptchaGenerator.m
    ├── JobsOCGraphicCaptchaView/
        ├── JobsOCGraphicCaptchaView.h
        └── JobsOCGraphicCaptchaView.m
    └── JobsOCGraphicCaptchaView+DSL/
        ├── JobsOCGraphicCaptchaView+DSL.h
        └── JobsOCGraphicCaptchaView+DSL.m
```

## 四、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCGraphicCaptchaConfig`：配置验证码长度、字符单元、混合类别数、大小写校验策略、自定义字符池和自定义字符组；内置 `simplifiedChineseConfig`、`traditionalChineseConfig`、`twoMixedConfig`、`threeMixedConfig`、`fourMixedConfig`、`fullMixedConfig`，`chineseConfig` 保持为简繁体合集。
- `JobsOCGraphicCaptchaGenerator`：提供数字、小写英文、大写英文、简体汉字、繁体汉字五个独立字符池，并生成随机文本；单个 / 两两 / 三三 / 四四 / 全部混合分别有 `5 / 10 / 10 / 5 / 1` 种组合，补位字符只从已选类别中产生。
- `JobsOCGraphicCaptchaView`：绘制验证码文本、干扰线和噪点，支持点击刷新和输入校验；随机 HSB 颜色通过 `jobsMakeCor2` + `JobsCorModel` DSL 生成。
- `JobsOCGraphicCaptchaView+DSL`：为自建视图提供 `byFont(...)`，调用方不再直接写 `font =`。

## 五、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsOCGraphicCaptcha/JobsOCGraphicCaptchaHeader.h>)
#import <JobsOCGraphicCaptcha/JobsOCGraphicCaptchaHeader.h>
#else
#import "JobsOCGraphicCaptchaHeader.h"
#endif
```

```objc
JobsOCGraphicCaptchaView *captchaView = JobsOCGraphicCaptchaView.new;
captchaView.byFont(UIFontWeightSemiboldSize(16));
JobsOCGraphicCaptchaConfig *config = JobsOCGraphicCaptchaConfig.fourMixedConfig;
captchaView.config = config;
[captchaView refreshCaptcha];
BOOL passed = [captchaView validateInput:@"A8汉語"];
```

## 六、依赖关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 系统框架：`Foundation`、`UIKit`、`QuartzCore`
- 本地 Pod：`JobsOCDefs`、`JobsBlock`、`JobsModel`、`JobsModelDSL`

## 七、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsOCGraphicCaptcha.podspec
```

```shell
pod install --no-repo-update
```

- 改动 `Core`、podspec、依赖或公开头后，需要重新执行 [**CocoaPods**](https://cocoapods.org/) 集成验证。
- `simplifiedChineseCharacters` 与 `traditionalChineseCharacters` 分别维护常用简体、繁体字符；兼容入口 `chineseCharacters` 和 `JobsOCGraphicCaptchaCharacterUnitChinese` 会合并两者。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
