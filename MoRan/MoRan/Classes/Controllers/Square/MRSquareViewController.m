//
//  MRSquareViewController.m
//  MoRan
//
//  Created by yikobe_mac on 15/10/7.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import "MRSquareViewController.h"
#import "MRSquareCell.h"

@interface MRSquareViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MRSquareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - table view data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MRSquareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"squareCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MRSquareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"squareCell"];
    }
    cell.locationLabel.text = @"我的位置";
    [cell.collectionView reloadData];
    
    return cell;
}



@end
