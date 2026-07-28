# `JobsOCComment`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 这份自述用于记录 `JobsOCComment` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCComment` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Comment list component for Jobs Objective-C projects. |
| 首页 | [https://example.local/JobsOCComment](https://example.local/JobsOCComment) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsOCComment@Pods/JobsOCComment.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 需要在业务页展示评论列表、楼中楼回复和回复对象提示。
- 模式一 `JobsOCCommentModeNetEase`：同一评论页内展示一级评论和二级回复，二级回复采用轻量缩进卡片。
- 模式二 `JobsOCCommentModeToutiao`：主列表只展示一级评论，点击后由业务侧单独开页展示该评论下的回复。
- 模式三 `JobsOCCommentModeCustom`：一级评论不缩进，二级及后续回复同级缩进；回复二级回复时显示 `回复：“用户名”` 和被回复人的头像。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCComment@Pods/
├── JobsOCComment.podspec
├── JobsOCComment.h
├── README.md
├── JobsPodspecKit.rb
├── LICENSE
├── Core/
│   ├── JobsOCCommentConfig/
│   ├── JobsOCCommentDefines/
│   ├── JobsOCCommentModel/
│   └── JobsOCCommentView/
└── Support/
    └── JobsOCCommentCell/
```

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 暴露 `JobsOCCommentDefines`、`JobsOCCommentConfig`、`JobsOCCommentModel` 和 `JobsOCCommentView`。
- `Support` 只放内部 `UITableViewCell`，调用方不直接引用。
- `JobsOCComment.h` 是统一聚合入口，App 侧优先引用聚合头。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 数据单元：消息 ID、用户头像、昵称、回复 ID、回复用户名、发表时间、内容、设备、坐标、子评论。
- 展示模式：`JobsOCCommentModeNetEase`、`JobsOCCommentModeToutiao`、`JobsOCCommentModeCustom`。
- 公共定义：`JobsOCCommentDefines.h` 统一维护三种模式的缩进距离和子回复默认展示上限。
- 配置：`showsReplyEntrance` 控制模式二主评论里的 `查看 N 条回复` 入口，进入回复详情页后可关闭。
- 配置：三种模式都通过 `maxVisibleChildReplyCount` 控制每条一级评论下默认展示的二级及后续回复数量；全局默认值是 `3`，超出后展示 `——显示更多——`，点击后展开当前一级评论下的全部回复。
- 刷新：模式一和模式三默认接入 `JobsOCRefresher` 的下拉刷新与上拉加载；模式二保持单页跳转回复风格，不挂载刷新组件。
- 回调：`commentSelectedBlock` 让业务侧处理点击、跳转或回复动作。
- 回调：`pullRefreshBlock`、`loadMoreBlock` 让业务侧请求数据，请求完成后调用 `endPullRefresh`、`endLoadMore` 或 `endLoadMoreWithNoMoreData:` 收口刷新状态。
- 系统框架：`Foundation`、`UIKit`。
- Pod 依赖：`Masonry`、`JobsBlock`、`JobsBaseUI`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`、`JobsOCRefresher`。
- 内部 UIKit 视图由 `JobsMakes` / `jobsMakeTableViewBy*` 创建，配置和装配统一使用 `JobsOCDSL`。
- 组件布局和动态缩进约束统一由 `Masonry` 管理，不直接创建或激活系统 `NSLayoutConstraint`。

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsOCComment/JobsOCComment.h>)
#import <JobsOCComment/JobsOCComment.h>
#else
#import "JobsOCComment.h"
#endif
```

```objc
JobsOCCommentConfig *config = JobsOCCommentConfig.defaultConfig;
config.mode = JobsOCCommentModeCustom;
config.commentSelectedBlock = ^(id _Nullable data) {
    NSLog(@"comment = %@", data);
};
JobsOCCommentView *commentView = [JobsOCCommentView.alloc initWithConfig:config];
commentView.byComments(commentArr);
```

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前 Pod 不依赖图片、字体、音视频、`xib`、`storyboard` 或 `xcassets` 资源。
- `userAvatar` 可传入项目内图片名；没有可用图片时，Cell 使用昵称首字生成圆形头像。
- 后续如果接入真实头像下载，优先由业务层提供图片或独立图片加载能力，不在本 Pod 内强绑网络图片依赖。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsOCComment.podspec
```

```shell
pod install --no-repo-update
```

- 增删依赖后重点检查 `PodspecDependencyReport`，避免循环依赖和公开头泄漏。
- 如果没有执行 `pod install`，`Podfile.lock`、`Pods/` 和依赖报告不会包含最新 Pod 状态。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 模式二只负责把“点击评论”交还给业务侧，真正的新页面由宿主 Demo 或业务控制器打开。
- 当前组件只做展示，不包含发布评论、点赞、删除、举报或网络请求。
- `Support` 内部 Cell 不作为公开 API 使用，外部只应通过 `JobsOCCommentView` 和模型配置。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
