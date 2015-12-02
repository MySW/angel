//
//  WYLTView.m
//  Notes
//
//  Created by 钱钱 on 14-6-16.
//  Copyright (c) 2014年 guoming. All rights reserved.
//

#import "WYLTView.h"

@implementation WYLTView

#pragma mark - 重写dealloc方法
- (void)dealloc
{
    [_label release];
    [_textField release];
    
    [super dealloc];
}

#pragma mark 重写initWithFrame:
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 添加上label
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 4, frame.size.height)];
        _label.backgroundColor = [UIColor clearColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
        [self addSubview:_label];
        
        // 添加TextField
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 4 , 0, frame.size.width / 4 * 3, frame.size.height)];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.font = [UIFont systemFontOfSize:12];
        [self addSubview:_textField];
        
    }
    return self;
}


#pragma mark - 重写setter和getter方法
#pragma mark labelText
- (void)setLabelText:(NSString *)labelText
{
    _label.text = labelText;
}
- (NSString *)labelText
{
    return _label.text;
}


#pragma mark labelTextColor 的 setter方法
- (void)setLabelTextColor:(UIColor *)labelTextColor
{
    _label.textColor = labelTextColor;
}

#pragma mark textFieldText
- (void)setTextFieldText:(NSString *)textFieldText
{
    _textField.text = textFieldText;
}
- (NSString *)textFieldText
{
    return _textField.text;
}

#pragma mark textFieldPlaceholder
- (void)setTextPlaceholder:(NSString *)textPlaceholder
{
    _textField.placeholder = textPlaceholder;
}
- (NSString *)textPlaceholder
{
    return _textField.placeholder;
}

#pragma mark secureTextEntry
- (void)setSecureTextEntry:(BOOL)secureTextEntry
{
    _textField.secureTextEntry = secureTextEntry;
}
- (BOOL)isSecureTextEntry
{
    return _textField.secureTextEntry;
}

#pragma mark delegate
- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    _textField.delegate = delegate;
}

#pragma mark NSTextAligment
- (void)setTextFieldTextAlignment:(NSTextAlignment)textFieldTextAlignment
{
    _textField.textAlignment = textFieldTextAlignment;
}
- (NSTextAlignment)textFieldTextAlignment
{
    return _textField.textAlignment;
}

#pragma mark 实现初始化方法
- (instancetype)initWithFrame:(CGRect)frame
                withLabelText:(NSString *)text
{
    self = [self initWithFrame:frame];
    if (self) {
        _label.text = text;
    }
    return self;
}

#pragma mark textFiledBackgroundColor
- (void)settextFieldBackgroundColor:(UIColor *)textFieldBackgroundColor
{
    _textField.backgroundColor = textFieldBackgroundColor;
}
- (UIColor *)textFieldBackgroundColor
{
    return _textField.backgroundColor;
}


@end
