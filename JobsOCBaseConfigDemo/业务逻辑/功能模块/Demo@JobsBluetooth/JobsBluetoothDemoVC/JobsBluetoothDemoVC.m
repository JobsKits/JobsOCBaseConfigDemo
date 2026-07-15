//
//  JobsBluetoothDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothDemoVC.h"
#import "JobsBluetoothFeatureDemoVC.h"

@interface JobsBluetoothDemoVC ()

Prop_strong()UITableView *tableView;
Prop_copy()NSArray <NSString *>*features;

@end

@implementation JobsBluetoothDemoVC
@synthesize tableView = _tableView;

-(void)loadView{
    [super loadView];
    self.viewModel.byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
        data.byText(@"JobsBluetooth 全能力 Demo")
            .byFont(UIFontWeightRegularSize(16));
    });
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsWhiteColor);
    self.makeNavByAlpha(1);
    self.tableView.byVisible(YES);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{return self.features.count;}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseIdentifier = @"JobsBluetoothDemoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    return cell.byTextLabel(^(__kindof UILabel * _Nullable label) {
        label.byText([NSString stringWithFormat:@"%ld. %@", (long)indexPath.row + 1, self.features[indexPath.row]])
            .byFont(UIFontWeightMediumSize(15));
    }).byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
        label.byText(indexPath.row == 21 ? @"进入详情页，模拟器可直接运行" : @"进入独立功能详情页")
            .byFont(UIFontWeightRegularSize(12));
    }).byAccessoryType(UITableViewCellAccessoryDisclosureIndicator);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JobsBluetoothFeatureDemoVC *detailVC = [JobsBluetoothFeatureDemoVC.alloc initWithFeatureIndex:indexPath.row
                                                                                     featureTitle:self.features[indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            tableView.byDataSource(self)
                .byDelegate(self)
                .byRowHeight(JobsWidth(64))
                .byBgColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    };return _tableView;
}

-(NSArray<NSString *> *)features{
    if (!_features) _features = @[@"蓝牙状态与权限", @"扫描配置", @"扫描过滤与去重", @"实时 RSSI", @"单设备连接", @"多设备并发连接", @"Service / Characteristic / Descriptor 浏览", @"Read", @"Write With Response", @"Write Without Response", @"Notify 开启与关闭", @"MTU 与自动分包", @"命令队列", @"超时与重试", @"自动重连", @"主动断开与异常断开", @"前后台与状态恢复", @"Device Profile", @"协议 Encoder / Decoder", @"CRC 校验策略", @"初始化握手", @"Mock 蓝牙设备", @"数据录制与回放", @"错误与诊断日志", @"Objective-C DSL", @"Swift API 设计", @"OTA 扩展接口", @"未知协议占位接入"];
    return _features;
}

@end
