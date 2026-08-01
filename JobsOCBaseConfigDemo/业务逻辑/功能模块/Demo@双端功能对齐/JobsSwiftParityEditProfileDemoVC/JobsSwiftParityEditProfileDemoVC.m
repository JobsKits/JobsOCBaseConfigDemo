//
//  JobsSwiftParityEditProfileDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityEditProfileDemoVC.h"

static NSString *const JobsOCEditProfileDefaultsKey = @"JobsSwiftParityEditProfileDemoVC.ProfileValues";

@interface JobsSwiftParityEditProfileDemoVC ()
<
UITableViewDataSource,
UITableViewDelegate
>

Prop_strong()UITableView *profileTableView;
Prop_strong()NSMutableDictionary<NSString *, NSString *> *profileValueMutDic;
Prop_copy()NSArray<NSArray<NSString *> *> *profileSectionArr;

-(void)presentChoices:(NSArray<NSString *> *)choices
               forKey:(NSString *)key;
-(void)presentTextEditorForKey:(NSString *)key;
-(void)saveProfileValues;

@end

@implementation JobsSwiftParityEditProfileDemoVC

-(NSString *)demoNavigationTitle{
    return @"Edit profile";
}

-(void)configureDemo{
    self.parityScrollView.byRemove();
    NSDictionary *savedValues = [NSUserDefaults.standardUserDefaults dictionaryForKey:JobsOCEditProfileDefaultsKey];
    if (savedValues.count) [self.profileValueMutDic addEntriesFromDictionary:savedValues];
    self.profileTableView.byHidden(NO);
    [self.profileTableView reloadData];
}

-(void)saveProfileValues{
    [NSUserDefaults.standardUserDefaults setObject:self.profileValueMutDic.copy
                                           forKey:JobsOCEditProfileDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(void)presentChoices:(NSArray<NSString *> *)choices
               forKey:(NSString *)key{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:key.tr
                                                                              message:nil
                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *choice in choices) {
        @jobs_weakify(self)
        [alertController addAction:[UIAlertAction actionWithTitle:choice.tr
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(__unused UIAlertAction *action) {
            @jobs_strongify(self)
            self.profileValueMutDic[key] = choice;
            [self saveProfileValues];
            [self.profileTableView reloadData];
        }]];
    }
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消".tr
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

-(void)presentTextEditorForKey:(NSString *)key{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:key.tr
                                                                              message:nil
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField
            .byText(self.profileValueMutDic[key])
            .byTextCor(JobsLabelColor)
            .byPlaceholder([NSString stringWithFormat:@"请输入%@",key].tr);
        if ([key isEqualToString:@"昵称"]) {
            textField.byAutocorrectionType(UITextAutocorrectionTypeNo)
                .byAutocapitalizationType(UITextAutocapitalizationTypeNone);
        }
    }];
    @jobs_weakify(self)
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消".tr
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"完成".tr
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(__unused UIAlertAction *action) {
        @jobs_strongify(self)
        NSString *text = alertController.textFields.firstObject.text;
        text = [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        if (!text.length) return;
        if ([key isEqualToString:@"昵称"] && text.length > 12) {
            text = [text substringToIndex:12];
        }
        self.profileValueMutDic[key] = text;
        [self saveProfileValues];
        [self.profileTableView reloadData];
    }]];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

#pragma mark —— UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.profileSectionArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.profileSectionArr[section].count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = self.profileSectionArr[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsEditProfileCell"];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleValue1
                                    reuseIdentifier:@"JobsEditProfileCell"];
    }
    [[cell.contentView viewWithTag:0x4A415641] removeFromSuperview];
    cell
        .bySelectionStyle(UITableViewCellSelectionStyleNone)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byBgColor(JobsSecondarySystemGroupedBackgroundColor);
    cell.textLabel
        .byText(key.tr)
        .byTextCor(JobsLabelColor)
        .byFont(UIFontWeightRegularSize(16));
    cell.detailTextLabel
        .byText([key isEqualToString:@"头像"] ? @"" : self.profileValueMutDic[key])
        .byTextCor(JobsSecondaryLabelColor)
        .byFont(UIFontWeightRegularSize(14));
    if ([key isEqualToString:@"昵称"]) {
        NSString *detail = self.profileValueMutDic[key] ?: @"Eric";
        NSMutableAttributedString *attributedText = [NSMutableAttributedString.alloc
            initWithString:[NSString stringWithFormat:@"等级达到2级才能修改昵称 %@",detail]
                attributes:@{
                    NSFontAttributeName: UIFontWeightRegularSize(14),
                    NSForegroundColorAttributeName: JobsSystemRedColor
                }];
        [attributedText addAttribute:NSForegroundColorAttributeName
                              value:JobsSecondaryLabelColor
                              range:NSMakeRange(attributedText.length - detail.length, detail.length)];
        cell.detailTextLabel.byAttributedText(attributedText);
    }
    if ([key isEqualToString:@"头像"]) {
        jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(@"Ani".img ?: @"person.crop.circle.fill".sys_img)
                .byTag(0x4A415641)
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byBgColor(JobsTertiarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(22))
                .byClipsToBounds(YES)
                .addOn(cell.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(cell.contentView).offset(-JobsWidth(16));
                    make.centerY.equalTo(cell.contentView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(44), JobsWidth(44)));
                });
        });
    };return cell;
}

#pragma mark —— UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = self.profileSectionArr[indexPath.section][indexPath.row];
    return JobsWidth([key isEqualToString:@"头像"] ? 72 : 52);
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return JobsWidth(section == 0 ? 8 : 16);
}

-(UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    return jobsMakeView(^(__kindof UIView * _Nullable view) {
        view.byBgColor(JobsClearColor);
    });
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *key = self.profileSectionArr[indexPath.section][indexPath.row];
    if ([key isEqualToString:@"头像"]) {
        [self presentChoices:@[@"允许全部照片",@"选择部分照片",@"不允许"]
                      forKey:key];
    }else if ([key isEqualToString:@"性别"]){
        [self presentChoices:@[@"女",@"男",@"不想透露"]
                      forKey:key];
    }else if ([key isEqualToString:@"情感"]){
        [self presentChoices:@[@"已婚",@"单身",@"不想透露"]
                      forKey:key];
    }else if ([key isEqualToString:@"生日"]){
        [self presentChoices:@[@"2025-09-22",@"2000-01-01",@"1995-09-22"]
                      forKey:key];
    }else{
        [self presentTextEditorForKey:key];
    }
}

#pragma mark —— LazyLoad
-(UITableView *)profileTableView{
    if (!_profileTableView) {
        @jobs_weakify(self)
        _profileTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byDataSource(self)
                .byDelegate(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(JobsSeparatorColor)
                .byTableFooterView(UIView.new)
                .byScrollEnabled(NO)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSystemGroupedBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    };return _profileTableView;
}

-(NSMutableDictionary<NSString *,NSString *> *)profileValueMutDic{
    if (!_profileValueMutDic) {
        _profileValueMutDic = @{
            @"昵称": @"Eric",
            @"性别": @"female",
            @"签名": @"This person left nothing behind",
            @"生日": @"2025-09-22",
            @"情感": @"secret",
            @"家乡": @"Mars",
            @"职业": @"product manager"
        }.mutableCopy;
    };return _profileValueMutDic;
}

-(NSArray<NSArray<NSString *> *> *)profileSectionArr{
    if (!_profileSectionArr) {
        _profileSectionArr = @[
            @[@"头像",@"昵称",@"性别",@"签名"],
            @[@"生日",@"情感",@"家乡",@"职业"]
        ];
    };return _profileSectionArr;
}

@end
