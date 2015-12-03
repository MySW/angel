//
//  MyPickerSelectView.m
//  Angel
//
//  Created by fengshuai on 15/12/3.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "MyPickerSelectView.h"

@implementation MyPickerSelectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加上button
        self.determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.determineBtn.frame = CGRectMake(self.frame.size.width - 60, 0, 60, 40);
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBtn.frame = CGRectMake(0 , 0, 60, 40);
        [self addSubview:self.determineBtn];
        
        [self addSubview:self.cancelBtn];
        
        [self.determineBtn setTitle:@"完成" forState:UIControlStateNormal];

        [self.cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.superview endEditing:YES];
        // 添加pickerView
        self.selectPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, self.frame.size.width, self.frame.size.height - 40)];
        [self addSubview:self.selectPickerView];
        self.selectPickerView.dataSource = self;
        self.selectPickerView.delegate = self;
         [self.selectPickerView selectRow:5 inComponent:0 animated:NO];
        self.backgroundColor = [UIColor colorWithRed:15/255.0 green:161/255.0 blue:240/255.0 alpha:1];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)arr withFlag:(NSInteger)flag
{
    self = [self initWithFrame:frame];
    if (self) {
        dataArr = arr;
        dataFlag = flag;
    }
    return self;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
    return [dataArr objectAtIndex:row];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (row == 0) {
        [self.determineBtn addTarget:self action:@selector(nothing) forControlEvents:UIControlEventTouchUpInside];
    }else {
        [self.determineBtn addTarget:self action:@selector(determineAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSString *identifierStr = [dataArr objectAtIndex:row];
    dataStr = identifierStr;
    
    [pickerView selectRow:row inComponent:0 animated:YES];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return dataArr.count;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.minimumFontSize = 8.0;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:UITextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (void)determineAction:(UIButton *)sender
{
    
    [self removeFromSuperview];
    NSDictionary *dic = @{@"1":dataStr, @"2":[NSString stringWithFormat:@"%ld",dataFlag]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BringNotification" object:nil userInfo:dic];
    self.frame = CGRectMake(500, 500, 500, 500);
    
}
- (void)cancelAction:(UIButton *)sender
{
    [self removeFromSuperview];
    self.frame = CGRectMake(500, 500, 500, 500);

}
- (void)nothing{
    
}

@end
