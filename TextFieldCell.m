//
//  TextFieldCell.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/8/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "TextFieldCell.h"

@implementation TextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Set cell style
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_textField];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
