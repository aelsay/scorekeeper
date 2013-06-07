//
//  PlayerStatsCell.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/16/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "PlayerStatsCell.h"

@implementation PlayerStatsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        // Set cell style
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // Setup the cell and add the labels to the view
        _playerName = [[UILabel alloc] init];
        _statLabel1 = [[UILabel alloc] init];
        _statLabel2 = [[UILabel alloc] init];
        _statLabel3 = [[UILabel alloc] init];
        _statLabel4 = [[UILabel alloc] init];
        _statLabel5 = [[UILabel alloc] init];
        _statLabel6 = [[UILabel alloc] init];
        _statLabel7 = [[UILabel alloc] init];
        [self.contentView addSubview: _playerName];
        [self.contentView addSubview: _statLabel1];
        [self.contentView addSubview: _statLabel2];
        [self.contentView addSubview: _statLabel3];
        [self.contentView addSubview: _statLabel4];
        [self.contentView addSubview: _statLabel5];
        [self.contentView addSubview: _statLabel6];
        [self.contentView addSubview: _statLabel7];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
