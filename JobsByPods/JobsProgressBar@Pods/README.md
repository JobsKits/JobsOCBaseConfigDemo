# JobsProgressBar

`JobsProgressBar` 是 OC 侧自定义进度条组件，用来对齐 Swift Demo 里的“自定义进度条（进度值 + 前进方向）”能力。

## 功能

- 支持左到右、右到左、上到下、下到上四种前进方向。
- 支持进度值正向显示和倒向显示。
- 支持顶部 / 底部进度值标签。
- 支持进度条拖动、滑块样式和自动进度。

## 接入

```ruby
pod 'JobsProgressBar', :path => './JobsByPods/JobsProgressBar@Pods'
```

## 使用

```objc
JobsProgressBar *progressBar = JobsProgressBar.alloc.init;
progressBar.byDirection(JobsProgressBarDirectionLeftToRight)
           .byValueMode(JobsProgressBarValueModeCountUp)
           .byProgressTintColor([UIColor colorWithRed:0 green:0.78 blue:0.32 alpha:1])
           .byTrackTintColor(UIColor.lightGrayColor)
           .byTrackThickness(12)
           .byProgressLabelPlacement(JobsProgressBarLabelPlacementTop)
           .byDraggable(YES)
           .byOnProgressChanged(^(CGFloat progress) {
               JobsLog(@"progress = %.2f",progress);
           });

[progressBar setDisplayPercent:35 animated:NO duration:0];
```
