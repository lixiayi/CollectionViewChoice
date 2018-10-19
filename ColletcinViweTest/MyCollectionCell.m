//
//  MyCollectionCell.m
//  ColletcinViweTest
//
//  Created by xiaoyi li on 2018/10/19.
//  Copyright © 2018年 xiaoyi li. All rights reserved.
//

#import "MyCollectionCell.h"

@implementation MyCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setModel:(MyModel *)model {
    _model = model;
    [self.btn setTitle:model.title forState:UIControlStateNormal];
    if (model.seleted) {
        self.btn.backgroundColor = [UIColor blueColor];
    } else {
        self.btn.backgroundColor = [UIColor greenColor];
    }
}

@end
