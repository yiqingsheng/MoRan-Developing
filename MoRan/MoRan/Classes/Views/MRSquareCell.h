//
//  MRSquareCell.h
//  MoRan
//
//  Created by yikobe_mac on 15/10/7.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRSquareCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end
