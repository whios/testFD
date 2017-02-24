//
//  CustomTableViewCell.h
//  TestFD
//
//  Created by colawh on 16/12/16.
//  Copyright © 2016年 colawh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestHeightModel.h"
@interface CustomTableViewCell : UITableViewCell
@property ( nonatomic) IBOutlet UILabel *testFDLabel;
@property(nonatomic)TestHeightModel *model;
@end
