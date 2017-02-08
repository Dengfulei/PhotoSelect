//
//  DFLPlusCell.m
//  ImageSelect
//
//  Created by 杭州移领 on 17/2/8.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import "DFLPlusCell.h"

@interface DFLPlusCell ()

@property (nonatomic , strong) UIImageView *imageView;

@end

@implementation DFLPlusCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.image = [UIImage imageNamed:@"btn_fabuxinxi_newpic"];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

@end
