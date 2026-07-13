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

- `JobsOCGraphicCaptchaConfig`：配置验证码长度、字符单元、混合类别数、大小写校验策略和自定义字符池；`mixedConfig` 为大写英文 + 小写英文 + 数字 + 汉字四类全混，具体两类或三类组合通过 `characterUnits` 精确指定。
- `JobsOCGraphicCaptchaGenerator`：提供数字、小写英文、大写英文、汉字四个独立字符池，并生成随机文本。
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
JobsOCGraphicCaptchaConfig *config = JobsOCGraphicCaptchaConfig.defaultConfig;
config.characterUnits = JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber;
config.mixedGroupCount = 2;
captchaView.config = config;
[captchaView refreshCaptcha];
BOOL passed = [captchaView validateInput:@"A3"];
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
- 汉字池使用 `0x4E00...0x9FA5` 的 CJK 常用汉字区间；如需要扩展到补充平面，可在 `JobsOCGraphicCaptchaGenerator` 中统一扩展。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
