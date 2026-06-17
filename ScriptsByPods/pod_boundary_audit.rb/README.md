# `pod_boundary_audit.rb`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`pod_boundary_audit.rb` 是一个面向 `JobsByPods` 的 [**Ruby**](https://www.ruby-lang.org) 审计脚本，用来按当前约定扫描本地 Pod 的 `Core / Support` 边界问题，并可选择性地自动修整一批安全改动。

它主要解决三件事：

- 找出 `Core/*.h` 里直接暴露当前 Pod `Support` 头文件的地方。
- 把“只在实现里才需要”的 `Support` import，从 `Core/*.h` 下沉到配对的 `.m/.mm`。
- 列出头文件里那些疑似没有使用双通道保护的外部 `#import`。

补充约定：

- 如果是当前 Pod 自己引用自己的公开头文件，不要求额外写双通道保护。
- 双通道保护主要用于“别的本地 Pod”或“外部第三方 Pod”的头文件引用。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 适合本地 Pod 已经按 `Core` / `Support` 分层，但长期演化后边界变脏的仓库。
- 适合提取本地 Pod 之后，开始出现“头文件越界暴露”“Support 被编进公共 API”这类编译问题的情况。
- 适合先做一轮规则化收口，再决定哪些基础类该从 `Support` 提升到 `Core`。

## 二、脚本能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 能力 | 说明 |
| --- | --- |
| 扫描 `Core.h -> Support` | 统计每个 Pod 里 `Core/*.h` 对当前 Pod `Support` 的直接引用。 |
| 安全候选识别 | 自动判断哪些 import 只是实现细节，适合从 `.h` 下沉到 `.m/.mm`。 |
| 结构性问题分离 | 把“公开头直接暴露 Support 类型”的情况单独列出来，避免脚本误修。 |
| 外部 import 预警 | 识别头文件里疑似没有使用双通道保护的外部 `#import "XXX.h"`。 |
| Markdown 报告 | 输出一份可直接阅读的审计报告。 |

## 三、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、先做语法检查

```shell
ruby -c pod_boundary_audit.rb
```

### 3.2、只扫描，不写文件

```shell
ruby pod_boundary_audit.rb --dry-run
```

### 3.3、扫描并生成报告

```shell
ruby pod_boundary_audit.rb
```

默认会把报告写到：

```text
PodspecDependencyReport/PodBoundaryAudit.md
```

### 3.4、扫描并自动修整安全候选

```shell
ruby pod_boundary_audit.rb --fix-safe-core-support-imports
```

### 3.5、只预览自动修整结果

```shell
ruby pod_boundary_audit.rb --fix-safe-core-support-imports --dry-run
```

### 3.6、指定目录和报告路径

```shell
ruby pod_boundary_audit.rb \
  --root JobsByPods \
  --report PodspecDependencyReport/PodBoundaryAudit.md \
  --fix-safe-core-support-imports
```

## 四、脚本判定逻辑 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 如果 `Core/*.h` 引用了当前 Pod `Support/**/*.h`，就记为越界候选。
- 如果这个 `Core/*.h` 有配对 `.m/.mm`，并且头文件正文没有直接使用对应 Support 类型名，就视为安全候选：

  ```text
  Core/Foo/Foo.h  ->  Core/Foo/Foo.m
  ```

- 如果公开头本身就出现了 Support 类型名，例如：

  ```objc
  @interface JobsNavBar : BaseImageView
  ```

  这种情况不会自动修，因为它往往意味着分层本身需要重判。

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `--fix-safe-core-support-imports` 会直接改写源码文件，不自动备份。
- “安全候选”仍然是规则判断，不等于完整编译语义分析。
- 脚本不会自动把类从 `Support` 移动到 `Core`，结构性问题只会出报告，不会硬改。
- 推荐先跑一次：

  ```shell
  ruby pod_boundary_audit.rb --fix-safe-core-support-imports --dry-run
  ```

## 六、建议搭配的验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 看审计报告：

  ```shell
  open PodspecDependencyReport/PodBoundaryAudit.md
  ```

- 看源码差异：

  ```shell
  git diff -- JobsByPods
  ```

- 对重点 Pod 做最小静态验证，例如：

  ```shell
  ruby -c JobsByPods/JobsBaseUI@Pods/JobsBaseUI.podspec
  ```

## 七、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 这份 `README.md` 只说明脚本能力和风险边界。
- 是否真正写入源码，取决于你是否带上 `--fix-safe-core-support-imports`，以及是否启用 `--dry-run`。
- 如果你希望继续推进“把误放在 `Support` 里的公共基类提到 `Core`”，还需要在报告基础上做第二轮结构整理。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
