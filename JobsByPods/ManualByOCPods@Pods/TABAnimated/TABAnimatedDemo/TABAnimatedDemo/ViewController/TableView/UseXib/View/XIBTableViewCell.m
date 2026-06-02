//
//  XIBTableViewCell.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "XIBTableViewCell.h"

#import <TABAnimated/UIView+TABAnimated.h>

@interface XIBTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;
@property (weak, nonatomic) IBOutlet UILabel *testLab;
@property (weak, nonatomic) IBOutlet UILabel *testLab2;
@property (weak, nonatomic) IBOutlet UILabel *testLab3;
@property (weak, nonatomic) IBOutlet UILabel *testLab4;

@end

@implementation XIBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateCell {
    self.testLab.text = @"测试数据";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
