//
//  LabelAndTextFieldCell.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/9/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "LabelAndTextFieldCell.h"

@implementation LabelAndTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Set cell style
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _label = [[UILabel alloc] init];
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_label];
        [self.contentView addSubview:_textField];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    /*  limit to only numeric characters  */
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++)
    {
        unichar c = [string characterAtIndex:i];
        if ([characterSet characterIsMember:c] && [_textField.text length] < 2) // Check if char is valid, and text field limit
            return YES;
        else
            return NO;
    }
    /*  limit the users input to only 9 characters  */
    NSUInteger newLength = [_textField.text length] + [string length] - range.length;
    return (newLength > 2) ? NO : YES;
}

@end
