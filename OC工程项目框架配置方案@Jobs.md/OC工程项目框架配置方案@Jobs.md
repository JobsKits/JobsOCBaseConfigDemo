# [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 工程项目框架配置方案@JobsKits

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

这份文档对齐 [**Swift**](https://www.swift.org/) 侧 `Swift工程项目框架配置方案@Jobs.md`，用于沉淀 OC 工程的 UI 创建、属性配置、父视图装配、[**Masonry**](https://github.com/SnapKit/Masonry) 约束和列表免协议 Block 化方向。

OC 侧核心思想是：`JobsMake` 创建对象，`JobsOCDSL` / `JobsModelDSL` 配置属性，`UIView+DSL` / `Masonry+DSL` 完成父视图装配和约束，依赖真实 `frame` 的效果放到约束刷新之后。

## 一、基础原则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- UI 创建优先使用 `JobsMakes@Pods/Core/JobsMakes.h` 里的 `jobsMakeXXX`。
- `JobsMake` 只负责对象创建和 Block 入口，不负责堆业务配置。
- Block 内部优先使用 `JobsOCDSL` / `JobsModelDSL` 点语法链式赋值。
- 链式调用先写当前类本层能力，再写父类公共能力。
- 加到父视图必须早于 [**Masonry**](https://github.com/SnapKit/Masonry) 约束。
- frame 依赖效果可以在 `byAddTo` + 约束 + `layoutIfNeeded` 之后执行。

## 二、UI 创建与装配顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

### 2.1、标准流程

- 第一步：用 `jobsMakeLabel`、`jobsMakeButton`、`jobsMakeTextView`、`jobsMakeTextField`、`jobsMakeTableViewByPlain`、`jobsMakeCollectionView` 等方法创建对象。
- 第二步：在 Block 内使用当前类 DSL 配置属性，例如 `UILabel` 的 `byText`、`byFont`、`byTextAlignment`、`byNumberOfLines`。
- 第三步：再使用父类 DSL 配置公共属性，例如 `UIView` 的 `byBgColor`、`byAlpha`、`byCornerRadius`。
- 第四步：通过 `UIView+MasonryDSL` 的 `byAddTo(superview, makeBlock)` 加到父视图并完成首次 [**Masonry**](https://github.com/SnapKit/Masonry) 约束。
- 第五步：如果效果依赖真实 `frame`，在父视图 `layoutIfNeeded` 之后再做渐变、阴影路径、局部切角、动画初始位置等处理。

### 2.2、`UILabel` 示例

```objc
_titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
    label
        .byText(@"标题")
        .byFont([UIFont boldSystemFontOfSize:16])
        .byTextCor(UIColor.labelColor)
        .byTextAlignment(NSTextAlignmentCenter)
        .byNumberOfLines(1)
        .byBgColor(UIColor.clearColor)
        .addOn(self.contentView)
        .byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(8, 12, 8, 12));
        });
});
```

### 2.3、frame 依赖效果

```objc
_badgeView = jobsMakeView(^(__kindof UIView * _Nullable view) {
    view
        .byBgColor(UIColor.systemRedColor)
        .addOn(self.contentView)
        .byAdd(^(MASConstraintMaker *make) {
            make.right.top.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        });

    [self.contentView layoutIfNeeded];
    view.byCornerRadius(CGRectGetWidth(view.bounds) / 2.0);
});
```

## 三、继承链调用顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 子类 DSL 必须优先调用，父类 DSL 靠后调用。
- 如果先调用父类 DSL，返回值可能收口为 `UIView`，后面就无法继续调用 `UILabel`、`UIButton`、`UITextField` 等本层方法。
- 公共属性只放在父类 DSL，子类特有属性只放在子类 DSL，不通过重复定义解决链式顺序问题。

```objc
label
    .byText(@"先 UILabel")
    .byFont([UIFont systemFontOfSize:15])
    .byTextAlignment(NSTextAlignmentCenter)
    .byBgColor(UIColor.clearColor)
    .addOn(self.view)
    .byAdd(^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    });
```

## 四、`UITableView` / `UICollectionView` 方向 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- Swift 侧已经把常用 `UITableView` / `UICollectionView` 协议方法封装为 Block，OC 侧现在同步落地了优先级最高的一批入口。
- OC 侧继续保留 `byDelegate` / `byDataSource` 传统协议入口，同时新增轻量 Block 入口。
- 当前优先覆盖：`byTarget`、`byNumberOfSections`、`byNumberOfRowsInSection`、`cellForRowAt`、`didSelectRowAt`、`byNumberOfItemsInSection`、`cellForItemAt`、`didSelectItemAt`。
- 推荐顺序仍然不变：先列表本层属性，再公共 `UIView` / `UIScrollView` 属性，最后 `byAddTo` 进父视图；`byTarget` 和列表 Block 配置放在列表本层链里。
- Block 化适合简单页面和 Demo；复杂页面仍允许使用正式协议，避免把所有业务塞进创建闭包。

```objc
_tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
    tableView
        .byRowHeight(56)
        .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
        .byTarget(self)
        .byNumberOfRowsInSection(^NSInteger(id  _Nonnull target, UITableView * _Nonnull tv, NSInteger section) {
            return self.dataMutArr.count;
        })
        .cellForRowAt(^__kindof UITableViewCell * _Nonnull(id  _Nonnull target, UITableView * _Nonnull tv, NSIndexPath * _Nonnull indexPath) {
            UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            if (!cell) {
                cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
            }
            cell.textLabel.text = self.dataMutArr[indexPath.row];
            return cell;
        })
        .didSelectRowAt(^(id  _Nonnull target, UITableView * _Nonnull tv, NSIndexPath * _Nonnull indexPath) {
            [tv deselectRowAtIndexPath:indexPath animated:YES];
        })
        .byDelegate(self)
        .byDataSource(self)
        .addOn(self.view)
        .byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        });
});
```

```objc
_collectionView = jobsMakeCollectionView(^(__kindof UICollectionView * _Nullable collectionView) {
    collectionView
        .byCollectionViewLayout(self.flowLayout)
        .byBackgroundView(nil)
        .byTarget(self)
        .byNumberOfItemsInSection(^NSInteger(id  _Nonnull target, UICollectionView * _Nonnull cv, NSInteger section) {
            return self.dataMutArr.count;
        })
        .cellForItemAt(^__kindof UICollectionViewCell * _Nonnull(id  _Nonnull target, UICollectionView * _Nonnull cv, NSIndexPath * _Nonnull indexPath) {
            UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
            return cell;
        })
        .didSelectItemAt(^(id  _Nonnull target, UICollectionView * _Nonnull cv, NSIndexPath * _Nonnull indexPath) {
            [cv deselectItemAtIndexPath:indexPath animated:YES];
        })
        .addOn(self.view)
        .byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        });
});
```

## 五、与 Swift 侧对照 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Swift 侧 | OC 侧 | 说明 |
| --- | --- | --- |
| `UILabel()` / `UIButton.sys()` | `jobsMakeLabel` / `jobsMakeButton` | OC 侧用 `JobsMake` 提供创建 Block。 |
| `JobsSwiftDSL` | `JobsOCDSL` | UI 属性点语法链式配置。 |
| `SnapKit` / `byAddTo` | `Masonry` / `UIView+MasonryDSL` | 加父视图和约束收口。 |
| Swift Model DSL | `JobsModelDSL` | 配置 `JobsLocationModel`、`UIButtonModel`、`UITextModel` 等模型。 |
| 列表 Block 化 | OC 已落地首批接口 | 当前已支持 `byTarget`、`byNumberOfRowsInSection`、`cellForRowAt`、`didSelectRowAt`、`byNumberOfItemsInSection`、`cellForItemAt`、`didSelectItemAt`。 |

## 六、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 不要把业务 UI、历史网格算法、动画算法直接搬进公共 DSL。
- 不要在公开头里为了 DSL 便利扩大 import；实现细节放 `.m`。
- 不要用重复定义父类属性的方式解决链式返回类型问题。
- 批量替换 `jobsMakeXXX` 内部赋值时，要优先处理同类语法错误，例如 Block 属性少写调用括号。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
