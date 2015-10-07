//
//  MRSquareCell.m
//  MoRan
//
//  Created by yikobe_mac on 15/10/7.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import "MRSquareCell.h"
#import "MRSquareCollectionCell.h"

@implementation MRSquareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark - collection view data source methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MRSquareCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.titleLabel.text = @"yikobe";
    
    return cell;
}



@end
