//
//  DFLViewController.m
//  ImageSelect
//
//  Created by 杭州移领 on 17/2/7.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import "DFLViewController.h"
#import "DFLPhotoView.h"
#import "TZImagePickerController.h"

@interface DFLViewController ()<DFLPhotoViewDelegate,TZImagePickerControllerDelegate>
@property (nonatomic , strong) NSMutableArray *selectedImages;
@property (nonatomic , strong) NSMutableArray *selectedAssets;
@property (nonatomic , strong) DFLPhotoView *photoView;
@end

@implementation DFLViewController


#warning 使用TZImagePickerController的时候需要在PROJECT 的Localizatios添加简体中文
- (void)viewDidLoad {
    [super viewDidLoad];
    DFLPhotoView *photoView = [[DFLPhotoView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 0)];
    photoView.delegate = self;
    photoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:photoView];
    self.photoView = photoView;
    
}

- (void)photoView:(DFLPhotoView *)photoView didSelectedImage:(NSIndexPath *)indexPath {
    
}


- (void)photoView:(DFLPhotoView *)photoView didClickPlusImage:(NSIndexPath *)indexPath {
     TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:8 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    
    imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    imagePickerVc.allowTakePicture = YES ;// 在内部显示拍照按钮
//     imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
//     imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
//     imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
//     imagePickerVc.navigationBar.translucent = NO;
    [self presentViewController:imagePickerVc animated:YES completion:nil];

}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    _selectedImages = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    self.photoView.picPathArray = self.selectedImages;
}

- (void)photoView:(DFLPhotoView *)photoView didDeleButton:(NSIndexPath *)indexPath {
    [_selectedImages removeObjectAtIndex:indexPath.row];
    [_selectedAssets removeObjectAtIndex:indexPath.row];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
