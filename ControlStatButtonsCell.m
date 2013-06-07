//
//  FiveButtonsCell.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/21/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "ControlStatButtonsCell.h"

@implementation ControlStatButtonsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _button1 = [[UIButton alloc] init];
        _button2 = [[UIButton alloc] init];
        _button3 = [[UIButton alloc] init];
        _button4 = [[UIButton alloc] init];
        [self.contentView addSubview:_button1];
        [self.contentView addSubview:_button2];
        [self.contentView addSubview:_button3];
        [self.contentView addSubview:_button4];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
