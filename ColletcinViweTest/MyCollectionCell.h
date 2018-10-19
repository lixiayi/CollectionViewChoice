//
//  MyCollectionCell.h
//  ColletcinViweTest
//
//  Created by xiaoyi li on 2018/10/19.
//  Copyright © 2018年 xiaoyi li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

@interface MyCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) MyModel *model;

@end
