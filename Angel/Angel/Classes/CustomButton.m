//
//  CustomButton.m
//  dotaVideo
//
//  Created by jiuguo on 14-9-25.
//  Copyright (c) 2014年 Jinxiang. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton
{
    CGRect _imageRect;
    CGRect _titleRect;
}

- (id)initWithFrame:(CGRect)frame imageRect:(CGRect)imageRect titleRect:(CGRect)titleRect
{
    self = [super initWithFrame:frame];
    if (self){
        _imageRect = imageRect;
        _titleRect = titleRect;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return _imageRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return _titleRect;
}

@end
