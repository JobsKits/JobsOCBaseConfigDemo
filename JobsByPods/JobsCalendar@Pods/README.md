# `JobsCalendar`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsCalendar` 是 Jobs OC 工程里的独立日历控件。它不继承、不包裹、不依赖任何第三方日历视图，内部自己负责年月标题、星期栏、日期格、选中态、翻页、最小/最大日期、节假日副标题和安全刷新。

## 一、用途 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1.1、适用场景

- Demo、业务页、组件页需要稳定的月历视图，同时希望避免横竖屏、宽度变化、异步刷新导致的日历错位。
- 业务层需要通过 `JobsCalendarDataSource`、`JobsCalendarDelegate` 和 `JobsCalendarAppearance` 配置标题、副标题、日期范围、选中态和外观。
- 需要把日历能力收口成 Jobs 自己可控、可审计、可继续扩展的本地 Pod。

### 1.2、能力边界

- `JobsCalendar` 继承 `UIView`，内部固定 7 列、最多 6 行日期格，年月标题始终按自身 bounds 居中。
- `JobsCalendar` 的目标是替代旧日历入口；后续新能力应继续落在 Jobs 自己的 API 和实现里。

## 二、核心差异 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 维度 | 旧第三方入口 | JobsCalendar |
| --- | --- | --- |
| 来源关系 | 第三方控件在主工程中直接暴露 | Jobs 自研 `UIView`，无第三方日历依赖 |
| 功能覆盖 | 日历 UI、数据源、代理、外观和选择能力由外部控件提供 | Jobs 自己实现年月、星期、日期、占位日期、选择、多选、翻页、范围限制、副标题和事件点 |
| 布局刷新 | 依赖调用方正确处理 frame / constraints 变化 | bounds 变化后自动触发布局刷新，并可防抖 reload |
| Header 对齐 | 初次布局或约束变化后，年月标题可能被内部滚动状态影响 | 年月标题是普通 `UILabel`，frame 按当前 bounds 计算，默认居中 |
| 线程边界 | 调用方需要保证 UI 操作在主线程 | `reloadData` / `jobsReloadDataSafely` 自动回到主线程 |
| Jobs 集成 | 业务层感知外部 API 命名 | 业务层只感知 `JobsCalendar`、`JobsCalendarDataSource` 和 `JobsCalendarDelegate` |

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsCalendar@Pods
├── JobsCalendarHeader.h
├── JobsCalendar.podspec
├── LICENSE
├── README.md
└── Core
    ├── JobsCalendar
    │   ├── JobsCalendar.h
    │   └── JobsCalendar.m
    ├── JobsCalendarDefines
    │   └── JobsCalendarDefines.h
    ├── JobsCalendarAppearance
    │   ├── JobsCalendarAppearance.h
    │   └── JobsCalendarAppearance.m
    └── JobsCalendarDayCell
        ├── JobsCalendarDayCell.h
        └── JobsCalendarDayCell.m
```

- `JobsCalendarHeader.h` 位于 Pod 根目录，是对外公共入口头；`Core/JobsCalendar/JobsCalendar.h` 是真实 `JobsCalendar` 类头，因同名类头已存在，不再另建同名根聚合头，避免 public header 冲突。
- `Core` 只放对外暴露的代码文件，多组 `*.h` / `*.m` 已按同名文件夹分组。
- 当前 Pod 暂无 `Support` 和 `Resource`；后续内部支援代码放 `Support`，图片、bundle、声音、json、`*.xcprivacy` 等非代码资源放 `Resource`，`README.md` 保持在 Pod 根目录。

## 四、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、引用方式

```objc
#if __has_include(<JobsCalendar/JobsCalendarHeader.h>)
#import <JobsCalendar/JobsCalendarHeader.h>
#else
#import "JobsCalendarHeader.h"
#endif
```

### 4.2、创建入口

```objc
JobsCalendar *calendar = jobsMakeJobsCalendar(^(__kindof JobsCalendar * _Nullable calendar) {
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.allowsMultipleSelection = YES;
});
```

### 4.3、稳定性 API

| API | 说明 |
| --- | --- |
| `jobsAutomaticallyInvalidateLayoutOnBoundsChange` | bounds 变化时自动刷新内部布局 |
| `jobsReloadDataAfterBoundsChange` | bounds 变化后在下一轮主线程防抖 reload |
| `jobsInvalidateCalendarLayout` | 手动触发内部布局刷新 |
| `jobsReloadDataSafely` | 主线程安全刷新日历 |
| `setCurrentPage:animated:` | 切换当前月份 |
| `selectDate:` / `deselectDate:` | 主动选中或取消日期 |

## 五、依赖关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 依赖 | 用途 |
| --- | --- |
| `JobsOCDefs` | 使用 Jobs 属性宏和基础定义 |

## 六、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsCalendar.podspec
pod install --no-repo-update
```

完成 `pod install` 后，还应确认 `Pods/Pods.xcodeproj` 能打开，`JobsCalendar` target 存在，并编译使用日历功能的 App scheme。

## 七、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsCalendar` 目前主打月历稳定渲染、翻页、选择、范围限制和基础外观；复杂农历、跨时区业务规则、深度自定义 cell 需要在 Jobs API 上继续扩展。
- 如果业务页仍然给日历设置大于屏幕的固定宽度，JobsCalendar 会尽量稳定内部布局，但正确做法仍然是让外层约束限制在 safe area / 父视图宽度内。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
