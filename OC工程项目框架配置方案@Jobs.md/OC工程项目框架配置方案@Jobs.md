# [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 工程项目框架配置方案@JobsKits

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

这份文档对齐 [**Swift**](https://www.swift.org/) 侧 `Swift工程项目框架配置方案@Jobs.md`，用于沉淀 OC 工程的 UI 创建、属性配置、父视图装配、[**Masonry**](https://github.com/SnapKit/Masonry) 约束和列表免协议 Block 化方向。

OC 侧核心思想是：`JobsMake` 创建对象，`JobsOCDSL` / `JobsModelDSL` 配置属性，`UIView+DSL` / `Masonry+DSL` 完成父视图装配和约束，依赖真实 `frame` 的效果放到约束刷新之后。

## 一、基础原则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- UI 创建优先使用 `JobsMakes@Pods/JobsMakes.h` 里的 `jobsMakeXXX`。
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

## 六、快速 UI DSL 全配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

### 6.1、书写约定

- 所有 UI 配置优先使用 `JobsMake` + `JobsOCDSL` / `JobsModelDSL` 点语法链式写法。
- 点语法以行为最小单位提行书写，方便复制后按行删除或注释。
- 跟在某一行 DSL 后面的说明统一用两根双斜杠 `//`；单独成行的说明统一用三根双斜杠 `///`。
- 颗粒度要细：标题、颜色、字体、图片、状态、事件、装配、约束分别独立成行，不合并表达。
- 同一 DSL 同时存在单参数和二参数写法时，默认首选单参数写法；二参数写法只用于 `UIControlStateSelected`、`UIControlStateDisabled`、`UIControlStateHighlighted` 等非默认状态差异。
- 调用顺序固定为：当前 UI 类型本层 DSL、父类公共 DSL、事件 DSL、`addOn` / `byAddTo` + [**Masonry**](https://github.com/SnapKit/Masonry) 约束。

### 6.2、`UILabel`

```objc
_titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
    label
        .byText(@"标题") // 设置文本
        .byFont([UIFont boldSystemFontOfSize:16]) // 设置字体
        .byTextCor(UIColor.labelColor) // 设置文字颜色
        .byTextAlignment(NSTextAlignmentCenter) // 设置对齐方式
        .byNumberOfLines(1) // 设置行数
        .makeLabelByShowingType(UILabelShowingType_02) // 设置展示策略
        .byBgColor(UIColor.clearColor) // 设置背景色
        .byCornerRadius(JobsWidth(8)) // 设置圆角
        .byClipsToBounds(YES) // 裁剪圆角
        .addOn(self.contentView) // 加入父视图
        .byAdd(^(MASConstraintMaker *make) { // 部署约束
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(8, 12, 8, 12));
        });
});
```

### 6.3、`UIButton`

```objc
_submitBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
    button
        .byTitle(@"确认") // 设置标题
        .byTitleCor(UIColor.whiteColor) // 设置标题颜色
        .byTitleFont([UIFont boldSystemFontOfSize:16]) // 设置标题字体
        .byImage(JobsIMG(@"icon_submit")) // 设置图片
        .byBgColor(UIColor.systemBlueColor) // 设置背景色
        .byCornerRadius(JobsWidth(10)) // 设置圆角
        .byClipsToBounds(YES) // 裁剪圆角
        .addOn(self.view) // 加入父视图
        .byAdd(^(MASConstraintMaker *make) { // 部署约束
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.height.mas_equalTo(JobsWidth(48));
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(16));
        });
    /// 点按事件单独绑定：该 API 返回 RACDisposable，不接在主链中间
    button.jobsBtnClickEventByBlock(^id(id data) {
        UIButton *sender = (UIButton *)data;
        sender.selected = !sender.selected;
        return sender;
    });
});
```

### 6.4、`UITextField`

```objc
_nameTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
    textField
        .byText(@"") // 设置文本
        .byFont([UIFont systemFontOfSize:15]) // 设置字体
        .byTextCor(UIColor.labelColor) // 设置文字颜色
        .byTextAlignment(NSTextAlignmentLeft) // 设置对齐方式
        .byPlaceholder(@"请输入名称") // 设置占位文字
        .byPlaceholderColor(UIColor.secondaryLabelColor) // 设置占位颜色
        .byPlaceholderFont([UIFont systemFontOfSize:15]) // 设置占位字体
        .byKeyboardType(UIKeyboardTypeDefault) // 设置键盘类型
        .byReturnKeyType(UIReturnKeyDone) // 设置返回键
        .byClearButtonMode(UITextFieldViewModeWhileEditing) // 设置清除按钮
        .byDelegate(self) // 设置代理
        .byBgColor(UIColor.secondarySystemBackgroundColor) // 设置背景色
        .byCornerRadius(JobsWidth(8)) // 设置圆角
        .byClipsToBounds(YES) // 裁剪圆角
        .addOn(self.view) // 加入父视图
        .byAdd(^(MASConstraintMaker *make) { // 部署约束
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(12));
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.height.mas_equalTo(JobsWidth(44));
        });
});
```

### 6.5、`UITextView`

```objc
_remarkTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
    textView
        .byText(@"备注") // 设置文本
        .byFont([UIFont systemFontOfSize:15]) // 设置字体
        .byTextCor(UIColor.labelColor) // 设置文字颜色
        .byTextAlignment(NSTextAlignmentLeft) // 设置对齐方式
        .byEditable(YES) // 允许编辑
        .bySelectable(YES) // 允许选择
        .byDataDetectorTypes(UIDataDetectorTypeNone) // 设置数据识别
        .byKeyboardType(UIKeyboardTypeDefault) // 设置键盘类型
        .byDelegate(self) // 设置代理
        .byBgColor(UIColor.secondarySystemBackgroundColor) // 设置背景色
        .byCornerRadius(JobsWidth(8)) // 设置圆角
        .byClipsToBounds(YES) // 裁剪圆角
        .addOn(self.view) // 加入父视图
        .byAdd(^(MASConstraintMaker *make) { // 部署约束
            make.top.equalTo(self.nameTextField.mas_bottom).offset(JobsWidth(12));
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.height.mas_equalTo(JobsWidth(120));
        });
});
```

### 6.6、`UIImageView`

```objc
_avatarImgView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
    imageView
        .byImage(JobsIMG(@"avatar_placeholder")) // 设置图片
        .byHighlightedImage(JobsIMG(@"avatar_selected")) // 设置高亮图片
        .byContentMode(UIViewContentModeScaleAspectFill) // 设置填充模式
        .byUserInteractionEnabled(YES) // 开启交互
        .byBgColor(UIColor.tertiarySystemBackgroundColor) // 设置背景色
        .byCornerRadius(JobsWidth(32)) // 设置圆角
        .byClipsToBounds(YES) // 裁剪圆角
        .addOn(self.view) // 加入父视图
        .byAdd(^(MASConstraintMaker *make) { // 部署约束
            make.top.equalTo(self.remarkTextView.mas_bottom).offset(JobsWidth(12));
            make.left.equalTo(self.view).offset(JobsWidth(16));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(64)));
        });
});
```

### 6.7、`UITableView`

```objc
_tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
    tableView
        .byRowHeight(JobsWidth(56)) // 设置行高
        .byEstimatedRowHeight(JobsWidth(56)) // 设置预估行高
        .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine) // 设置分割线
        .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag) // 拖拽收键盘
        .byShowsVerticalScrollIndicator(YES) // 显示纵向滚动条
        .byAlwaysBounceVertical(YES) // 允许纵向回弹
        .byTarget(self) // 设置 Block 目标
        .byNumberOfRowsInSection(^NSInteger(id  _Nonnull target, UITableView * _Nonnull tv, NSInteger section) { // 设置行数
            return self.dataMutArr.count;
        })
        .cellForRowAt(^__kindof UITableViewCell * _Nonnull(id  _Nonnull target, UITableView * _Nonnull tv, NSIndexPath * _Nonnull indexPath) { // 设置 cell
            UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            if (!cell) cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
            cell.textLabel.text = self.dataMutArr[indexPath.row];
            return cell;
        })
        .didSelectRowAt(^(id  _Nonnull target, UITableView * _Nonnull tv, NSIndexPath * _Nonnull indexPath) { // 设置选中事件
            [tv deselectRowAtIndexPath:indexPath animated:YES];
        })
        .byDelegate(self) // 设置代理
        .byDataSource(self) // 设置数据源
        .byBgColor(UIColor.systemBackgroundColor) // 设置背景色
        .addOn(self.view) // 加入父视图
        .byAdd(^(MASConstraintMaker *make) { // 部署约束
            make.edges.equalTo(self.view);
        });
});
```

### 6.8、`UICollectionView`

```objc
_collectionView = jobsMakeCollectionView(^(__kindof UICollectionView * _Nullable collectionView) {
    collectionView
        .byCollectionViewLayout(self.flowLayout) // 设置布局对象
        .byShowsVerticalScrollIndicator(NO) // 隐藏纵向滚动条
        .byAlwaysBounceVertical(YES) // 允许纵向回弹
        .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag) // 拖拽收键盘
        .byTarget(self) // 设置 Block 目标
        .byNumberOfItemsInSection(^NSInteger(id  _Nonnull target, UICollectionView * _Nonnull cv, NSInteger section) { // 设置 item 数
            return self.dataMutArr.count;
        })
        .cellForItemAt(^__kindof UICollectionViewCell * _Nonnull(id  _Nonnull target, UICollectionView * _Nonnull cv, NSIndexPath * _Nonnull indexPath) { // 设置 cell
            UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
            return cell;
        })
        .didSelectItemAt(^(id  _Nonnull target, UICollectionView * _Nonnull cv, NSIndexPath * _Nonnull indexPath) { // 设置选中事件
            [cv deselectItemAtIndexPath:indexPath animated:YES];
        })
        .byDelegate(self) // 设置代理
        .byDataSource(self) // 设置数据源
        .byBgColor(UIColor.systemBackgroundColor) // 设置背景色
        .addOn(self.view) // 加入父视图
        .byAdd(^(MASConstraintMaker *make) { // 部署约束
            make.edges.equalTo(self.view);
        });
});
```

## 七、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 不要把业务 UI、历史网格算法、动画算法直接搬进公共 DSL。
- 不要在公开头里为了 DSL 便利扩大 import；实现细节放 `.m`。
- 不要用重复定义父类属性的方式解决链式返回类型问题。
- 批量替换 `jobsMakeXXX` 内部赋值时，要优先处理同类语法错误，例如 Block 属性少写调用括号。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
