# `JobsDebugPanel` 调试面板

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsDebugPanel` 是 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 主工程功能模块。它在 `Debug` 构建中提供位于应用页面上方的圆形 `UIButton`、环境切换列表和有序自定义动作。声明、实现、初始化和 Demo 入口均受 `#if DEBUG` 保护，`Release` 不包含调试类和入口。

公开调用统一从 [JobsDebugPanel.h](./JobsDebugPanel.h) 进入；中文架构见[架构脉络与关键设计](#jobs-architecture)。源码与资源直接集成于主工程，不增加调试面板的 Pod 依赖。[**SwiftUI**](https://developer.apple.com/xcode/swiftui/) 工程使用独立的 `JobsSwiftUIDebugPanel` 本地 Pod，以 `Button`、`List` 和 `NavigationStack` 实现对应界面与导航。

## 一、功能与操作 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1、启动 App 后，每个处于前台的业务 Scene 显示一个圆形按钮，按钮只使用随 App 打包的背景图。

2、首次点击按钮，从当前业务导航容器 `push` 出 `UITableView` 调试页面。当前页面没有导航容器时，以带关闭入口的导航容器模态展示调试页；其内部页面继续 `push`。再次点击同一圆形按钮会关闭调试流程并返回打开前的页面，之后可以重新打开。

3、按钮可拖动，位置限制在业务窗口安全区内，旋转后重新钳制到可见范围。拖动不会触发点击或长按；每个 Scene 的位置只在当前浮层内保存，不持久化。

4、长按按钮 `0.8` 秒隐藏本次 App 进程中的全部调试按钮。这个状态只在内存保存，重新启动 App 后恢复；退到后台再回前台不会恢复。

5、默认第一行是“App 环境切换”，点击后 `push` 二级环境列表，显示备注和完整 URL，当前环境用勾选标记。

6、其余行来自 `JobsDebugAction` 数组，先配置的有效动作先显示；标题必填，图片可选，点击行为由调用方提供。无标题或无行为的动作不进入列表。

7、Demo、调试页、环境页、导航、表格和弹窗读取宿主 `JobsThemeCenter` 的有效主题；已打开页面在 `JobsThemeDidChangeNotification` 到达时立即刷新。宿主当前提供白天 / 黑夜两种主题；系统与 App 自选主题不一致时仍以 App 为准。

## 二、目录与公开边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsDebugPanel/
├── Core/
│   ├── JobsDebugEnvironment/                 # 公开：环境 Model 与 DSL
│   ├── JobsDebugAction/                      # 公开：动作 Model 与 DSL
│   ├── JobsDebugPanelManager/                # 公开：配置、状态与展示入口
│   ├── JobsDebugPanelVC/                     # 公开：调试列表页面
│   ├── JobsDebugEnvironmentsVC/              # 内部：二级环境页面
│   ├── JobsDebugPanelCell/                   # 内部：可复用列表 Cell
│   ├── JobsDebugPanelNavigationController/   # 内部：无导航容器时的展示
│   ├── JobsDebugOverlayVC/                   # 内部：透明浮层与圆形按钮
│   └── JobsDebugOverlayWindow/               # 内部：窗口层级与触摸穿透
├── Resource/                                # 按钮图、原始矢量与来源许可
├── JobsDebugPanel.h                         # 根聚合头
├── LICENSE
└── README.md
```

公开契约只有环境 Model、动作 Model、Manager 和调试列表 VC。其余 `Core` 类型作为实现细节，调用方不直接依赖浮层、Cell 和二级页面。当前没有单独的支援代码，因此不建立空 `Support` 目录；`Resource` 与 `Core` 平级。

## 三、Debug 集成 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

模块放在主工程 `OCBaseConfig/JobsMixFunc/JobsDebugPanel` 下，Demo 放在 `业务逻辑/功能模块/Demo@JobsDebugPanel` 下。保持原有 Pod 依赖，不额外增加 `JobsDebugPanel` Pod。

在 `AppDelegate+Func.h` 引入聚合头，导入和实现调用都保留 `#if DEBUG`：

```objc
#if DEBUG
#import "JobsDebugPanel.h"
#import "JobsDebugPanelDemoVC.h"
#endif
```

`AppDelegate+Func` 在完成 `YTKNetworkConfig` 初始化后执行 `makeJobsDebugPanelConfig()`。环境回调把当前 URL 同步给 `JobsSetDebugBaseURL()` 与 `YTKNetworkConfig.sharedConfig`，后续请求使用该环境。Release 的 URL Getter 继续读取原有环境配置。

主工程 target 加入九个 Core `.m`、两个 Demo `.m` 和按钮 PNG；头文件与 README 只用于工程阅读，不作为资源复制。模块复用主工程已有的 `JobsBaseUI`、`JobsByOCPods`、`JobsBlock`、`JobsDefines`、`JobsOCDSL`、`JobsMakes` 及既有 [**Masonry**](https://github.com/SnapKit/Masonry)、`XYColorOC` 能力。按钮 PNG 直接进入 App bundle，Demo 图标进入现有 Assets 目录。

## 四、AppDelegate 链式配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

环境模型把稳定标识、备注和 URL 收口；动作模型把标题、可选图片和行为收口。请在主线程完成配置，并把 `start()` 放在完整配置链的末尾。

```objc
#if DEBUG
JobsDebugPanelManager.sharedPanel
    .byEnvironments(@[
        JobsDebugEnvironment.new
            .byIdentifier(@"local")
            .byTitle(@"本地 Mock")
            .byBaseURL(@"http://127.0.0.1:18080"),
        JobsDebugEnvironment.new
            .byIdentifier(@"httpbin")
            .byTitle(@"公共测试")
            .byBaseURL(@"https://httpbin.org"),
        JobsDebugEnvironment.new
            .byIdentifier(@"postman")
            .byTitle(@"联调测试")
            .byBaseURL(@"https://postman-echo.com")
    ])
    .byDefaultEnvironmentIdentifier(@"local")
    .byEnvironmentChanged(^(JobsDebugEnvironment *environment) {
        // 把 environment.baseURL 同步到宿主网络配置，后续请求读取这个值。
        NSLog(@"调试环境：%@ · %@", environment.title, environment.baseURL);
    })
    .byActions(@[
        JobsDebugAction.new
            .byTitle(@"记录当前环境")
            .byImage(nil)
            .byAction(^(UIViewController *source) {
                JobsDebugEnvironment *environment =
                    JobsDebugPanelManager.sharedPanel.currentEnvironment;
                NSLog(@"当前环境：%@ · %@", environment.title, environment.baseURL);
            })
    ])
    .start();
#endif
```

`byEnvironmentChanged` 在启动恢复环境和用户选择环境时调用。框架同时发布 `JobsDebugEnvironmentDidChangeNotification`，通知的 `object` 是选中的 `JobsDebugEnvironment`。框架不改写第三方网络单例、不重放已经发出的请求；宿主通过回调或通知更新自己的网络配置，新请求再使用当前 URL。

`JobsDebugAction` 的行为收到当前调试页面 `UIViewController`，可以继续使用它的导航容器打开自定义功能页面。`byActions` 按数组顺序覆盖当前自定义动作列表，默认环境入口始终在首行。

## 五、环境与窗口状态 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 状态 | 保存位置 | 行为 |
| --- | --- | --- |
| 环境配置 | Manager 的配置快照 | 只接受带有效 host 的 HTTP / HTTPS URL；相同 identifier 保留首次配置，无 identifier 时使用 URL。 |
| 当前环境 | 当前进程与 `NSUserDefaults` | 持久化 identifier；启动优先恢复仍在配置内的旧值，再找默认 identifier，最后取首个有效环境。 |
| 自定义动作 | Manager 的配置快照 | 标题、可选图片和行为一起复制，保持有效数组顺序。 |
| 长按隐藏 | 当前进程的内存标志 | 覆盖全部 Scene，重新启动 App 后恢复，不与环境持久化混在一起。 |
| 入口位置 | 每个浮层的内存状态 | 安全区内拖动，按钮边缘与安全区留出 `8` 点距离；旋转重新钳制，浮层重建后恢复默认位置。 |
| 浮层窗口 | 按 Scene session identifier 管理 | 每个前台 Scene 独立挂载；业务宿主 Window 更换时重建绑定，Scene 退出时清理。 |

没有有效环境时，二级列表显示完整的按钮空态与重新加载入口。旧式 App 生命周期在没有 Scene 的情况下使用当前业务 Window，不能只按系统版本推断一定存在 Scene。

浮窗为 `BaseButton` 显式创建并绑定平移手势，同时启用其拖动开关，避免合成的 `panGR` 属性覆盖系统视图分类的惰性创建。透明浮层只截获圆形按钮区域，其余触摸交回下层业务 Window。浮层不抢 `keyWindow`；导航从按钮所属业务 Window 的当前页面开始，不从任意 `connectedScenes.first` 跨 Scene 跳转。`showFrom(...)` 只负责打开，已存在调试导航流程时不会重复压入。浮动按钮使用 `toggleFrom(...)`：首次打开，再次点击关闭整个调试流程，环境页、自定义动作页及其 Alert / sheet 一并退出，返回打开前的业务页；无导航容器时关闭备用模态导航容器。返回后可再次打开，按当前 Scene 的实际导航栈查询状态。

主题使用宿主语义颜色与主题通知，导航、Demo、系统弹窗同步有效明暗样式；表格、Cell 内容、选中态、分隔线和页脚同时刷新，原生视图 trait 跟随宿主主题，系统与 App 自选明暗不一致时也保持可读。浮动按钮的无障碍文案随打开 / 关闭状态显示下一次点击动作。面板不会自行持久化另一份主题选择；宿主将系统变化归入自身有效主题时，面板通过同一通知刷新。

## 六、Demo、离线与弱网边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

宿主 Demo 使用本地 `18080`、`https://httpbin.org` 和 `https://postman-echo.com` 三个环境；选择环境后，请求示例读取当前 `baseURL` 请求 `/get`，超时为 `3` 秒。网络失败、超时或响应不能解析时显示本地示例结果，保留重试入口；后续请求成功自动使用真实响应。环境选择与菜单本身不需要服务器，断网也可演示。

本地地址 `127.0.0.1` 指运行 App 的设备本身；需要真机访问开发机服务时，应在 `AppDelegate` 改成该设备可达的开发机地址。未启动本地服务时，Demo 的本地回退仍可用。

框架没有默认加入全 App 弱网开关。普通调试模块 的公开请求扩展无法覆盖全 App 的带宽、丢包和所有网络栈；[**Apple Network Link Conditioner**](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/On_Demand_Resources_Guide/TestingPerformance.html) 在开发设备的 `Settings > Developer` 中配置真实网络 profile。`URLProtocol` 仅是参与对应 Session 的协议处理扩展，Apple [明确说明后台 Session 不支持自定义 URLProtocol](https://developer.apple.com/documentation/foundation/urlsessionconfiguration/protocolclasses)。需要局部请求延迟或故障演示时，可通过自定义动作接入宿主自己的可控请求层，并明确其覆盖范围。

## 七、资源来源与许可 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

按钮首先按规则检索 [**iconfont**](https://www.iconfont.cn/)；无法取得可核实具体作者许可的合适结果后，使用 [**Ant Design Icons**](https://github.com/ant-design/ant-design-icons) 官方 [`filled/bug.svg`](https://github.com/ant-design/ant-design-icons/blob/master/packages/icons-svg/svg/filled/bug.svg)。原始路径嵌入自建金黄色圆底矢量图，离线渲染成 `240 × 240` PNG，圆外透明、图中没有标题文字。

运行时只读取 [Resource/JobsDebugPanelButton.png](./Resource/JobsDebugPanelButton.png)。版权为 Ant UED，适用 MIT 许可；完整许可保留在 [Resource/AntDesignIcons-LICENSE](./Resource/AntDesignIcons-LICENSE)，检索、原始来源与渲染说明见 [Resource/SOURCE.txt](./Resource/SOURCE.txt)。框架源码自身许可见 [LICENSE](./LICENSE)。

<a id="jobs-architecture"></a>

## 八、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 8.1、职责与运行关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

<table>
  <thead>
    <tr><th>层级</th><th>负责什么</th><th>数据与调用流向</th></tr>
  </thead>
  <tbody>
    <tr><td>宿主 AppDelegate</td><td>声明环境、默认标识、自定义动作与环境变化回调</td><td>环境 Model / 动作 Model → Manager 配置链 → start()</td></tr>
    <tr><td>进程状态 Manager</td><td>校验快照、恢复环境、保存 identifier、管理本次启动隐藏状态</td><td>启动恢复 / 用户选择 → 当前环境 → 回调与通知 → 宿主后续请求</td></tr>
    <tr><td>Scene 浮层</td><td>绑定当前业务 Window、创建透明高层窗口、只截获按钮触摸</td><td>Scene 生命周期 → 每个 Scene 的 OverlayWindow → 圆形 UIButton</td></tr>
    <tr><td>调试菜单页面</td><td>首行环境入口、自定义动作、可复用 Cell</td><td>UIButton 点击 → 当前业务导航 push → UITableView → 对应动作</td></tr>
    <tr><td>二级环境页面</td><td>展示备注 / URL、标记当前值、处理空态与重新加载</td><td>选择配置项 → Manager.selectEnvironment → 持久化 → 列表更新</td></tr>
    <tr><td>宿主业务请求</td><td>消费当前 URL，处理成功响应、超时与本地演示回退</td><td>Demo 请求 /get → 真实结果或本地示例；请求策略留在宿主</td></tr>
  </tbody>
</table>

### 8.2、设计边界与阅读顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读环境 / 动作 Model，再读 Manager，最后读菜单与浮层。环境和菜单是进程级配置，窗口和导航属于各自 Scene；两种生命周期分开管理。长按隐藏只结束本次进程的入口展示，不删除已保存的环境。

- [JobsDebugEnvironment.h](./Core/JobsDebugEnvironment/JobsDebugEnvironment.h)：稳定 identifier、备注和 URL。
- [JobsDebugAction.h](./Core/JobsDebugAction/JobsDebugAction.h)：标题、可选图片与点击行为。
- [JobsDebugPanelManager.h](./Core/JobsDebugPanelManager/JobsDebugPanelManager.h)：公开配置与状态入口。
- [JobsDebugPanelVC.h](./Core/JobsDebugPanelVC/JobsDebugPanelVC.h)：表格页面契约。
- [JobsDebugPanel.h](./JobsDebugPanel.h)：公开 API 聚合；内部类型不作为调用方契约。

## 九、验证与迁移 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1、静态检查主工程 `project.pbxproj`，确认 Core / Demo 源码与按钮 PNG 的 target 引用完整，说明文档不进入 Copy Bundle Resources。

2、分别编译宿主 `Debug` 与 `Release`；Debug 核验按钮与两级页面，Release 核验二进制没有调试类，且不存在对应 Demo 入口。

3、运行覆盖环境恢复、无有效环境、动作顺序、业务页面触摸穿透、长按后前后台切换、进程重启恢复、无导航容器展示和多 Scene 宿主 Window 更换。另需覆盖入口拖到四边、旋转后可见、拖动不打开菜单且不隐藏，以及菜单 / 环境页 / 自定义动作页 / 弹窗再次点圆按钮退出并重开，手动返回后按钮状态复原，Demo / 菜单 / 环境页 / 弹窗即时切换主题；分别验证系统黑夜 + App 白天、系统白天 + App 黑夜。仅编译通过不能代替这些运行时证据。

此模块在老工程保持主工程集成形态，配置 API、交互和资源内容保持一致。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
