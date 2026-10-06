# `JobsCryptography`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> 这份自述用于记录 `JobsCryptography` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsCryptography is a lightweight Objective-C utility collection for AES, DES, RSA, MD5, SHA, Base16/32/64/85, MIME, and hexadecimal conversions.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsCryptography` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Objective-C cryptography, digest, encoding, and data conversion helpers. |
| 首页 | [https://example.local/JobsCryptography](https://example.local/JobsCryptography) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsCryptography@Pods/JobsCryptography.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsCryptography` 相关能力。
- 当 `JobsCryptography` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsCryptography@Pods/
├── JobsCryptography.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsCryptography.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，86 个文件
├── LICENSE  # 许可证文件
└── Tests/  # 独立回归，3 个文件
```

- `JobsCryptography.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 86 个文件，其中源码 / 头文件 66 个；按 Jobs 规范，它是 `JobsCryptography` 对外公开 API 和核心实现的边界。
- 当前目录没有 `Support` 文件夹；如后续补内部兼容代码，优先放入 `Support` 并让 podspec 动态映射。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsCryptography.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsCryptography.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `UIKit`
- `Security`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBlock`
- `JobsMakes`
- `JobsOCDefs`
- `JobsByOCPods`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsCryptography/JobsCryptography.h>)
#import <JobsCryptography/JobsCryptography.h>
#else
#import "JobsCryptography.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsCryptography.h` 不是最终公开入口，请先修正 `JobsCryptography.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 0 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- podspec 未显式声明 `resources`，如新增图片、xib、bundle、json、plist 等资源，需要同步补齐。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsCryptography` 后，优先按风险从低到高验证：

```shell
ruby -c JobsCryptography.podspec
```

```shell
pod lib lint JobsCryptography.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 只有 podspec 指定的公开头进入外部 API 边界；新增 import 时要确认不会把私有实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

汇集摘要、编码和加解密接口，按算法及 NSData/NSString/UIImage 等适配对象分组。它包含系统密码库包装和历史算法实现，不能把所有算法都视为同等用途或同等来源。

### 10.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

明确摘要、编码或加解密需求 → 选择算法与数据表示 → 配置所需参数 → 执行转换 → 处理字节结果、编码和错误。

### 10.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Base 编码不是保密加密，摘要也不是可逆加密；README 中的旧名称需要结合实际方法理解。
- 算法模式、密钥、IV、填充及字符串编码共同决定互通，不能只写一个算法名称。
- 存在非 Jobs 版权/混合来源文件，重建范围仅限自维护封装；历史算法的存在不代表推荐用于新安全方案。

### 10.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先按用途选分组，再看参数和错误契约；采用系统或获准依赖实现算法，不从中文说明自行发明密码算法。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsCryptography.h](<./JobsCryptography.h>)
- [Core/HASH 信息摘要/MD5/MD5.h](<./Core/HASH 信息摘要/MD5/MD5.h>)
- [Core/加密（编码）算法/Cryptography/Cryptography.h](<./Core/加密（编码）算法/Cryptography/Cryptography.h>)
- [Core/加密（编码）算法/DES/DES.h](<./Core/加密（编码）算法/DES/DES.h>)
- [Core/加密（编码）算法/HexadecimalData/HexadecimalData.h](<./Core/加密（编码）算法/HexadecimalData/HexadecimalData.h>)

依赖与编译入口：[JobsCryptography.podspec](<./JobsCryptography.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsMakes`、`JobsOCDefs`、`JobsByOCPods`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十一、AES 格式和兼容迁移 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

新写入使用 `AES.encryptAuthenticated:password:error:` 或 [JobsAuthenticatedCipher](<./Core/JobsAuthenticatedCipher/JobsAuthenticatedCipher.h>)。文本格式为 `JobsAES2:` + 严格 Base64，二进制 envelope 包含 `JAE2`、大端 PBKDF2 轮数、16 字节 salt、16 字节 IV、AES256-CBC/PKCS7 密文及 32 字节 HMAC-SHA256。PBKDF2-HMAC-SHA256 默认 200000 轮，派生独立加密与认证密钥；每次生成随机 salt/IV，校验完整 envelope 后才解密。依赖系统 [**CommonCrypto**](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/CCCrypt.3cc.html) 与 Security，兼容 iOS 12。

单次明文最多 64 MiB；读取拒绝截断、错误版本、异常 KDF 轮数、错误密码、篡改和非 UTF-8 字符串。有效空明文返回 `@""`；失败返回 nil，并可通过 `error:` 区分原因。

旧 `AES.encrypt:password:` 继续生成既有格式，`AES.decrypt:password:` / `decryptCompatible:password:error:` 同时读取既有密文和新版本。识别到 `JobsAES` 前缀的内容只走版本解析，未知版本或认证失败不会降级尝试旧格式。旧协议不能自动改写：先成功读取旧数据，再由调用方写入新格式。历史固定 IV 和无认证格式只用于兼容已有数据；不要把偶然成功解密当作旧数据真实性证明。`aesEncryptString` / `aesDecryptString` 的固定 IV 格式也保留，非法 key 长度或输入返回 nil。

[兼容与认证回归](<./Tests/JobsCipherCompatibilityTests/JobsCipherCompatibilityTests.m>) 包含既有格式固定向量、空字符串、Unicode、随机性、错误密码、篡改和版本拒绝。`ruby Tests/run_regression.rb` 在 macOS 编译真实认证实现，检查上述新格式边界及 salt/IV/ciphertext/tag 篡改。

OC 老工程手工第三方目录里的 AES/AESCipher 保持原实现；仅独立的 `JobsAuthenticatedCipher` 源码集成 JobsMixFunc，不覆盖或 runtime 替换手工第三方类。

## 十二、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 86 | 66 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 3 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十三、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归、macOS 生产实现回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsCryptography
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsCryptography --simulator '<UDID>'
```

本地生产实现回归 harness：

```shell
ruby JobsByPods/JobsCryptography@Pods/Tests/run_regression.rb
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
