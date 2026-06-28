# `CodeX+UnderstandAnything.command`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这个脚本用于在需要时，通过 [**Codex**](https://openai.com/codex) + [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 为 [**Xcode**](https://developer.apple.com/xcode) / iOS 工程生成代码图谱。  
> 它不是 `pod install` 高频流程的一部分，也不会默认在每次安装依赖时消耗 AI 算力。  

## 一、脚本用途 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `CodeX+UnderstandAnything.command` 负责在本地 MacOS 环境中辅助启动 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 的代码图谱生成流程。
- 脚本会先寻找当前 [**Xcode**](https://developer.apple.com/xcode) / iOS 工程根目录，再检查 [**Codex**](https://openai.com/codex) 和 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 是否可用。
- 找到工程后，脚本会打印识别到的 `.xcworkspace` 或 `.xcodeproj` 全名和路径，并等待用户回车确认。
- [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 没有安装时，脚本会自动安装到 [**Codex**](https://openai.com/codex)。
- [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 已经安装时，脚本会提示是否升级：

  ```text
  直接回车：跳过升级
  输入任意字符后回车：执行升级
  ```

- 脚本最后会用日志形式打印 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 在 [**Codex**](https://openai.com/codex) 里的具体使用方式：

  ```text
  /understand --language zh
  /understand-dashboard
  ```

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 适合以下场景：

  | 场景 | 是否适合 | 说明 |
  | --- | --- | --- |
  | 第一次接手大型 iOS 工程 | 适合 | 用代码图谱快速理解模块、类、函数和依赖关系。 |
  | 需要给别人讲项目结构 | 适合 | 可以通过 Dashboard 辅助说明工程结构。 |
  | 重构前分析影响范围 | 适合 | 先生成图谱，再让 AI 辅助理解调用链。 |
  | 每次 `pod install` 后自动执行 | 不适合 | [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 需要 AI 算力，不适合高频无感触发。 |
  | Codex 无额度 / 未登录时生成高质量语义图谱 | 不适合 | [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 的语义能力依赖 AI 环境。 |

- 这个脚本定位是“必要时手动运行”，不是 [**CocoaPods**](https://cocoapods.org/) 安装流程的自动钩子。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前脚本目录采用 Jobs 标准的“同名文件夹包裹脚本”结构：

  ```text
  CodeX+UnderstandAnything.command/
  ├── CodeX+UnderstandAnything.command
  └── README.md
  ```

- 双击运行 `.command` 时，脚本会优先展示同目录下的 `README.md`，用户按回车后才继续执行真实逻辑。
- 如果缺少 `README.md`，脚本会继续输出内置说明，但不建议删除本文件。

## 四、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 执行前请确认当前机器具备以下条件：

  | 检查项 | 要求 | 说明 |
  | --- | --- | --- |
  | 系统 | MacOS | `.command` 脚本按 MacOS / `zsh` 环境设计。 |
  | **Shell** | `zsh` | 脚本使用 `# shell: zsh`。 |
  | 工程 | `.xcworkspace` 或 `.xcodeproj` | 用于判断 iOS 工程根目录。 |
  | [**Codex**](https://openai.com/codex) | 已安装并可运行 | 脚本会检查 `codex` 命令是否存在。 |
  | [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) | 可安装 / 可升级 | 未安装时脚本会尝试安装。 |
  | 网络 | 能访问 GitHub | 首次安装 / 升级 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 需要联网。 |
  | AI 额度 | Codex 可正常使用 | 真正生成图谱时依赖 AI 算力。 |

- 检查 [**Codex**](https://openai.com/codex) 是否可用：

  ```shell
  codex --version
  ```

- 如果没有安装 [**Codex**](https://openai.com/codex)，请先安装并登录。

## 五、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、双击运行

- 直接双击：

  ```text
  CodeX+UnderstandAnything.command
  ```

- 脚本会先展示 `README.md`，按回车后继续。
- 如果 MacOS 提示没有执行权限，可以在终端里执行：

  ```shell
  chmod +x "CodeX+UnderstandAnything.command"
  ```

### 5.2、终端运行

- 进入脚本所在目录：

  ```shell
  cd "CodeX+UnderstandAnything.command"
  ```

- 执行脚本：

  ```shell
  ./CodeX+UnderstandAnything.command
  ```

## 六、执行流程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 6.1、展示自述并等待确认

- 脚本启动后会优先读取同目录 `README.md`。
- 用户按回车后继续执行。
- 用户按 `Ctrl+C` 可以随时取消。

### 6.2、查找 Xcode / iOS 工程根目录

- 脚本会按下面顺序查找工程目录：

  | 顺序 | 查找位置 | 命中标准 |
  | --- | --- | --- |
  | 1 | 脚本当前目录 | 能找到 `.xcworkspace` 或 `.xcodeproj`。 |
  | 2 | 脚本当前目录的上一级 | 能找到 `.xcworkspace` 或 `.xcodeproj`。 |
  | 3 | 用户输入 / 拖入路径 | 循环要求输入，直到命中有效工程。 |

- 用户可以拖入以下任意一种路径：

  ```text
  工程根目录
  xxx.xcworkspace
  xxx.xcodeproj
  ```

- 脚本会自动去除路径首尾引号，兼容中文、空格、括号和常见特殊字符。

### 6.3、打印工程识别结果

- 找到工程后，脚本会打印：

  ```text
  工程根目录
  命中的 .xcworkspace
  命中的 .xcodeproj
  ```

- 如果同时存在 `.xcworkspace` 和 `.xcodeproj`，优先关注 `.xcworkspace`。
- 打印完成后，脚本会等待用户回车确认，避免误操作到错误工程。

### 6.4、Codex 环境检查

- 脚本会检查本机是否存在 `codex` 命令。
- 如果未检测到 `codex`，脚本会提示先安装 [**Codex**](https://openai.com/codex)，并停止后续 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 流程。
- 如果 `codex` 存在，脚本会继续检查 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything)。

### 6.5、[**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 安装 / 升级检查

- 如果未检测到 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything)，脚本会执行安装命令：

  ```shell
  curl -fsSL https://raw.githubusercontent.com/Lum1104/Understand-Anything/main/install.sh | bash -s codex
  ```

- 如果已检测到 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything)，脚本会提示是否升级：

  ```text
  直接回车：跳过升级
  输入任意字符后回车：执行升级
  ```

- 升级属于普通更新动作，不默认执行，必须由用户输入任意字符后确认。

### 6.6、打印 Codex 使用说明

- 脚本不会默认强行消耗 Codex token 去执行 `/understand`。
- 脚本会打印推荐操作流程：

  ```shell
  cd "你的工程根目录"
  codex
  ```

- 进入 [**Codex**](https://openai.com/codex) 后执行：

  ```text
  /understand --language zh
  /understand-dashboard
  ```

### 6.7、可选启动 Codex

- 脚本末尾会询问是否立即从工程根目录启动 [**Codex**](https://openai.com/codex)。
- 默认策略：

  ```text
  直接回车：启动 Codex
  输入任意字符后回车：不启动，只打印说明
  ```

## 七、脚本执行命令 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 给脚本授权：

  ```shell
  chmod +x "CodeX+UnderstandAnything.command"
  ```

- 运行脚本：

  ```shell
  ./CodeX+UnderstandAnything.command
  ```

- 手动安装 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 到 [**Codex**](https://openai.com/codex)：

  ```shell
  curl -fsSL https://raw.githubusercontent.com/Lum1104/Understand-Anything/main/install.sh | bash -s codex
  ```

- 进入工程目录后启动 [**Codex**](https://openai.com/codex)：

  ```shell
  cd "你的工程根目录"
  codex
  ```

- 在 [**Codex**](https://openai.com/codex) 内生成中文代码图谱：

  ```text
  /understand --language zh
  ```

- 在 [**Codex**](https://openai.com/codex) 内打开图谱 Dashboard：

  ```text
  /understand-dashboard
  ```

## 八、[**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 使用说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 推荐第一次进入工程后执行：

  ```text
  /understand --language zh
  ```

- 这个命令会尝试扫描当前工程，并生成中文语义说明和代码图谱。
- 生成完成后，再执行：

  ```text
  /understand-dashboard
  ```

- Dashboard 适合查看：

  | 内容 | 说明 |
  | --- | --- |
  | 模块关系 | 看项目主要模块如何连接。 |
  | 类 / 函数结构 | 看核心类型、方法和调用关系。 |
  | 业务域映射 | 辅助理解功能域、页面流和关键路径。 |
  | 依赖关系 | 辅助判断重构影响范围。 |

- 常见生成物路径：

  ```text
  .understand-anything/knowledge-graph.json
  ```

## 九、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 脚本整体流程如下：

  ```mermaid
  flowchart TD
      A[双击或终端运行脚本] --> B[展示 README 并等待回车]
      B --> C[查找 Xcode / iOS 工程]
      C --> D{是否命中 .xcworkspace / .xcodeproj}
      D -- 是 --> E[打印工程路径并等待确认]
      D -- 否 --> F[循环要求用户输入或拖入工程路径]
      F --> C
      E --> G[检查 codex 命令]
      G --> H{Codex 是否可用}
      H -- 否 --> I[提示安装 Codex 后结束]
      H -- 是 --> J[检查 Understand Anything]
      J --> K{是否已安装}
      K -- 否 --> L[安装 Understand Anything 到 Codex]
      K -- 是 --> M[询问是否升级]
      L --> N[打印 Codex 内使用命令]
      M --> N
      N --> O{是否立即启动 Codex}
      O -- 回车 --> P[从工程根目录启动 Codex]
      O -- 输入任意字符 --> Q[只打印说明后结束]
  ```

## 十、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 脚本日志默认写入：

  ```text
  $TMPDIR/CodeX+UnderstandAnything.log
  ```

- 如果脚本执行异常，请先查看终端输出，再查看日志文件。
- 日志会记录：

  | 日志内容 | 说明 |
  | --- | --- |
  | 脚本路径 | 当前执行的 `.command` 文件路径。 |
  | 工程查找过程 | 当前目录、上一级目录、用户输入路径的命中情况。 |
  | 命中的工程文件 | `.xcworkspace` / `.xcodeproj` 全名和路径。 |
  | Codex 检查结果 | `codex` 命令是否存在。 |
  | [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 检查结果 | 是否安装、是否升级、安装命令是否执行成功。 |
  | 后续操作提示 | `/understand --language zh` 和 `/understand-dashboard` 的使用说明。 |

## 十一、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本脚本不会主动执行以下危险操作：

  ```text
  sudo
  rm -rf
  git reset --hard
  git clean
  pod install
  xcodebuild
  flutter clean
  ```

- 首次安装 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 或执行升级时，会联网访问 [**GitHub**](https://github.com)。
- 真正执行 `/understand --language zh` 时，会使用 [**Codex**](https://openai.com/codex) / AI 算力。
- 如果 Codex token 余额不足，图谱生成可能失败或无法完成。
- 不建议把 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 挂到高频 `pod install` 流程里，因为这会拖慢依赖安装，并可能无感消耗 AI 额度。
- 升级 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 属于普通更新动作，脚本设计为：

  ```text
  直接回车：跳过升级
  输入任意字符后回车：执行升级
  ```

## 十二、常见问题 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 12.1、为什么不直接放进 Podfile？

- 因为 [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 依赖 AI 算力，不适合每次 `pod install` 高频自动触发。
- `pod install` 更适合挂本地索引、依赖报告、CodeGraph 这类偏本地的能力。
- [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 更适合在需要理解架构、重构分析、生成图谱时手动执行。

### 12.2、Codex 没余额还能生成图谱吗？

- 不能稳定生成高质量语义图谱。
- [**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 的结构扫描可以依赖本地解析能力，但语义摘要、业务域映射和可解释图谱依赖 AI 环境。
- Codex 无额度、未登录或网络异常时，`/understand --language zh` 可能失败。

### 12.3、脚本为什么只打印 `/understand`，不自动执行？

- 这是为了避免误触消耗 AI 额度。
- 生成图谱通常是高成本动作，应该由用户确认工程目录和当前 Codex 状态后再手动执行。
- 脚本的职责是完成工程定位、环境检查、安装 / 升级检查和使用提示。

### 12.4、为什么优先识别 `.xcworkspace`？

- iOS 工程使用 [**CocoaPods**](https://cocoapods.org/) 后，通常应该从 `.xcworkspace` 打开。
- 如果同一目录同时存在 `.xcworkspace` 和 `.xcodeproj`，说明该工程大概率已经集成 Pods，后续分析也应以工程根目录为准。

### 12.5、[**Understand Anything**](https://github.com/Lum1104/Understand-Anything) 图谱生成在哪里？

- 常见路径是：

  ```text
  .understand-anything/knowledge-graph.json
  ```

- 这个目录通常位于当前工程根目录下。
- 如果没有生成，请检查 [**Codex**](https://openai.com/codex) 是否正常、当前目录是否正确、`/understand --language zh` 是否执行成功。

### 12.6、脚本找不到工程怎么办？

- 请拖入或输入以下任意一种路径：

  ```text
  工程根目录
  xxx.xcworkspace
  xxx.xcodeproj
  ```

- 如果输入的是 `.xcworkspace` 或 `.xcodeproj`，脚本会自动回到其上级目录作为工程根目录。
- 如果路径包含空格、中文或括号，可以直接从 Finder 拖入终端。

## 十三、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本文档只说明 `CodeX+UnderstandAnything.command` 的使用方式和风险边界。
- 阅读 `README.md` 本身不会修改工程文件。
- 只有用户继续运行脚本，并在后续 [**Codex**](https://openai.com/codex) 中手动执行 `/understand --language zh`，才会触发代码图谱生成流程。

---

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
