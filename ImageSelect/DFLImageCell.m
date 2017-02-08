//
//  DFLImageCell.m
//  ImageSelect
//
//  Created by 杭州移领 on 17/2/7.
//  Copyright © 2017年 DFL. All rights reserved.
//

#import "DFLImageCell.h"

@interface DFLImageCell ()

@property (nonatomic , strong) UIButton *deleButton;

@end

@implementation DFLImageCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        
        UIButton *deleButton = [[UIButton alloc] init];
        deleButton.backgroundColor = [UIColor yellowColor];
        
        [deleButton addTarget:self action:@selector(deleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:deleButton];
        self.deleButton = deleButton;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 10, CGRectGetWidth(self.frame) - 10, CGRectGetWidth(self.frame) - 10);
    self.deleButton.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) - 10, 0, 20, 20) ;
    self.deleButton.layer.cornerRadius = 10;
    self.deleButton.layer.masksToBounds = YES;
    
}

- (void)deleButtonAction:(UIButton *)button {
    
    if (_delegate && [_delegate respondsToSelector:@selector(imageCell:didClickDeleButton:)]) {
        [self.delegate imageCell:self didClickDeleButton:button];
    }
}

@end
