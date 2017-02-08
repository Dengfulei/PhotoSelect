//
//  DFLPhotoView.h
//  ImageSelect
//
//  Created by 杭州移领 on 17/2/7.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DFLPhotoView;
@protocol DFLPhotoViewDelegate <NSObject>

- (void)photoView:(DFLPhotoView *)photoView didClickPlusImage:(NSIndexPath *)indexPath;

- (void)photoView:(DFLPhotoView *)photoView didSelectedImage:(NSIndexPath *)indexPath;

- (void)photoView:(DFLPhotoView *)photoView didDeleButton:(NSIndexPath *)indexPath;
@end

@interface DFLPhotoView : UIView

@property (nonatomic , strong) NSMutableArray *picPathArray;

@property (nonatomic , assign) id <DFLPhotoViewDelegate> delegate;

@property (nonatomic , strong) UICollectionView *collectionView;


@end
