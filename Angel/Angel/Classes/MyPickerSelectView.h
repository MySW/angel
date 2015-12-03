//
//  MyPickerSelectView.h
//  Angel
//
//  Created by fengshuai on 15/12/3.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPickerSelectView : UIView<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *dataArr;
    NSString *dataStr;
    NSInteger dataFlag;
}
@property (nonatomic, strong) UIButton *determineBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIPickerView *selectPickerView;



- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)arr withFlag:(NSInteger)flag;



@end
