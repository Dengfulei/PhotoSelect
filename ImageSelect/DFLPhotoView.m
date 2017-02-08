//
//  DFLPhotoView.m
//  ImageSelect
//
//  Created by 杭州移领 on 17/2/7.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import "DFLPhotoView.h"
#import "DFLImageCell.h"
#import "DFLPlusCell.h"

@interface DFLPhotoView () <UICollectionViewDelegate,UICollectionViewDataSource,DFLImageCellDelegate>




@end

@implementation DFLPhotoView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    flowLayout.itemSize = CGSizeMake((CGRectGetWidth(self.frame) - 5 * 10) / 4, (CGRectGetWidth(self.frame) - 5 * 10) / 4);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:NSClassFromString(@"DFLImageCell") forCellWithReuseIdentifier:@"DFLImageCell"];
     [self.collectionView registerClass:NSClassFromString(@"DFLPlusCell") forCellWithReuseIdentifier:@"DFLPlusCell"];
    [self addSubview:self.collectionView];
    [self calculateViewFrame];


}

- (void)setPicPathArray:(NSMutableArray *)picPathArray {
    
    _picPathArray = picPathArray;
    [self calculateViewFrame];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self numberOfItem];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.picPathArray.count > 8) {
        DFLImageCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DFLImageCell" forIndexPath:indexPath];
        imageCell.imageView.image = self.picPathArray[indexPath.row];
        imageCell.delegate = self;
        return imageCell;
    } else {
        
        if (indexPath.row == self.picPathArray.count) {
            DFLPlusCell *plusCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DFLPlusCell" forIndexPath:indexPath];
            return plusCell;
        } else {
            DFLImageCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DFLImageCell" forIndexPath:indexPath];
            imageCell.imageView.image = self.picPathArray[indexPath.row];
            imageCell.delegate = self;
            return imageCell;
        }
    }
}

- (NSInteger)numberOfItem {
    
    if (self.picPathArray.count < 8) {
        return self.picPathArray.count + 1;
    } else {
        return self.picPathArray.count;
    }
}

- (void)calculateViewFrame {
    
    CGFloat itemW = (CGRectGetWidth(self.frame) - 5 * 10) / 4;// 10 间隙
    long imageRow = ([self numberOfItem] + 4 - 1) / 4;
    CGFloat viewH = itemW * imageRow + (imageRow - 1) * 10;  //10间隙
    CGRect frame = self.frame;
    frame.size.height = viewH;
    self.frame = frame;
    self.collectionView.frame = self.bounds;
}

- (void)imageCell:(DFLImageCell *)cell didClickDeleButton:(UIButton *)button {
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
  

    if (self.delegate && [self.delegate respondsToSelector:@selector(photoView:didDeleButton:)]) {
        [self.delegate photoView:self didDeleButton:indexPath];
    }
    [self calculateViewFrame];
    [self.collectionView performBatchUpdates:^{
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self.collectionView reloadData];
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.picPathArray.count < 8) {
        if (indexPath.row == self.picPathArray.count) {
            NSLog(@"点击加号按钮");
            if (self.delegate && [self.delegate respondsToSelector:@selector(photoView:didClickPlusImage:)]) {
                [self.delegate photoView:self didClickPlusImage:indexPath];
            }
        } else {
             NSLog(@"点击跳转相册");
            if (self.delegate && [self.delegate respondsToSelector:@selector(photoView:didSelectedImage:)]) {
                [self.delegate photoView:self didSelectedImage:indexPath];
            }
        }
    } else {
        NSLog(@"点击跳转相册");
        if (self.delegate && [self.delegate respondsToSelector:@selector(photoView:didSelectedImage:)]) {
            [self.delegate photoView:self didSelectedImage:indexPath];
        }

    }
}




@end
