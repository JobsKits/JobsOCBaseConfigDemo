# <span id="前言">尝试高仿蜜柚</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

> `JobsAppDoorVC` 与 `JobsAppDoorVC_Style2` 在本工程直接集成于主 target，分别提供侧栏变形与卡片横滑的登录 / 注册页面。

- 两套样式共用的手机号输入件用不换行空格 `U+00A0` 连接国旗和区号；首次显示与国家选择回写均固定单行，号码输入保留 `4pt` 内部起点。
- 两套样式的登录 / 注册切换侧栏与提交按钮以 `18pt`、标题以 `22pt` 为基准；Style1 保留 `JobsWidth` 缩放，Style2 使用对应点数。注册字段保持原有紧凑间距和输入字号。
- 右上角音量面板点击外部区域即收起；同一次触摸仍交给原输入框或按钮，面板内调节不会触发外部收起。
- 真机使用 [**MPVolumeView**](https://developer.apple.com/documentation/mediaplayer/mpvolumeview) 调整系统媒体音量，播放器保持未静音和 `1.0` 局部音量，通过 `AVAudioSession.outputVolume` 观察硬件音量变化并刷新百分比。模拟器使用播放器局部滑条；Apple 明确说明该系统控件在模拟器不能改系统音量，不承诺当前模拟器的侧边音量键已验收。
- 验证分别覆盖 Style1 / Style2 登录与注册、国家切换后的国旗区号同行、音量滑条数值变化，以及点击输入框 / 切换按钮时面板收起并继续响应原动作；真机硬件键和实际听感单独验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

