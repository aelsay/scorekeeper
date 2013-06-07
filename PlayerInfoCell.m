//
//  PlayerInfoCell.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/11/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "PlayerInfoCell.h"

@implementation PlayerInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _jerseyNumber = [[UITextField alloc] init];
        _playerName = [[UITextField alloc] init];
        _playerPosition = [[UITextField alloc] init];
        [self.contentView addSubview:_jerseyNumber];
        [self.contentView addSubview:_playerName];
        [self.contentView addSubview:_playerPosition];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
