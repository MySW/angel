//
//  WYLTView.h
//  Notes
//
//  Created by 钱钱 on 14-6-16.
//  Copyright (c) 2014年 guoming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLTView : UIView <UITextFieldDelegate>
{
    UILabel *_label;             // 标签
}

@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, copy) NSString *labelText;        // 标签的文字
@property (nonatomic, retain) UIColor *labelTextColor;  // 标签的颜色
@property (nonatomic, retain) UIColor *textFieldBackgroundColor;  // textField背景颜色
@property (nonatomic, copy) NSString *textFieldText;    // 输入框内容
@property (nonatomic, copy) NSString *textPlaceholder;      // 占位符
@property (nonatomic) NSTextAlignment  textFieldTextAlignment; // 对齐方式


@property (nonatomic, assign, getter = isSecureTextEntry) BOOL secureTextEntry;     // 设置是否以圆点方式显示文字
@property (nonatomic, assign) id<UITextFieldDelegate> delegate; // 输入框的代理


#pragma mark 初始化方法
- (instancetype)initWithFrame:(CGRect)frame withLabelText:(NSString *)text;

@end
