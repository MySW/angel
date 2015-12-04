//
//  HeartLineView.h
//  CBChart
//
//  Created by fengshuai on 15/12/4.
//  Copyright © 2015年 pacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeartLineView : UIView
+(instancetype)charView;

/*
 * x坐标的值和y坐标的值
 * coordinate values, chart will draw itself on layer
 * try to value string to xValues' element or yValues' element
 */
@property (strong, nonatomic) NSMutableArray *xValues;
@property (strong, nonatomic) NSMutableArray *yValues;


/** 是否需要虚线网格 */
@property (assign, nonatomic) BOOL isDrawDashLine;
/** 关闭坐标系动画 */
@property (assign, nonatomic) BOOL shutDefaultAnimation;
/** default is 4 (y轴方向的实数个数) */
@property (assign, nonatomic) int yValueCount;
/** 函数线条 或者 柱状图的粗细 */
@property (assign, nonatomic) CGFloat chartWidth;
/** 颜色 */
@property (strong, nonatomic) UIColor *chartColor;




@end
