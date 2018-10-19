//
//  MyCell.h
//  ColletcinViweTest
//
//  Created by xiaoyi li on 2018/10/19.
//  Copyright © 2018年 xiaoyi li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
#import "MyCollectionCell.h"

@interface MyCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *seletedData;

@end
