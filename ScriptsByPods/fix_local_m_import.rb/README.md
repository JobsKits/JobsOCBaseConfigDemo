# `fix_local_m_import.rb`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`fix_local_m_import.rb` 是一个面向 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 工程的 [**Ruby**](https://www.ruby-lang.org) 小工具，用来批量修复 `.m` / `.mm` 文件里错误写成尖括号形式的本地头文件引用。

它的核心判断很直接：如果当前 `.m` / `.mm` 文件同目录下存在对应 `.h` 文件，就把：

```objc
#import <XXX.h>
```

修复为：

```objc
#import "XXX.h"
```

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 适合批量整理 [**Xcode**](https://developer.apple.com/xcode) / [**CocoaPods**](https://cocoapods.org/) 工程里的本地 `.h` 引用。
- 适合修复这类同目录成对文件：

  ```text
  Foo.h
  Foo.m
  ```

- 适合把当前目录下存在的本地头文件，从系统 / framework 风格引用恢复成本地引用。
- 不适合无脑处理第三方源码仓库，尤其是没有提交记录、没有备份、没有先 dry-run 的目录。

## 二、脚本能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 能力 | 说明 |
| --- | --- |
| 递归扫描 | 从指定根目录开始扫描所有 `.m` / `.mm` 文件。 |
| 本地头判断 | 只在当前 `.m` / `.mm` 同目录存在同名 `.h` 时才替换。 |
| 安全预览 | 支持 `--dry-run`，只打印会变更的文件，不写入磁盘。 |
| 跳过干扰目录 | 自动跳过 `.git` 和 `__MACOSX`。 |
| 统计结果 | 最后输出变更文件数和变更 import 数。 |

## 三、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、先做语法检查

```shell
ruby -c fix_local_m_import.rb
```

看到下面结果，说明脚本语法没问题：

```text
Syntax OK
```

### 3.2、先 dry-run 预览

```shell
ruby fix_local_m_import.rb "/path/to/your/project" --dry-run
```

`--dry-run` 模式不会写文件，只会打印类似：

```text
[dry-run] /path/to/your/project/Foo/Foo.m
changed_files=1, changed_imports=1
```

### 3.3、确认后正式修复

```shell
ruby fix_local_m_import.rb "/path/to/your/project"
```

正式执行后，会把命中的文件直接写回磁盘，并打印类似：

```text
[fixed] /path/to/your/project/Foo/Foo.m
changed_files=1, changed_imports=1
```

### 3.4、不传路径时的默认行为

```shell
ruby fix_local_m_import.rb --dry-run
```

不传项目路径时，脚本会默认扫描当前终端所在目录：

```ruby
root = ARGV[0] || Dir.pwd
```

## 四、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 先确认当前目录是目标工程目录，避免扫错仓库。
- 正式执行前，必须先跑一次：

  ```shell
  ruby fix_local_m_import.rb "/path/to/your/project" --dry-run
  ```

- 正式执行前，建议确认 [**GitHub**](https://github.com) / Git 工作区是干净的，至少方便回滚：

  ```shell
  git status --short
  ```

- 如果 dry-run 输出数量异常大，先停下来查原因，不要直接正式执行。

## 五、处理流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```mermaid
flowchart TD
  A[开始执行 fix_local_m_import.rb] --> B{是否传入根目录参数}
  B -->|是| C[使用 ARGV[0] 作为扫描根目录]
  B -->|否| D[使用当前目录 Dir.pwd]
  C --> E[递归扫描 .m / .mm 文件]
  D --> E
  E --> F{是否位于 .git 或 __MACOSX}
  F -->|是| G[跳过文件]
  F -->|否| H[读取文件内容]
  H --> I[匹配 #import <xxx.h>]
  I --> J{同目录是否存在 xxx.h}
  J -->|否| K[保持原 import 不变]
  J -->|是| L[替换为 #import "xxx.h"]
  L --> M{是否 dry-run}
  M -->|是| N[只打印 dry-run 文件]
  M -->|否| O[写回文件并打印 fixed]
  K --> P[继续下一个文件]
  N --> P
  O --> P
  P --> Q[输出 changed_files / changed_imports]
```

## 六、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 正式执行会直接改写 `.m` / `.mm` 文件，不会自动生成备份文件。
- 脚本只按“同目录是否存在同名 `.h`”判断，不理解完整编译上下文。
- 脚本不会处理 `.h` 文件内部的 import，也不会处理非 `.h` 的尖括号引用。
- 脚本会尝试对命中文件执行用户写权限修复：

  ```ruby
  FileUtils.chmod('u+w', file) rescue nil
  ```

- 如果文件本来是只读状态，正式执行前要确认这种行为符合预期。

## 七、常见问题 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 7.1、为什么有些 `#import <A/B.h>` 没有被改？

因为脚本只取 `File.basename(import_path)`，也就是只看 `B.h`。只有当前 `.m` / `.mm` 同目录真实存在 `B.h`，才会替换成：

```objc
#import "B.h"
```

### 7.2、为什么不是全部尖括号 import 都替换？

这是正确的。系统库、第三方 framework、Pod 暴露头文件很多都应该继续用尖括号，不能乱改。

### 7.3、怎么确认具体改了什么？

正式执行后看 Git diff：

```shell
git diff -- '*.m' '*.mm'
```

### 7.4、怎么回滚？

如果工程在 Git 管理下，可以按文件回滚：

```shell
git checkout -- path/to/file.m
```

或者先查看差异，再决定是否提交。

## 八、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本文档只负责说明 `fix_local_m_import.rb` 的用途、风险和运行方式。
- 未对你的真实 [**Xcode**](https://developer.apple.com/xcode) 工程执行正式修复。
- 已建议的最低验证命令是：

  ```shell
  ruby -c fix_local_m_import.rb
  ruby fix_local_m_import.rb "/path/to/your/project" --dry-run
  ```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
