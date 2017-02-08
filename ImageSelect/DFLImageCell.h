//
//  DFLImageCell.h
//  ImageSelect
//
//  Created by 杭州移领 on 17/2/7.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DFLImageCell;
@protocol DFLImageCellDelegate <NSObject>

- (void)imageCell:(DFLImageCell *)cell didClickDeleButton:(UIButton *)button;

@end


@interface DFLImageCell : UICollectionViewCell

@property (nonatomic , strong) UIImageView *imageView;


@property (nonatomic , assign) id <DFLImageCellDelegate>delegate;

@end
