//
//  MyCell.m
//  ColletcinViweTest
//
//  Created by xiaoyi li on 2018/10/19.
//  Copyright © 2018年 xiaoyi li. All rights reserved.
//

#import "MyCell.h"
#import "Masonry.h"

@implementation MyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createViews];
        [self layoutViews];
    }
    
    return self;
}

- (void)createViews {
    [self.contentView addSubview:self.collectionView];
}

- (void)layoutViews {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [UICollectionViewFlowLayout new];
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 10;
    }
    
    return _layout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10,20, self.bounds.size.width - 20, 120) collectionViewLayout:self.layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"MyCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionCell"];
        _collectionView.backgroundColor = [UIColor redColor];
    }
    return _collectionView;
}

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
        
        for (int i=0; i<10; i++) {
            MyModel *tempModel = [MyModel new];
            tempModel.title = [NSString stringWithFormat:@"%d",i];
            [_data addObject:tempModel];
        }
    }
    
    return _data;
}

- (NSMutableArray *)seletedData {
    if (!_seletedData) {
        _seletedData = [NSMutableArray array];
    }
    
    return _seletedData;
}

#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.data count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionCell" forIndexPath:indexPath];
    cell.model = self.data[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MyModel *tmodel =  self.data[indexPath.row];
    tmodel.seleted = !tmodel.seleted;
    NSLog(@"title>>>%@",tmodel.title);
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
    if (tmodel.seleted) {
        [self.seletedData addObject:tmodel.title];
    } else {
        [self.seletedData removeObject:tmodel.title];
    }
    NSLog(@"self.seletedData--->%@",self.seletedData);
}
@end
