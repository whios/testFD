//
//  CustomTableViewCell.m
//  TestFD
//
//  Created by colawh on 16/12/16.
//  Copyright © 2016年 colawh. All rights reserved.
//

#import "CustomTableViewCell.h"
#import <Masonry.h>
@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.testFDLabel = [[UILabel alloc]init];
        self.testFDLabel.numberOfLines = 0;
        [self.contentView addSubview:self.testFDLabel];
        self.contentView.backgroundColor = [UIColor orangeColor];
        [self.testFDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.right.equalTo(@(-10));
            make.top.equalTo(@10);
            make.bottom.equalTo(@-10);
//            make.edges.insets = UIEdgeInsetsMake(0, 10, 0, 10);
        }];
//        [self.testFDLabel sizeToFit];
    }
    return self;
}
- (void)setModel:(TestHeightModel *)model
{
  
    if (_model != model) {
        _model = model;
        _testFDLabel.text = [NSString stringWithFormat:@"%@", model.text];
    }

}
@end
